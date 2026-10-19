# 10 · ChangeImpact

> **Alan:** C. Yazılım mühendisliği · **Zorluk:** Orta–İleri · **Tür:** Ürün + deneysel araştırma · **Ekip:** 2 kişi · **MVP:** 6 hafta

## Basitçe anlatalım

Bir domino dizisi düşün. Birini ittiğinde hangilerinin devrileceğini bilmek istiyorsun. Taşların nasıl dizildiğine bakarak tahmin edebilirsin, ama bazen arada görünmeyen ipler vardır ve hiç beklemediğin bir taş da devrilir.

Büyük bir yazılımda bir dosyayı değiştirdiğinde de aynısı olur: o dosyayı kullanan başka dosyalar, onları kullanan başka dosyalar etkilenebilir. ChangeImpact, **"bu değişikliği yaparsan şu modüller ve şu testler etkilenebilir"** diyen bir harita çizer. Böylece 2 saat sürecek testlerin hepsini değil, sadece ilgili olanları çalıştırabilirsin. Araştırma kısmında da bu haritanın gerçekte ne kadar doğru tahmin ettiğini ölçeriz.

**Tek cümleyle:** Bir kod değişikliğinin hangi modülleri ve testleri etkileyeceğini tahmin eden ve bu tahminin doğruluğunu ölçen bir bağımlılık analiz aracı.

## Problem

Büyük projelerde tüm testleri her değişiklikte çalıştırmak çok uzun sürer; hiç çalıştırmamak ise risklidir. Statik bağımlılık analizi (hangi dosya hangi dosyayı içe aktarıyor) bir tahmin sunar ama dinamik çağrılar, yapılandırma dosyaları ve dolaylı etkiler nedeniyle eksik veya fazla olabilir.

## Ne geliştirilecek?

- Bir depodaki modüller arası **bağımlılık grafiğini** çıkaran araç
- Bir commit veya PR için **etkilenen modül ve test listesi** üreten CLI
- Grafiği görselleştiren basit web arayüzü
- Sadece etkilenen testleri çalıştıran **CI entegrasyonu**

## Araştırma sorusu

> Statik bağımlılık analizi, bir kod değişikliğinin gerçek etkisini (hangi testlerin sonucu değişti) ne kadar iyi tahmin eder; sadece tahmin edilen testleri çalıştırmak ne kadar zaman kazandırır ve kaç hatayı kaçırır?

## Deney tasarımı

1. 2–3 açık kaynak proje seç (Python veya JavaScript).
2. Geçmiş commit'leri al. Her commit için:
   - Araç hangi testleri "etkilenir" diyor?
   - Gerçekte tüm testleri çalıştırınca hangilerinin sonucu değişiyor?
3. Ek deney: kodlara bilerek küçük hatalar ekle; seçilen test alt kümesi hatayı yakalıyor mu?
4. Baseline: her seferinde tüm testleri çalıştırmak ve rastgele test seçimi.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Güvenlik (safety) | Gerçekten etkilenen testlerin yüzde kaçı seçildi? | Recall |
| Seçicilik | Seçilen testlerin yüzde kaçı gerçekten gerekliydi? | Precision |
| Zaman kazancı | Tüm testlere göre ne kadar hızlandı? | Dakika / yüzde |
| Kaçırılan hata | Seçim yüzünden yakalanamayan hata sayısı | Bilerek eklenen hatalar |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Bağımlılık** | Bir kod parçasının çalışmak için başka bir kod parçasına ihtiyaç duyması |
| **Bağımlılık grafiği** | Modülleri nokta, bağımlılıkları ok olarak gösteren harita |
| **Statik analiz** | Kodu çalıştırmadan, sadece okuyarak inceleme |
| **Dinamik analiz** | Kodu çalıştırıp ne yaptığını gözlemleyerek inceleme |
| **Değişiklik etki analizi** | "Bu değişiklik neyi etkiler?" sorusunu cevaplama |
| **Regression test selection** | Değişiklikten sonra sadece gerekli testleri seçip çalıştırma |
| **Monorepo** | Birden fazla projenin tek depoda tutulması |
| **AST** (soyut sözdizim ağacı) | Kodun, bilgisayarın anlayabileceği ağaç yapısına çevrilmiş hali |
| **Kod kapsamı** (coverage) | Testlerin kodun hangi satırlarını çalıştırdığı |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Hedef projeleri seç, test sürelerini ölç |
| 1–3 | Keşif (K1) | Mevcut araçlarla (madge, pydeps) grafik çıkar, "tüm testler" baseline'ı |
| 4–8 | Geliştirme (K2) | **MVP:** commit → etkilenen testler CLI; ara değerlendirme |
| 9–11 | Tamamlama | Geçmiş commit deneyi, hata ekleme deneyi |
| 12–13 | Tamamlama | Görselleştirme, CI entegrasyonu, belgeler |
| 14 | Sonuç (K3) | Teknik rapor: statik analizin sınırları |

## Başlamadan önce

**Bilmen iyi olur:** Python veya JavaScript'te orta seviye, Git'i komut satırından kullanmak, graf kavramı.
**Öğreneceklerin:** Statik analiz, graf algoritmaları, test seçimi araştırması, büyük kod tabanlarında çalışma.
**Önerilen teknolojiler:** Python (ast modülü) veya TypeScript (ts-morph), NetworkX, coverage.py, GitHub Actions.

## Dikkat!

- Dinamik `import`, yansıma (reflection) ve yapılandırma dosyaları statik analizi yanıltır; bunları ayrıca say.
- Recall'u yüksek tutmak, precision'dan daha önemlidir: bir hatayı kaçırmak, fazladan test çalıştırmaktan pahalıdır.

## Projeyi genişletme fikirleri

- Kod kapsamı verisiyle statik grafiği birleştiren hibrit yöntem
- PR'lara "bu değişiklik şu modülleri etkiliyor" yorumu bırakan bot

## Kaynaklar

- [madge](https://github.com/pahen/madge) — JavaScript bağımlılık grafiği
- [pydeps](https://github.com/thebjorn/pydeps) — Python bağımlılık grafiği
- [coverage.py](https://coverage.readthedocs.io)
- Gligoric ve ark. (2015) — *Practical Regression Test Selection with Dynamic File Dependencies* (ISSTA)
