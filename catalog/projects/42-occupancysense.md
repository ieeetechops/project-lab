# 42 · OccupancySense

> **Alan:** K. Bilgisayarlı görü · **Zorluk:** Orta · **Tür:** Deneysel araştırma + prototip · **Ekip:** 2 kişi · **MVP:** 5 hafta

## Basitçe anlatalım

Kütüphaneye gidip boş masa bulamadığın oldu mu? Ya da yemekhaneye girip uzun kuyruğu görünce geri döndüğün? Bir yerin şu an ne kadar dolu olduğunu önceden bilseydin zamanını daha iyi planlardın.

Bir kamera kaç kişi olduğunu sayabilir ama burada önemli bir sorun var: insanlar izlenmek istemez. OccupancySense, bir alandaki **kişi sayısını, kimseyi tanımadan ve görüntü kaydetmeden** tahmin etmeye çalışır. Kamera görüntüsü cihazın içinde işlenir, dışarıya sadece "şu an 23 kişi var" bilgisi çıkar. Bunu yaparken farklı yöntemlerin ne kadar doğru saydığını ve ne kadar mahremiyet koruduğunu karşılaştırırız.

**Tek cümleyle:** Bir alandaki doluluk oranını kişileri tanımlamadan ve görüntü saklamadan tahmin eden, farklı algılama yöntemlerini sayım doğruluğu ve mahremiyet açısından karşılaştıran bir proje.

## Problem

Kütüphane, laboratuvar, yemekhane gibi ortak alanların doluluk bilgisi hem kullanıcılar hem yöneticiler için değerlidir. Kamera tabanlı sayım doğrudur ama kişisel veri işler ve KVKK açısından ciddi yükümlülükler doğurur. Düşük çözünürlüklü termal sensörler veya cihaz üzerinde işleme gibi mahremiyet dostu alternatiflerin doğruluğu ise yeterince bilinmez.

## Ne geliştirilecek?

- Görüntüyü cihazın içinde işleyip **yalnızca kişi sayısını** dışarı gönderen sayım cihazı
- Karşılaştırma için düşük çözünürlüklü termal sensör (ör. 8×8 veya 32×24 piksel) tabanlı sayım
- Görüntüyü kaydetmeyen, işlem sonrası hemen silen ve bunu belgeleyen mimari
- Doluluk bilgisini gösteren basit web panosu
- Veri koruma etki değerlendirmesi (KVKK açısından risk analizi) belgesi

## Araştırma sorusu

> Cihaz üzerinde çalışan kamera tabanlı kişi algılama, düşük çözünürlüklü termal sensör ve kapı geçiş sayımı yöntemleri; farklı doluluk düzeylerinde sayım doğruluğu ve toplanan verinin kimlik belirleme riski açısından nasıl karşılaştırılır?

## Deney tasarımı

1. **Ortam:** İzin alınmış, kontrollü bir oda (ör. kolun toplantı odası) ve gönüllü katılımcılar. Ortak alanlarda ölçüm yapılmadan önce üniversite yönetiminden izin ve katılımcılardan onam alınır.
2. **Yöntemler:**
   - (A) Kapı geçişlerini sayan basit kızılötesi sensör — baseline
   - (B) Düşük çözünürlüklü termal sensör + basit kişi sayma
   - (C) Cihaz üzerinde çalışan hafif kişi algılama modeli (ör. küçük YOLO sürümü)
3. **Senaryolar:** 0–30 kişi arası farklı doluluk, insanların oturduğu/hareket ettiği durumlar, ışık değişimi.
4. Gerçek sayı elle kaydedilir; her yöntemin sayım hatası, gecikmesi ve donanım maliyeti ölçülür.
5. Her yöntemin ürettiği veriden kişi tanımlanabilir mi? Nitel risk değerlendirmesi yapılır.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Sayım hatası | Tahmin edilen kişi sayısı gerçek sayıdan ne kadar farklı? | Ortalama mutlak hata |
| Kalabalıkta hata | Oda dolduğunda hata nasıl değişiyor? | Doluluk düzeyine göre analiz |
| Mahremiyet riski | Toplanan veriden bir kişi tanınabilir mi? | Nitel risk tablosu |
| Maliyet | Cihaz başına donanım maliyeti | TL |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Nesne algılama** | Görüntüde nesnelerin nerede olduğunu kutularla bulma |
| **YOLO** | Görüntüdeki nesneleri tek seferde hızlıca bulan yaygın algılama modeli ailesi |
| **Cihaz üzerinde işleme** (edge processing) | Verinin buluta gönderilmeden cihazın içinde işlenmesi |
| **Termal sensör** | Nesnelerin yaydığı ısıyı ölçen sensör; düşük çözünürlükte kişiyi tanımaz |
| **Veri minimizasyonu** | Amaca yetecek en az veriyi toplama ilkesi |
| **Anonimleştirme** | Verinin hiçbir kişiyle ilişkilendirilemeyecek hale getirilmesi |
| **Veri koruma etki değerlendirmesi** | Bir sistemin kişisel verilere yönelik risklerini önceden analiz eden belge |
| **Örtüşme** (occlusion) | Bir kişinin başka biri veya nesne tarafından kısmen gizlenmesi |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, izin ve onam süreçlerini başlat |
| 1–3 | Keşif (K1) | Donanım seçimi, kapı sayım baseline'ı, risk değerlendirmesi taslağı |
| 4–5 | Geliştirme | **MVP:** cihaz üzerinde kişi sayıp sadece sayıyı gönderen prototip |
| 6–8 | Geliştirme (K2) | Termal sensör yöntemi, web panosu; ara değerlendirme |
| 9–11 | Tamamlama | Kontrollü ortamda karşılaştırma deneyleri |
| 12–13 | Tamamlama | Analiz, risk değerlendirmesinin son hali, belgeler |
| 14 | Sonuç (K3) | Teknik rapor ve öneri |

## Başlamadan önce

**Bilmen iyi olur:** Python, temel makine öğrenmesi, Linux.
**Öğreneceklerin:** Nesne algılama, gömülü yapay zekâ, mahremiyet odaklı tasarım, KVKK uyumu.
**Önerilen teknolojiler:** Raspberry Pi 5 veya Jetson Nano, OpenCV, Ultralytics YOLO, MLX90640 termal sensör, MQTT.

## Dikkat!

- Bu proje kişisel veriye çok yakın çalışır. İzin ve onam alınmadan hiçbir ortak alanda kamera çalıştırma.
- Geliştirme sırasında bile görüntüleri diske kaydetme; test için gönüllülerin onaylı kayıtlarını kullan.
- "Sadece sayı gönderiyoruz" demek yetmez; bunu mimariyle ve kodla kanıtla, belgede açıkla.

## Projeyi genişletme fikirleri

- Kütüphane doluluk tahmini (geçmiş veriden gelecek saatleri tahmin etme)
- Görüntü kullanmayan başka sinyallerle (Wi-Fi bağlantı sayısı, CO₂ sensörü) karşılaştırma
- [PrivacyMetrics](15-privacymetrics.md) yöntemleriyle toplu istatistik yayını

## Kaynaklar

- [Ultralytics YOLO belgeleri](https://docs.ultralytics.com/)
- [KVKK Kişisel Verilerin Korunması Kurumu yayınları](https://www.kvkk.gov.tr/)
- Cavoukian — *Privacy by Design: The 7 Foundational Principles*
- [Adafruit MLX90640 termal kamera kılavuzu](https://learn.adafruit.com/adafruit-mlx90640-ir-thermal-camera)
