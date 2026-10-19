# 34 · LineFollower Lab

> **Alan:** I. Robotik ve otonom sistemler · **Zorluk:** Başlangıç–Orta · **Tür:** Deneysel araştırma + donanım prototipi · **Ekip:** 2–3 kişi · **MVP:** 4–5 hafta

## Basitçe anlatalım

Bisiklet sürerken yolun ortasındaki çizgiyi takip etmeye çalıştığını düşün. Çizgiden biraz sağa kaydığında direksiyonu sola çevirirsin. Çok sert çevirirsen bu sefer sola fazla kayarsın ve zikzak çizmeye başlarsın. Çok yumuşak çevirirsen virajda çizgiyi kaçırırsın. İyi bir sürücü ne kadar çevireceğini kayma miktarına, kaymanın ne kadar sürdüğüne ve ne kadar hızlı arttığına göre ayarlar.

Çizgi izleyen robot da tam olarak bunu yapar. Bu ayarı yapan matematiğe **kontrol algoritması** denir. LineFollower Lab, düşük maliyetli bir robotta farklı kontrol yöntemlerini karşılaştırır: robot pisti ne kadar hızlı ve ne kadar düzgün tamamlıyor?

**Tek cümleyle:** Düşük maliyetli bir çizgi izleyen robot üzerinde PID, bulanık mantık ve parametreleri otomatik ayarlanan kontrol yöntemlerini tur süresi ve çizgiden sapma açısından karşılaştıran bir proje.

## Problem

Kontrol teorisi mühendisliğin temel konularından biridir ama derslerde çoğunlukla denklemler üzerinden anlatılır. Gerçek bir sistemde sensör gürültüsü, motor farklılıkları, pil voltajındaki düşüş gibi etkenler teorideki sonucu değiştirir. PID parametrelerinin elle deneme-yanılmayla ayarlanması da zaman alır ve tekrarlanabilir değildir.

## Ne geliştirilecek?

- Mikrodenetleyici tabanlı, düşük maliyetli **çizgi izleyen robot** (kızılötesi sensör dizisi, iki DC motor, enkoder)
- Farklı kontrol yöntemlerini kolayca değiştirebilen **gömülü yazılım**
- Robotun sensör ve motor verilerini kablosuz olarak gönderen **veri kayıt sistemi**
- Kayıtları analiz edip grafik çizen bilgisayar yazılımı
- Standart **test pistleri** (düz, keskin viraj, S viraj, kesikli çizgi)

## Araştırma sorusu

> Çizgi izleme probleminde elle ayarlanmış PID, bulanık mantık denetleyici ve parametreleri otomatik ayarlanan PID; farklı pist türlerinde tur süresi, çizgiden ortalama sapma ve çizgiyi kaybetme sayısı açısından nasıl karşılaştırılır?

## Deney tasarımı

1. **Pistler:** 4 standart pist, her biri kâğıda veya branda üzerine aynı ölçülerde basılır.
2. **Yöntemler:**
   - (A) Sadece oransal (P) kontrol — baseline
   - (B) Elle ayarlanmış PID
   - (C) Bulanık mantık denetleyici
   - (D) Otomatik ayarlanmış PID (ör. Ziegler–Nichols veya basit optimizasyonla)
3. Her yöntem her pistte en az 10 tur atar; pil voltajı her denemeden önce kaydedilir.
4. Tur süresi, çizgiden ortalama ve en büyük sapma, çizgiyi kaybetme sayısı ölçülür.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Tur süresi | Pist ne kadar sürede tamamlandı? | Saniye (sensörle başlangıç/bitiş) |
| Ortalama sapma | Robot çizginin merkezinden ortalama ne kadar uzak kaldı? | Sensör kaydı |
| Çizgi kaybı | Robot çizgiyi kaç kez tamamen kaybetti? | Sayım |
| Tutarlılık | Aynı ayarla turlar arasındaki fark | Standart sapma |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Kontrol algoritması** | Sistemin hatasına bakıp ne yapılacağına karar veren hesap |
| **Hata** | İstenen durum ile mevcut durum arasındaki fark (çizgiden sapma) |
| **PID** | Hatanın büyüklüğüne (P), birikmiş geçmişine (I) ve değişim hızına (D) göre tepki veren denetleyici |
| **Bulanık mantık** | "Biraz sağda", "çok sağda" gibi kesin olmayan kurallarla karar veren yöntem |
| **Salınım** | Sistemin hedefin etrafında sağa sola gidip gelmesi |
| **Enkoder** | Tekerleğin ne kadar döndüğünü ölçen sensör |
| **PWM** | Motora giden gücü hızlıca açıp kapatarak hızını ayarlama yöntemi |
| **Mikrodenetleyici** | Robotun beyni olan küçük, düşük güçlü bilgisayar (ESP32, Arduino) |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, malzeme listesini ve bütçeyi çıkar |
| 1–3 | Keşif (K1) | Robotun montajı, sensör kalibrasyonu, P kontrol baseline'ı |
| 4–5 | Geliştirme | **MVP:** PID ile pisti tamamlayan ve veri kaydeden robot |
| 6–8 | Geliştirme (K2) | Bulanık mantık ve otomatik ayar; ara değerlendirme |
| 9–11 | Tamamlama | Tüm pistlerde deneyler |
| 12–13 | Tamamlama | Analiz, montaj ve yazılım belgeleri |
| 14 | Sonuç (K3) | Teknik rapor ve canlı demo |

## Başlamadan önce

**Bilmen iyi olur:** Temel C/C++, temel elektronik (direnç, gerilim), lehim yapabilmek faydalı.
**Öğreneceklerin:** Kontrol teorisi, gömülü programlama, sensör verisi işleme, deneysel ölçüm.
**Önerilen teknolojiler:** ESP32 veya Arduino, kızılötesi sensör dizisi (ör. QTR-8), motor sürücü, PlatformIO, Python (analiz).

## Dikkat!

- Pil voltajı düştükçe motorlar yavaşlar ve sonuçlar değişir; her denemeden önce voltajı ölç veya sabit voltaj regülatörü kullan.
- Ortam ışığı kızılötesi sensörleri etkiler; deneyleri aynı ışık koşullarında yap.
- Donanım bütçesini baştan netleştir ve yedek parça al.

## Projeyi genişletme fikirleri

- Pisti önceden tanıyıp viraj öncesi yavaşlayan robot
- Kamera ile çizgi takibi ([Bilgisayarlı görü](41-docscan.md) alanıyla birleşebilir)
- IEEE robot yarışmalarına hazırlık platformu

## Kaynaklar

- Åström & Murray — [*Feedback Systems*](https://fbswiki.org/) (ücretsiz çevrimiçi kitap)
- Brett Beauregard — [*Improving the Beginner's PID*](http://brettbeauregard.com/blog/2011/04/improving-the-beginners-pid-introduction/)
- [PlatformIO](https://platformio.org/)
- [Pololu QTR sensör belgeleri](https://www.pololu.com/category/123/pololu-qtr-reflectance-sensors)
