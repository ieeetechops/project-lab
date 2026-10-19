# 11 · SchemaSafe

> **Alan:** C. Yazılım mühendisliği · **Zorluk:** Orta · **Tür:** Ürün + deneysel araştırma · **Ekip:** 2 kişi · **MVP:** 5 hafta

## Basitçe anlatalım

Kütüphanedeki tüm kitapları yeni bir sınıflandırma sistemine göre yeniden dizeceksin. Bunu kütüphane açıkken yaparsan okuyucular aradıkları kitabı bulamaz. Yarıda bir hata fark edersen eski düzene geri dönmek de çok zor olur.

Veritabanları da kütüphane gibidir. Uygulama geliştikçe tabloların yapısını değiştirmek gerekir: yeni sütun eklemek, birini silmek, adını değiştirmek. Bu değişikliklere **migration** denir. Yanlış bir migration verileri silebilir, siteyi dakikalarca kilitleyebilir veya geri alınamaz hale gelebilir. SchemaSafe, değişikliği gerçek veritabanına uygulamadan önce **bir kopyası üzerinde prova eder** ve riskleri listeler: "Bu işlem tabloyu 3 dakika kilitler", "Bu sütunu silersen eski uygulama çöker", "Bunun geri dönüşü yok".

**Tek cümleyle:** Veritabanı değişikliklerini test ortamında prova edip riskleri önceden gösteren bir araç.

## Problem

Veritabanı migration'ları üretim kesintilerinin en sık nedenlerinden biridir. Geliştiriciler genellikle migration'ı boş bir test veritabanında çalıştırır; ancak gerçek boyutta veriyle kilitlenme süresi, eski uygulama sürümüyle uyumsuzluk ve geri alma senaryoları test edilmez.

## Ne geliştirilecek?

- Migration dosyalarını okuyup **riskli işlemleri işaretleyen** statik kontrol aracı
- Gerçekçi boyutta sentetik veriyle migration'ı **prova eden** test düzeneği (Docker)
- Eski ve yeni uygulama sürümünü migration sırasında **aynı anda çalıştıran** uyumluluk testi
- **Geri alma** (rollback) senaryolarını otomatik deneyen modül
- PR'larda çalışan risk raporu

## Araştırma sorusu

> Statik kurallarla tespit edilen migration riskleri, gerçek boyutlu veriyle yapılan provada gözlenen kilitlenme, uyumsuzluk ve geri dönüş sorunlarıyla ne kadar örtüşür; hangi değişiklik türleri en fazla gizli risk taşır?

## Deney tasarımı

1. **Migration kataloğu:** sütun ekleme (varsayılan değerli/değersiz), sütun silme, yeniden adlandırma, tip değiştirme, NOT NULL ekleme, indeks oluşturma vb. (en az 15 tür).
2. **Veri boyutları:** 10 bin, 1 milyon, 10 milyon satır.
3. Her migration için ölç: süre, tablo kilidi süresi, eski uygulamanın hata verip vermediği, geri alınabilirlik.
4. Statik kontrol aracının tahminlerini prova sonuçlarıyla karşılaştır. Baseline: mevcut bir linter (ör. squawk).

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Risk tespit doğruluğu | Statik uyarılar gerçekten sorun çıkardı mı? | Precision / recall |
| Kilit süresi | Tablonun kullanılamadığı süre | PostgreSQL kilit izleme |
| Uyumsuzluk tespiti | Eski uygulama sürümü bozuldu mu? | Uygulama testleri |
| Geri alınabilirlik | Rollback başarılı ve veri kaybı yok mu? | Veri karşılaştırma |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Şema** | Veritabanındaki tabloların ve sütunların yapısı |
| **Migration** | Şemayı bir sürümden diğerine değiştiren betik |
| **Rollback** | Bir değişikliği geri almak |
| **Tablo kilidi** | Değişiklik sürerken tablonun okunamaması veya yazılamaması |
| **Expand–contract deseni** | Önce yeniyi ekle, uygulamayı geçir, sonra eskiyi sil; kesintisiz değişiklik yöntemi |
| **Sıfır kesintili dağıtım** | Kullanıcılar fark etmeden yeni sürüme geçmek |
| **Sentetik veri** | Gerçeğe benzeyen ama gerçek kişilere ait olmayan, üretilmiş veri |
| **İndeks** | Veritabanında aramayı hızlandıran yapı (kitabın sonundaki dizin gibi) |
| **ORM** | Veritabanı tablolarını programlama dilindeki nesnelerle eşleyen araç |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Bilinen migration kazalarını araştır |
| 1–3 | Keşif (K1) | PostgreSQL + Docker ortamı, sentetik veri üretici, mevcut linter baseline'ı |
| 4–8 | Geliştirme (K2) | **MVP:** statik kontrol + prova düzeneği; ara değerlendirme |
| 9–11 | Tamamlama | Eski/yeni sürüm uyumluluk testi, rollback deneyleri, tam katalog ölçümü |
| 12–13 | Tamamlama | GitHub Action, risk raporu, belgeler |
| 14 | Sonuç (K3) | Teknik rapor: en riskli migration türleri ve güvenli alternatifleri |

## Başlamadan önce

**Bilmen iyi olur:** SQL (CREATE, ALTER, SELECT), bir backend dili, Docker temelleri.
**Öğreneceklerin:** Veritabanı iç işleyişi (kilitler, transaction), güvenli dağıtım teknikleri, test otomasyonu.
**Önerilen teknolojiler:** PostgreSQL, Docker, Python veya Go, Alembic / Prisma / Flyway (migration araçları).

## Dikkat!

- **Gerçek kişisel veri kullanma.** Sentetik veri üret.
- PostgreSQL sürümüne göre bazı işlemlerin kilit davranışı farklıdır; sürümü rapora yaz.
- Tek bir veritabanı türüyle başla; kapsamı genişletme isteğine diren.

## Projeyi genişletme fikirleri

- MySQL desteği
- TechOps projelerinde zorunlu migration kontrolü

## Kaynaklar

- [PostgreSQL: Explicit Locking](https://www.postgresql.org/docs/current/explicit-locking.html)
- [squawk](https://github.com/sbdchd/squawk) — PostgreSQL migration linter
- [Expand and contract (Martin Fowler — Parallel Change)](https://martinfowler.com/bliki/ParallelChange.html)
- [Flyway](https://documentation.red-gate.com/flyway) / [Alembic](https://alembic.sqlalchemy.org)
