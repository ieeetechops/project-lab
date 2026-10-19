# 58 · NoiseClean

> **Alan:** O. Ses, müzik ve dijital sanat teknolojileri · **Zorluk:** Orta · **Tür:** Deneysel araştırma + kullanıcı değerlendirmesi · **Ekip:** 2 kişi · **MVP:** 4–5 hafta

## Basitçe anlatalım

Kalabalık bir kafede telefonla konuşurken karşı taraf seni anlamakta zorlanır: arkadan gelen sohbetler, bardak sesleri, müzik. Online derslerde de durum aynı: birinin mikrofonundan klima uğultusu, diğerinin mikrofonundan klavye sesi gelir.

Bilgisayar bu gürültüyü konuşmadan ayırabilir mi? Klasik yöntemler önce "sessiz anlarda duyulan sesi" gürültü olarak kabul eder ve konuşma sırasında bunu çıkarmaya çalışır. Yeni yöntemler ise binlerce örnekten konuşmanın ve gürültünün nasıl ses çıkardığını öğrenen küçük yapay zekâ modelleri kullanır. NoiseClean, **gürültü azaltma yöntemlerini** hem bilgisayar ölçümleriyle hem de gerçek dinleyicilerle karşılaştırır. Çünkü sayısal olarak iyi görünen bir sonuç, kulağa her zaman iyi gelmeyebilir.

**Tek cümleyle:** Konuşma kayıtlarında gürültü azaltma için klasik sinyal işleme yöntemleri ile hafif sinir ağı modellerini nesnel ölçütler ve dinleyici testleriyle karşılaştıran bir proje.

## Problem

Toplantı, ders kaydı ve podcast gibi uygulamalarda arka plan gürültüsü anlaşılırlığı düşürür. Klasik yöntemler hesaplama açısından hafiftir ama "müzikal gürültü" gibi rahatsız edici yan etkiler oluşturabilir. Derin öğrenme yöntemleri daha başarılıdır ama hesaplama maliyeti yüksektir ve görmedikleri gürültü türlerinde başarısız olabilirler. Nesnel ölçütlerin insan algısıyla ne kadar örtüştüğü de tartışmalıdır.

## Ne geliştirilecek?

- Ses dosyasındaki gürültüyü azaltan **komut satırı aracı ve web arayüzü**
- Uygulanacak yöntemler: spektral çıkarma, Wiener filtresi, hazır hafif sinir ağı modeli (ör. RNNoise)
- Temiz konuşma ile gürültüyü farklı oranlarda karıştıran **test kümesi üreteci**
- Dinleyici testi için kör karşılaştırma yapılan web sayfası
- Gerçek zamanlı çalışma imkânını ölçen performans testi

## Araştırma sorusu

> Spektral çıkarma, Wiener filtresi ve sinir ağı tabanlı gürültü azaltma yöntemleri; farklı gürültü türleri ve sinyal-gürültü oranlarında nesnel kalite ve anlaşılırlık ölçütleri ile dinleyici puanları açısından nasıl karşılaştırılır? Nesnel ölçütler dinleyici tercihlerini ne ölçüde öngörür?

## Deney tasarımı

1. **Veri:** Açık konuşma veri kümelerinden temiz kayıtlar (ör. Common Voice Türkçe) ve açık gürültü kayıtları (kafe, trafik, klima, klavye); 0, 5, 10, 15 dB sinyal-gürültü oranlarında karıştırılır.
2. **Yöntemler:** İşlenmemiş gürültülü kayıt — baseline; spektral çıkarma, Wiener filtresi, sinir ağı modeli.
3. **Nesnel ölçüm:** PESQ (kalite), STOI (anlaşılırlık), SNR iyileşmesi.
4. **Dinleyici testi:** 20–30 gönüllü, kör olarak dinledikleri kayıtları 1–5 arası puanlar (MUSHRA benzeri). Onam alınır.
5. Nesnel ölçütlerle dinleyici puanları arasındaki korelasyon hesaplanır; gerçek zamanlı çalışma oranı ölçülür.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| PESQ | Algılanan konuşma kalitesinin otomatik tahmini | Standart araç |
| STOI | Konuşmanın ne kadar anlaşılır olduğunun otomatik tahmini | Standart araç |
| Dinleyici puanı | İnsanlar sonucu ne kadar iyi buldu? | 1–5 ölçeği (kör test) |
| Gerçek zamanlılık | 1 saniyelik sesi işlemek ne kadar sürüyor? | Saniye (1'den küçük olmalı) |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Gürültü azaltma** | Kayıttaki istenmeyen sesleri bastırıp konuşmayı belirginleştirme |
| **SNR** (sinyal-gürültü oranı) | Konuşmanın gürültüden ne kadar güçlü olduğu (dB) |
| **Spektral çıkarma** | Gürültünün frekans profilini tahmin edip konuşmadan çıkarma |
| **Wiener filtresi** | Her frekansı, konuşma ve gürültü tahminine göre akıllıca zayıflatan klasik filtre |
| **Müzikal gürültü** | Klasik yöntemlerin bıraktığı, cıvıltıya benzeyen rahatsız edici yan ses |
| **PESQ / STOI** | Konuşma kalitesini ve anlaşılırlığını otomatik ölçen standart yöntemler |
| **Kör test** | Dinleyicinin hangi yöntemi dinlediğini bilmediği test |
| **Korelasyon** | İki ölçümün birlikte artıp azalma derecesi |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, veri kümelerini ve lisanslarını belirle |
| 1–3 | Keşif (K1) | Test kümesi üreteci, spektral çıkarma, nesnel ölçüm altyapısı |
| 4–5 | Geliştirme | **MVP:** iki yöntemle gürültü azaltan ve ölçen araç |
| 6–8 | Geliştirme (K2) | Sinir ağı modeli, dinleyici test sayfası, pilot test; ara değerlendirme |
| 9–11 | Tamamlama | Nesnel deneyler ve dinleyici testi |
| 12–13 | Tamamlama | Korelasyon analizi, araç belgeleri |
| 14 | Sonuç (K3) | Teknik rapor ve demo |

## Başlamadan önce

**Bilmen iyi olur:** Python, temel matematik; Fourier dönüşümü hakkında fikir sahibi olmak faydalı.
**Öğreneceklerin:** Sayısal sinyal işleme, konuşma işleme, dinleyici deneyi tasarımı, istatistik.
**Önerilen teknolojiler:** Python, NumPy, SciPy, librosa, pesq ve pystoi paketleri, RNNoise; Web Audio API.

## Dikkat!

- Common Voice gibi veri kümelerinin kullanım koşullarına uy; konuşmacıları tanımlamaya çalışma.
- Dinleyici testinde kulaklık ve ses seviyesi koşullarını standartlaştır.
- Kendi kaydettiğin seslerde ekip arkadaşlarının sesini kullanacaksan onların da onayını al.

## Projeyi genişletme fikirleri

- Tarayıcıda gerçek zamanlı çalışan sürüm (online toplantılar için)
- Ders kayıtlarının otomatik temizlenmesi için toplu işleme aracı
- Gürültü türünü otomatik tanıyıp yöntemi ona göre seçme

## Kaynaklar

- Loizou — *Speech Enhancement: Theory and Practice*
- Valin (2018) — *A Hybrid DSP/Deep Learning Approach to Real-Time Full-Band Speech Enhancement* (RNNoise)
- [Mozilla Common Voice](https://commonvoice.mozilla.org/)
- [ITU-T P.862 (PESQ)](https://www.itu.int/rec/T-REC-P.862)
