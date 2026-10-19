# 17 · DataDoctor

> **Alan:** E. Veri mühendisliği ve yapay zekâ · **Zorluk:** Başlangıç–Orta · **Tür:** Ürün + deneysel araştırma · **Ekip:** 2 kişi · **MVP:** 4–5 hafta

## Basitçe anlatalım

Bir sınıfın not defterini düşün. Biri bir öğrencinin yaşını "150" yazmış, birinin doğum tarihi boş kalmış, bir öğrenci listede iki kez geçiyor, birinin notu "yüz" diye yazıyla girilmiş. Bu deftere bakarak "sınıfın ortalaması kaç?" diye sorarsan yanlış cevap alırsın.

Bilgisayardaki veri tabloları da böyle hatalarla doludur ve bu hatalar o veriyle yapılan her hesabı bozar. DataDoctor, bir veri tablosunu **muayene eden bir doktor** gibi çalışır: eksik, tutarsız ve şüpheli kayıtları bulur, "şu satırlarda sorun var, şu yüzden" diye rapor verir. Asıl merak ettiğimiz şey de şu: hataları elle yazılmış kurallarla mı daha iyi buluruz, yoksa verinin genel düzenine bakan istatistiksel yöntemlerle mi?

**Tek cümleyle:** CSV dosyalarındaki eksik, tutarsız ve şüpheli kayıtları bulan, kural tabanlı ve istatistiksel tespit yöntemlerini karşılaştıran bir veri kalite aracı.

## Problem

Veriyle çalışan herkes zamanının büyük kısmını veriyi temizlemeye harcar. Hatalar çoğu zaman fark edilmez: boş hücreler sessizce sıfır sayılır, aynı kişi iki kez kaydedilir, birimler karışır (kg ve gram). Bu hatalar sonradan yapılan analizi, grafiği ve makine öğrenmesi modelini sessizce bozar.

## Ne geliştirilecek?

- CSV dosyasını okuyup **veri kalite raporu** üreten CLI aracı ve basit web arayüzü
- Kural tanımlama sistemi: "yaş 0 ile 120 arasında olmalı", "e-posta @ içermeli" gibi
- İstatistiksel tespit modülü: uç değerler, beklenmedik dağılımlar, tekrarlı kayıtlar
- Her sorun için **neden şüpheli olduğunu açıklayan** okunabilir rapor (HTML)

## Araştırma sorusu

> Kural tabanlı kontroller ile istatistiksel aykırı değer tespiti, farklı türdeki veri hatalarını hangi başarıyla yakalar? Hangi hata türünde hangisi daha iyi?

## Deney tasarımı

1. **Veri kümesi:** Temiz bir açık veri kümesi seç (ör. bir belediyenin açık verisi). İçine bilerek, türünü ve yerini bildiğin hatalar ekle: eksik değer, imkânsız değer, yazım hatası, tekrarlı kayıt, birim karışıklığı.
2. **Yöntemler:**
   - (A) Elle yazılmış kurallar — baseline
   - (B) Basit istatistik: z-skoru, IQR (çeyrekler arası açıklık)
   - (C) Isolation Forest gibi makine öğrenmesi tabanlı aykırı değer tespiti
   - (D) A + B birleşimi
3. Her yöntem için her hata türünde precision ve recall ölç.
4. Gerçek, kirli bir veri kümesinde de çalıştırıp bulguları elle kontrol et.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Precision | "Hatalı" dediklerinin kaçı gerçekten hatalı? | Eklenen hatalarla karşılaştırma |
| Recall | Eklenen hataların kaçını buldu? | Eklenen hatalarla karşılaştırma |
| Hata türüne göre başarı | Hangi yöntem hangi hata türünde iyi? | Tür bazında tablo |
| Çalışma süresi | 1 milyon satırlık dosyayı ne kadar sürede taradı? | Saniye |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **CSV** | Virgülle ayrılmış değerlerden oluşan basit tablo dosyası |
| **Veri kalitesi** | Verinin ne kadar doğru, eksiksiz ve tutarlı olduğu |
| **Eksik değer** (missing value) | Doldurulması gereken ama boş kalan hücre |
| **Aykırı değer** (outlier) | Diğerlerinden çok farklı, şüpheli görünen değer (ör. yaş = 150) |
| **Z-skoru** | Bir değerin ortalamadan kaç "standart sapma" uzakta olduğu |
| **IQR** | Verinin ortadaki yarısının yayıldığı aralık; dışına çok taşan değerler şüphelidir |
| **Isolation Forest** | Az sayıda soruyla diğerlerinden ayrılabilen kayıtları "aykırı" sayan makine öğrenmesi yöntemi |
| **Tekrarlı kayıt** (duplicate) | Aynı varlığın tabloda birden fazla geçmesi |
| **Veri profili** | Her sütunun türü, boş oranı, en küçük/en büyük değeri gibi özet bilgiler |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, hedef veri kümelerini seç |
| 1–3 | Keşif (K1) | Veri profili çıkaran ilk sürüm, hata ekleme betiği, kural tabanlı baseline |
| 4–5 | Geliştirme | **MVP:** CSV okuyup kalite raporu üreten CLI |
| 6–8 | Geliştirme (K2) | İstatistiksel ve Isolation Forest modülleri; ara değerlendirme |
| 9–11 | Tamamlama | Karşılaştırma deneyi, gerçek kirli veriyle doğrulama |
| 12–13 | Tamamlama | HTML rapor, web arayüzü, belgeler |
| 14 | Sonuç (K3) | Teknik rapor: "hangi hata türüne hangi yöntem?" |

## Başlamadan önce

**Bilmen iyi olur:** Temel Python, Excel veya benzeri bir tabloyla çalışmış olmak.
**Öğreneceklerin:** Veri temizleme, pandas, temel istatistik, ilk makine öğrenmesi modelin, değerlendirme metrikleri.
**Önerilen teknolojiler:** Python, pandas, scikit-learn, Streamlit (arayüz için).

## Dikkat!

- Her aykırı değer hata değildir. 120 yaşında biri nadirdir ama mümkündür; aracın "kesin hata" yerine "şüpheli" demeli.
- Isolation Forest'a hemen atlama. Önce basit kurallar ve istatistikle ne kadar ileri gidebildiğini gör; karşılaştırmanın değeri buradan gelir.
- Kişisel veri içeren veri kümeleri kullanma; açık veri tercih et.

## Projeyi genişletme fikirleri

- Hataları otomatik düzeltme önerileri ("bu değer muhtemelen 15 olmalı")
- Veri kümesinin zaman içinde bozulmasını izleyen sürekli kontrol (veri hattına eklenebilir)
- [OpenData Fusion](19-opendata-fusion.md) projesiyle birlikte çalışma

## Kaynaklar

- [Great Expectations](https://greatexpectations.io/) — veri doğrulama kütüphanesi
- [pandas belgeleri](https://pandas.pydata.org/docs/)
- [scikit-learn: Isolation Forest](https://scikit-learn.org/stable/modules/outlier_detection.html)
- [data.gov.tr](https://data.gov.tr/) ve belediye açık veri portalları
