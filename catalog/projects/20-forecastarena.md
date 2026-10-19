# 20 · ForecastArena

> **Alan:** E. Veri mühendisliği ve yapay zekâ · **Zorluk:** Orta · **Tür:** Deneysel araştırma + açık kaynak laboratuvar · **Ekip:** 2 kişi · **MVP:** 4–5 hafta

## Basitçe anlatalım

Yarın hava nasıl olacak? En basit tahmin şudur: "Bugün nasılsa yarın da öyle olur." Şaşırtıcı ama bu basit tahmin çoğu zaman fena değildir. Şimdi biri gelip "benim süper karmaşık yapay zekâ modelim yarının havasını çok daha iyi tahmin ediyor" diyor. Gerçekten öyle mi? Bunu anlamanın tek yolu, iki tahmini **aynı günler için, aynı kurallarla yarıştırmak**.

ForecastArena, tahmin yöntemlerinin yarıştığı bir **arena**. Elektrik tüketimi, toplu taşıma yolcu sayısı, satışlar gibi zamana bağlı verilerde basit yöntemleri ve makine öğrenmesi yöntemlerini adil koşullarda karşılaştırıyoruz. Sürpriz sonuç çoğu zaman şu oluyor: basit yöntemler sanıldığından çok daha iyi.

**Tek cümleyle:** Zaman serisi tahmin algoritmalarını standart deneylerle karşılaştıran ve basit yöntemlerle makine öğrenmesi yöntemlerini adil koşullarda değerlendiren açık kaynak bir laboratuvar.

## Problem

Tahmin modellerinin başarısı sıklıkla yanlış ölçülür: gelecekteki veri yanlışlıkla eğitime sızar, tek bir veri kümesinde test edilir ya da basit bir baseline ile hiç karşılaştırılmaz. Sonuç olarak "yapay zekâ modeli daha iyi" iddiaları çoğu zaman tekrarlanamaz.

## Ne geliştirilecek?

- Farklı tahmin yöntemlerini aynı arayüzle çalıştıran **Python kütüphanesi**
- Zaman sırasına saygı gösteren **adil değerlendirme düzeni** (geriye dönük kayan pencere testi)
- Birden fazla açık veri kümesi üzerinde otomatik çalışan **liderlik tablosu**
- Sonuçları grafiklerle gösteren rapor sayfası

## Araştırma sorusu

> Farklı türdeki zaman serilerinde (mevsimsel, trendli, gürültülü) basit istatistiksel yöntemler ile makine öğrenmesi yöntemleri arasındaki başarı farkı ne kadar ve hangi koşullarda karmaşık modeller gerçekten fark yaratıyor?

## Deney tasarımı

1. **Veri kümeleri:** En az 4 farklı türde seri: elektrik tüketimi (güçlü mevsimsellik), toplu taşıma yolcu sayısı, hava sıcaklığı, perakende satış. Mümkünse M4 yarışma verilerinden bir alt küme.
2. **Yöntemler:**
   - (A) Naive: "yarın = bugün" ve mevsimsel naive: "gelecek pazartesi = bu pazartesi" — baseline
   - (B) Hareketli ortalama ve üstel düzeltme (ETS)
   - (C) ARIMA
   - (D) Gradient boosting (LightGBM) ile özellik tabanlı tahmin
   - (E) İsteğe bağlı: küçük bir sinir ağı
3. Geriye dönük kayan pencere testi uygula; hiçbir model geleceği görmesin.
4. Her seri türü için yöntemleri MAE, MASE ve hesaplama süresiyle karşılaştır.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| MAE | Tahminler ortalama ne kadar şaşıyor? | Mutlak hataların ortalaması |
| MASE | Model, naive tahminden ne kadar iyi? (1'den küçükse iyi) | Naive hataya bölünmüş hata |
| Eğitim + tahmin süresi | Yöntem ne kadar hesaplama gerektiriyor? | Saniye |
| Kazanma oranı | Kaç veri kümesinde en iyi sonucu verdi? | Sayım |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Zaman serisi** | Zaman sırasıyla ölçülmüş değerler (günlük sıcaklık, saatlik tüketim) |
| **Mevsimsellik** | Düzenli tekrar eden desen (her pazartesi yüksek, her yaz düşük) |
| **Trend** | Uzun vadede artma veya azalma eğilimi |
| **Naive tahmin** | "Bir sonraki değer son değerle aynı olur" diyen en basit tahmin |
| **ARIMA** | Geçmiş değerlere ve geçmiş hatalara bakarak tahmin yapan klasik istatistik modeli |
| **Üstel düzeltme** (ETS) | Yakın geçmişe daha fazla ağırlık veren ortalama tabanlı tahmin |
| **Veri sızıntısı** | Modelin eğitimde, tahmin anında bilinemeyecek bir bilgiyi görmesi |
| **Kayan pencere testi** (backtesting) | Modeli geçmişte farklı tarihlerden "geleceği tahmin et" diye defalarca sınamak |
| **MAE / MASE** | Ortalama mutlak hata / naive tahmine göre ölçeklenmiş hata |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, veri kümelerini seç |
| 1–3 | Keşif (K1) | Verileri indir ve incele, naive baseline'ları ve değerlendirme düzenini kur |
| 4–5 | Geliştirme | **MVP:** 2 veri kümesinde 3 yöntemi adil şekilde karşılaştıran kütüphane |
| 6–8 | Geliştirme (K2) | ARIMA, ETS ve LightGBM; ara değerlendirme |
| 9–11 | Tamamlama | Tüm veri kümelerinde deney, istatistiksel karşılaştırma |
| 12–13 | Tamamlama | Liderlik tablosu sayfası, yeni yöntem ekleme kılavuzu |
| 14 | Sonuç (K3) | Teknik rapor: "Karmaşık model ne zaman değer?" |

## Başlamadan önce

**Bilmen iyi olur:** Python, temel istatistik (ortalama, varyans), grafik çizmiş olmak.
**Öğreneceklerin:** Zaman serisi analizi, tahmin modelleri, adil değerlendirme, deney tasarımı.
**Önerilen teknolojiler:** Python, pandas, statsmodels veya statsforecast, LightGBM, matplotlib.

## Dikkat!

- En sık hata veri sızıntısıdır: veriyi rastgele karıştırıp eğitim/test diye bölme. Zaman serisinde test verisi her zaman eğitim verisinden **sonra** gelmelidir.
- Naive baseline'ı ciddiye al. Modelin onu geçemiyorsa bu da raporlanması gereken bir sonuçtur.
- Hiperparametre ayarlamasını test verisi üzerinde yapma.

## Projeyi genişletme fikirleri

- Tahminlere belirsizlik aralığı ekleme ("yarın 20–24 derece arası")
- Yeni yöntemleri GitHub'dan PR olarak kabul eden açık bir yarışma
- [CacheLab](25-cachelab.md) gibi diğer "arena" projeleriyle ortak değerlendirme altyapısı

## Kaynaklar

- Hyndman & Athanasopoulos — [*Forecasting: Principles and Practice*](https://otexts.com/fpp3/) (ücretsiz çevrimiçi kitap)
- Makridakis ve ark. (2020) — *The M4 Competition: 100,000 time series and 61 forecasting methods*
- [statsforecast](https://github.com/Nixtla/statsforecast)
- [EPİAŞ Şeffaflık Platformu](https://seffaflik.epias.com.tr/) — Türkiye elektrik tüketim verisi
