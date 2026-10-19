# 38 · CampusAir

> **Alan:** J. Gömülü sistemler ve nesnelerin interneti · **Zorluk:** Orta · **Tür:** Ürün + deneysel araştırma · **Ekip:** 2–3 kişi · **MVP:** 5–6 hafta

## Basitçe anlatalım

Mutfak tartın ucuz bir tartıysa, üzerine bir kilo şeker koyduğunda 950 gram ya da 1050 gram gösterebilir. Bu sorun değil, çünkü bunu bir kez fark edersen "bu tartı hep 50 gram fazla gösteriyor" deyip düzeltebilirsin. Buna **kalibrasyon** denir.

Hava kalitesini ölçen profesyonel cihazlar çok pahalıdır, bu yüzden şehirde sayıları azdır. Ucuz sensörlerle yüzlerce noktada ölçüm yapmak mümkün ama ucuz sensörler nem, sıcaklık ve zamanla yanlış ölçmeye başlar. CampusAir, kampüse yerleştirilecek ucuz hava kalitesi sensörlerinden bir ağ kurar ve bu sensörleri **doğru ölçecek şekilde nasıl kalibre edebileceğimizi** araştırır.

**Tek cümleyle:** Düşük maliyetli partikül madde (PM2.5) sensörlerinden kampüs ölçekli bir hava kalitesi ağı kuran ve bu sensörlerin referans ölçümlerle kalibrasyon yöntemlerini karşılaştıran bir proje.

## Problem

Hava kirliliği ciddi bir sağlık sorunudur ve kirlilik birkaç yüz metre içinde bile büyük farklılık gösterebilir. Resmî ölçüm istasyonları pahalı ve seyrektir. Düşük maliyetli sensörler yoğun ölçüm imkânı verir ancak yüksek nemde ve farklı toz türlerinde sistematik hata yaparlar. Kalibre edilmemiş ucuz sensör verisi yanıltıcı sonuçlara yol açabilir.

## Ne geliştirilecek?

- PM2.5, sıcaklık ve nem ölçen **sensör istasyonu** (dış ortama dayanıklı kutu dahil)
- İstasyonlardan veri toplayan sunucu ve veritabanı
- Kalibrasyon modelleri: ham sensör verisini düzelten yazılım
- Kampüs haritası üzerinde güncel ve geçmiş ölçümleri gösteren **web panosu**
- Açık veri olarak yayımlanabilecek ölçüm arşivi

## Araştırma sorusu

> Düşük maliyetli PM2.5 sensörlerinin ölçümleri, basit doğrusal düzeltme, nem düzeltmesi içeren regresyon ve makine öğrenmesi tabanlı kalibrasyon yöntemleriyle referans ölçümlere ne kadar yaklaştırılabilir?

## Deney tasarımı

1. **Referans:** Sensörlerden en az ikisini, en yakın resmî hava kalitesi istasyonunun yanına (izin alınarak) veya referans kabul edilen bir cihazın yanına birkaç hafta yerleştir. Alternatif olarak Çevre, Şehircilik ve İklim Değişikliği Bakanlığı'nın istasyon verisini kullan.
2. **Yöntemler:**
   - (A) Ham sensör verisi — baseline
   - (B) Basit doğrusal düzeltme
   - (C) Nem ve sıcaklığı da içeren çoklu regresyon
   - (D) Gradient boosting gibi makine öğrenmesi modeli
3. Verinin bir dönemiyle modeli eğit, sonraki dönemle test et (zaman sırasına dikkat).
4. Kalibre edilen modelleri kampüsteki diğer sensörlere uygula ve sensörler arası tutarlılığı ölç.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Ortalama hata (MAE) | Sensör referanstan ortalama ne kadar farklı? | µg/m³ |
| Uyum (R²) | Sensör ile referans ne kadar birlikte hareket ediyor? | Regresyon |
| Yüksek nemdeki hata | Nem %80'in üzerindeyken hata ne kadar? | Alt küme analizi |
| Veri sürekliliği | İstasyonlar zamanın yüzde kaçında veri gönderdi? | Kayıt analizi |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **PM2.5** | 2,5 mikrometreden küçük, akciğerlere kadar ulaşabilen havadaki toz parçacıkları |
| **µg/m³** | Bir metreküp havadaki parçacık miktarı (mikrogram) |
| **Kalibrasyon** | Bir ölçüm cihazının hatalarını, doğru kabul edilen bir referansla karşılaştırarak düzeltme |
| **Referans cihaz** | Doğruluğu onaylanmış, karşılaştırma için kullanılan pahalı ölçüm cihazı |
| **Sistematik hata** | Hep aynı yönde tekrarlanan hata (hep fazla gösterme gibi) |
| **Higroskopik büyüme** | Nemli havada toz parçacıklarının su çekip büyümesi ve sensörün fazla ölçmesi |
| **Regresyon** | Bir değeri diğer değerlerden tahmin eden istatistiksel model |
| **R²** | Modelin değişimin ne kadarını açıklayabildiğini gösteren 0–1 arası değer |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, yerleşim izinleri için üniversiteyle iletişime geç |
| 1–3 | Keşif (K1) | İlk istasyonun kurulması, veri toplama sunucusu, referans verisine erişim |
| 4–6 | Geliştirme | **MVP:** 2–3 istasyondan veri toplayan sistem ve basit pano |
| 7–8 | Geliştirme (K2) | Referans yanında kalibrasyon ölçümleri; ara değerlendirme |
| 9–11 | Tamamlama | Kalibrasyon modelleri, ağın genişletilmesi |
| 12–13 | Tamamlama | Harita panosu, açık veri yayını, belgeler |
| 14 | Sonuç (K3) | Teknik rapor ve kampüs hava kalitesi özeti |

## Başlamadan önce

**Bilmen iyi olur:** Temel C/C++ veya MicroPython, Python, temel istatistik.
**Öğreneceklerin:** Nesnelerin interneti, sensör kalibrasyonu, zaman serisi verisi, web panosu geliştirme.
**Önerilen teknolojiler:** ESP32, PMS5003 veya SPS30 sensörü, BME280, MQTT, InfluxDB veya PostgreSQL, Grafana veya kendi web panosu.

## Dikkat!

- Sensörleri yerleştirmeden önce üniversiteden izin al; elektrik ve ağ erişimini önceden planla.
- Kutunun havalandırması ölçümü doğrudan etkiler; güneş altında ısınan kapalı kutu yanlış sıcaklık ve nem verir.
- Sonuçları yayımlarken bunların resmî ölçüm olmadığını açıkça belirt.

## Projeyi genişletme fikirleri

- [LowPower Node](37-lowpower-node.md) ile güneş enerjili, kablosuz istasyonlar
- Ders saatleri, trafik ve hava durumu ile kirlilik ilişkisinin analizi
- Diğer üniversitelerle ortak açık sensör ağı

## Kaynaklar

- [sensor.community](https://sensor.community/) — topluluk tabanlı hava kalitesi sensör ağı
- Barkjohn ve ark. (2021) — *Development and application of a United States-wide correction for PM2.5 data collected with the PurpleAir sensor*
- [Ulusal Hava Kalitesi İzleme Ağı](https://sim.csb.gov.tr/)
- [Grafana](https://grafana.com/)
