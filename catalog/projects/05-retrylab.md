# 05 · RetryLab

> **Alan:** B. Backend, API ve dağıtık sistemler · **Zorluk:** Orta · **Tür:** Ürün + deneysel araştırma · **Ekip:** 2 kişi · **MVP:** 5 hafta

## Basitçe anlatalım

Bir etkinliğe kayıt oluyorsun ve "Kaydol" düğmesine basıyorsun. Sayfa dönüp duruyor, cevap gelmiyor. Sabırsızlanıp bir daha basıyorsun. Sonra bir daha... Sonuçta sistemde **aynı kişiden 3 kayıt** oluşuyor. Ödeme olsaydı 3 kez para çekilecekti!

Bunu bir **postacıya** benzetebiliriz. Postacı mektubu teslim edip edemediğinden emin değilse bir daha getirir. Akıllı bir alıcı "bu mektubu zaten aldım, üzerindeki numara aynı" deyip ikincisini çöpe atar. RetryLab, sunucuları bu akıllı alıcı gibi yapar: aynı istek kaç kez gelirse gelsin sonuç **tek bir kayıt** olur. Araştırma kısmında da mesajlar karışık sırayla ve tekrar tekrar geldiğinde sistemin gerçekten doğru çalışıp çalışmadığını zorlayarak test ederiz.

**Tek cümleyle:** Aynı istek defalarca gönderilse bile çift kayıt oluşturmayan bir işlem altyapısı ve bunun kaos koşullarında test edilmesi.

## Problem

Ağlar güvenilmezdir: istekler zaman aşımına uğrar, kullanıcılar düğmeye tekrar basar, mesaj kuyrukları aynı mesajı birden fazla kez teslim edebilir. Bu durum çift kayıt, çift ödeme veya tutarsız verilere yol açar. Öğrenci projelerinin büyük kısmı bu senaryoları hiç test etmez.

## Ne geliştirilecek?

- **Idempotency anahtarı** destekli bir API ara katmanı (middleware) / kütüphane
- Mesajları tekrar eden, geciktiren ve sırasını karıştıran bir **kaos test düzeneği**
- Örnek uygulama: etkinlik kaydı ve kontenjan düşürme
- Farklı stratejileri karşılaştıran **test raporu**

## Araştırma sorusu

> Tekrarlı ve sırasız mesaj teslimi altında; idempotency anahtarı, veritabanı benzersizlik kısıtı ve "outbox" deseni gibi stratejiler veri tutarlılığını ne ölçüde korur ve her birinin gecikme maliyeti nedir?

## Deney tasarımı

1. **Strateji sürümleri:**
   - (A) Hiçbir koruma yok — baseline
   - (B) Veritabanında benzersizlik kısıtı
   - (C) Idempotency anahtarı + sonuç önbelleği
   - (D) C + outbox deseni (mesaj kuyruğuna güvenli yazma)
2. **Kaos senaryoları:** her isteği 1–5 kez tekrar et, %10–%50 oranında sırayı karıştır, rastgele zaman aşımları ekle, eşzamanlı 100 kullanıcı.
3. Her senaryodan sonra **değişmezleri** kontrol et: "her kullanıcının en fazla 1 kaydı var", "kontenjan negatif değil".

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Tutarlılık ihlali sayısı | Kaç kez çift kayıt veya yanlış kontenjan oluştu? | Değişmez kontrolleri |
| Gecikme maliyeti | Koruma eklemek isteği ne kadar yavaşlattı? | p50 / p95 ms |
| Throughput | Saniyede işlenen istek | Yük testi |
| Kod karmaşıklığı | Stratejiyi uygulamak ne kadar zor? | Satır sayısı, gereken bileşenler |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Idempotent** | Bir işlemi 1 kez de yapsan 10 kez de yapsan sonucun aynı olması (asansör düğmesine 5 kez basmak gibi) |
| **Idempotency anahtarı** | İsteğe eklenen benzersiz numara; sunucu bu numarayı daha önce gördüyse işlemi tekrar yapmaz |
| **Retry** | Başarısız görünen bir isteği yeniden göndermek |
| **Zaman aşımı** (timeout) | Belirli bir süre cevap gelmezse beklemekten vazgeçmek |
| **At-least-once teslim** | "Mesaj en az bir kez ulaşır ama birden fazla da ulaşabilir" garantisi |
| **Mesaj kuyruğu** | Mesajların sırayla işlenmek üzere bekletildiği sistem (RabbitMQ, Redis Streams vb.) |
| **Outbox deseni** | Veritabanı kaydı ve gönderilecek mesajı aynı işlemde kaydedip mesajı sonra güvenle göndermek |
| **Değişmez** (invariant) | Sistemde her zaman doğru olması gereken kural ("kontenjan eksi olamaz") |
| **Race condition** | İki işlemin aynı anda çalışıp birbirinin sonucunu bozması |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Gerçek sistemlerde çift kayıt örnekleri topla |
| 1–3 | Keşif (K1) | Basit kayıt API'si (baseline), tekrar eden istek betiği, ilk ihlalleri gör |
| 4–8 | Geliştirme (K2) | **MVP:** idempotency middleware + değişmez kontrolleri; ara değerlendirme |
| 9–11 | Tamamlama | Kuyruk, outbox, kaos düzeneği, tüm stratejilerin ölçümü |
| 12–13 | Tamamlama | Kütüphane belgeleri, örnekler, yük testi |
| 14 | Sonuç (K3) | Teknik rapor ve canlı "kaos" demosu |

## Başlamadan önce

**Bilmen iyi olur:** Bir backend dili (Node.js, Python veya Go), SQL temelleri, HTTP.
**Öğreneceklerin:** Dağıtık sistemlerde tutarlılık, veritabanı işlemleri (transaction), yük ve kaos testi.
**Önerilen teknolojiler:** Node.js/Express veya Python/FastAPI, PostgreSQL, Redis, k6 (yük testi), Docker Compose.

## Dikkat!

- Idempotency anahtarı ne kadar süre saklanacak? Sonsuza kadar saklamak bellek sorunu, kısa saklamak koruma açığı yaratır.
- Aynı anahtarla **farklı içerikte** bir istek gelirse ne olacağını tasarla.
- Testlerin rastgele olduğu için seed kullan; bulduğun hatayı tekrar üretebilmelisin.

## Projeyi genişletme fikirleri

- IEEE başvuru/kayıt platformuna entegrasyon
- Farklı dillerde (Python, Go) aynı kütüphane

## Kaynaklar

- [Stripe: Idempotent requests](https://docs.stripe.com/api/idempotent_requests)
- [Transactional outbox deseni](https://microservices.io/patterns/data/transactional-outbox.html)
- Martin Kleppmann — *Designing Data-Intensive Applications* (kitap)
- [k6](https://k6.io) — yük testi aracı
