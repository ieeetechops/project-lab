# 39 · TinyML Bench

> **Alan:** J. Gömülü sistemler ve nesnelerin interneti · **Zorluk:** İleri · **Tür:** Deneysel araştırma · **Ekip:** 2–3 kişi · **MVP:** 5–6 hafta

## Basitçe anlatalım

Telefonuna "Hey Siri" ya da "Ok Google" dediğinde telefon seni duyar ve uyanır. Ama telefon bütün gün seni dinlemek için internetteki büyük bilgisayarlara ses göndermez; bu hem pili bitirir hem de gizliliğini ihlal eder. Bunun yerine cihazın içinde çok küçük bir yapay zekâ modeli sadece o kelimeyi tanımak için sürekli çalışır.

Peki bir yapay zekâ modeli, birkaç yüz kilobayt belleği olan ve birkaç liraya satılan bir mikrodenetleyiciye nasıl sığar? Modeli küçültmek gerekir ama küçülttükçe model hata yapmaya başlar. TinyML Bench, **küçük cihazlarda çalışan yapay zekâ modellerini** farklı küçültme yöntemleriyle deneyip doğruluk, bellek, hız ve enerji arasındaki dengeyi ölçer.

**Tek cümleyle:** Mikrodenetleyiciler üzerinde çalışan küçük makine öğrenmesi modellerinde (ör. anahtar kelime algılama) model küçültme yöntemlerinin doğruluk, bellek, çalışma süresi ve enerji tüketimine etkisini ölçen bir araştırma projesi.

## Problem

Yapay zekâyı buluta veri göndermeden doğrudan sensörün yanında çalıştırmak gizlilik, gecikme ve enerji açısından büyük avantaj sağlar. Ancak mikrodenetleyicilerin belleği ve işlem gücü çok sınırlıdır. Model küçültme yöntemlerinin (nicemleme, budama, küçük mimariler) gerçek donanım üzerindeki etkisi, simülasyondaki tahminlerden farklı olabilir.

## Ne geliştirilecek?

- Anahtar kelime algılama (ör. "evet", "hayır", "dur", "başla") için eğitilmiş model ailesi
- Farklı küçültme yöntemlerini uygulayan **model hazırlama hattı**
- Modelleri mikrodenetleyiciye yükleyip doğruluk, süre ve bellek ölçen **benchmark yazılımı**
- Enerji tüketimi ölçüm düzeneği
- Sonuçları karşılaştıran rapor sayfası

## Araştırma sorusu

> Mikrodenetleyici üzerinde çalışan anahtar kelime algılama modellerinde, 8-bit nicemleme, budama ve daha küçük mimari seçimi; doğruluk, bellek kullanımı, çıkarım süresi ve çıkarım başına enerji arasında nasıl bir denge oluşturur?

## Deney tasarımı

1. **Veri kümesi:** Google Speech Commands; isteğe bağlı olarak ekip tarafından toplanmış küçük bir Türkçe kelime kümesi (gönüllülerden onam alınarak).
2. **Modeller:** Küçük bir CNN ve DS-CNN mimarileri, farklı boyutlarda.
3. **Küçültme yöntemleri:**
   - (A) 32-bit kayan nokta model — baseline (sığıyorsa)
   - (B) Eğitim sonrası 8-bit nicemleme
   - (C) Nicemlemeye duyarlı eğitim
   - (D) Budama + nicemleme
4. Her modeli en az iki farklı mikrodenetleyicide çalıştır (ör. ESP32-S3 ve bir ARM Cortex-M4 kartı).
5. Doğruluk, model boyutu, RAM kullanımı, çıkarım süresi ve çıkarım başına enerji ölç.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Doğruluk | Kelimelerin yüzde kaçı doğru tanındı? | Test kümesi |
| Model boyutu | Model ne kadar flash bellek kaplıyor? | KB |
| Çıkarım süresi | Bir ses parçasını değerlendirmek ne kadar sürüyor? | Milisaniye |
| Çıkarım başına enerji | Bir tahmin ne kadar enerji harcıyor? | Milijoule |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **TinyML** | Makine öğrenmesi modellerini çok küçük, düşük güçlü cihazlarda çalıştırma alanı |
| **Çıkarım** (inference) | Eğitilmiş bir modelin yeni veri üzerinde tahmin yapması |
| **Nicemleme** (quantization) | Model sayılarını 32-bit yerine 8-bit gibi daha küçük sayılarla saklayıp modeli küçültme |
| **Budama** (pruning) | Modelin önemsiz bağlantılarını silerek küçültme |
| **CNN** | Görüntü ve ses verisinde desen bulmada kullanılan sinir ağı türü |
| **MFCC / spektrogram** | Sesi, modelin anlayabileceği bir "ses resmi"ne dönüştürme yöntemleri |
| **Flash / RAM** | Programın saklandığı kalıcı bellek / çalışırken kullanılan geçici bellek |
| **TensorFlow Lite Micro** | Modelleri mikrodenetleyicilerde çalıştırmak için kullanılan kütüphane |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, TinyML temellerini oku, donanımı seç |
| 1–3 | Keşif (K1) | Veri hazırlama, bilgisayarda baseline modeli eğitme |
| 4–6 | Geliştirme | **MVP:** nicemlenmiş modelin mikrodenetleyicide çalışıp kelime tanıması |
| 7–8 | Geliştirme (K2) | Benchmark yazılımı, enerji ölçümü; ara değerlendirme |
| 9–11 | Tamamlama | Tüm küçültme yöntemleriyle deney matrisi |
| 12–13 | Tamamlama | Analiz, model hazırlama hattının belgelenmesi |
| 14 | Sonuç (K3) | Teknik rapor ve canlı demo |

## Başlamadan önce

**Bilmen iyi olur:** Python, temel makine öğrenmesi, C/C++ okuyabilmek.
**Öğreneceklerin:** Sinir ağı eğitimi, model optimizasyonu, gömülü yazılım, enerji ölçümü.
**Önerilen teknolojiler:** TensorFlow/Keras, TensorFlow Lite Micro veya Edge Impulse, ESP32-S3 veya Arduino Nano 33 BLE Sense, akım ölçüm cihazı.

## Dikkat!

- Bilgisayarda yüksek çıkan doğruluk, mikrodenetleyicideki mikrofonla düşebilir; gerçek cihazda kaydedilmiş seslerle de test et.
- Gönüllülerden ses kaydı topluyorsan bu kişisel veridir; onam al ve kayıtları anonim sakla.
- Bazı işlemler belirli mikrodenetleyicilerde desteklenmeyebilir; mimari seçmeden önce kütüphane desteğini kontrol et.

## Projeyi genişletme fikirleri

- Türkçe anahtar kelime veri kümesinin açık olarak yayımlanması
- Ses yerine ivmeölçer ile hareket tanıma (düşme algılama)
- [LowPower Node](37-lowpower-node.md) ile pille çalışan akıllı sensör

## Kaynaklar

- Warden & Situnayake — *TinyML* (O'Reilly)
- Warden (2018) — *Speech Commands: A Dataset for Limited-Vocabulary Speech Recognition*
- [TensorFlow Lite for Microcontrollers](https://ai.google.dev/edge/litert/microcontrollers/overview)
- [MLPerf Tiny](https://mlcommons.org/benchmarks/inference-tiny/) — TinyML benchmark paketi
