# 37 · LowPower Node

> **Alan:** J. Gömülü sistemler ve nesnelerin interneti · **Zorluk:** Orta · **Tür:** Deneysel araştırma + donanım prototipi · **Ekip:** 2 kişi · **MVP:** 4–5 hafta

## Basitçe anlatalım

Bir bahçeye toprak nemini ölçen küçük bir cihaz koyduğunu düşün. Cihaz pille çalışıyor ve bahçenin ortasında; pili her hafta değiştirmek istemezsin. Peki pil ne kadar dayanır? Cihaz her saniye ölçüm yapıp sonucu internete gönderirse birkaç gün. Ama cihaz zamanının çoğunu uyuyarak geçirir, sadece arada bir uyanıp ölçer ve sonuçları biriktirip toplu gönderirse aylarca, hatta yıllarca dayanabilir.

LowPower Node, pille çalışan bir sensör cihazında **enerji tasarrufu stratejilerini** ölçen bir proje. Ne sıklıkla ölçmeli, ne zaman göndermeli, hangi kablosuz teknolojiyi kullanmalı? Her kararın pil ömrüne etkisini gerçek ölçümlerle göstereceğiz.

**Tek cümleyle:** Pille çalışan bir sensör düğümünde uyku modları, örnekleme sıklığı, veri gönderme stratejisi ve kablosuz iletişim seçeneklerinin pil ömrüne etkisini ölçen bir proje.

## Problem

Tarım, akıllı bina ve çevre izleme uygulamalarında binlerce sensör pille çalışır. Pil değiştirmek pahalıdır ve çoğu zaman pratik değildir. Mikrodenetleyicilerin uyku modları ve iletişim ayarları pil ömrünü yüz kata kadar değiştirebilir ama bu ayarların etkisi genellikle veri sayfasındaki teorik değerlerle tahmin edilir, gerçek ölçümle doğrulanmaz.

## Ne geliştirilecek?

- Sıcaklık, nem ve toprak nemi ölçen **pil ile çalışan sensör düğümü** (ESP32 veya nRF52 tabanlı)
- Farklı enerji stratejilerini ayarlarla değiştirebilen gömülü yazılım
- Akım tüketimini zaman içinde kaydeden **ölçüm düzeneği**
- Ölçümlerden pil ömrü tahmini yapan hesaplama aracı
- Verileri toplayan basit bir alıcı/sunucu

## Araştırma sorusu

> Uyku modu, örnekleme sıklığı, toplu veri gönderimi ve kablosuz iletişim teknolojisi (Wi-Fi, Bluetooth Low Energy, LoRa) seçimleri, bir sensör düğümünün ortalama akım tüketimini ve tahmini pil ömrünü ne ölçüde değiştirir?

## Deney tasarımı

1. **Stratejiler:**
   - (A) Sürekli açık, her ölçümü hemen Wi-Fi ile gönderen düğüm — baseline
   - (B) Derin uyku + her ölçümde Wi-Fi ile gönderim
   - (C) Derin uyku + ölçümleri biriktirip toplu gönderim
   - (D) Derin uyku + BLE veya LoRa ile gönderim
2. **Değişkenler:** Ölçüm aralığı (10 sn, 1 dk, 10 dk, 1 saat).
3. Her kombinasyonda akım tüketimini en az birkaç tam döngü boyunca hassas ölçüm cihazıyla kaydet.
4. Ölçümlerden pil ömrünü hesapla; seçilen bir yapılandırmayı gerçek pille günlerce çalıştırıp tahmini doğrula.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Ortalama akım | Cihaz ortalama ne kadar akım çekiyor? | Mikroamper (ölçüm cihazı) |
| Tahmini pil ömrü | Belirli bir pille cihaz ne kadar dayanır? | Gün (hesap) |
| Tahmin doğruluğu | Hesaplanan ömür gerçek ölçümle uyuşuyor mu? | Uzun süreli test |
| Veri gecikmesi | Ölçüm ile sunucuya ulaşması arasındaki süre | Saniye |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Sensör düğümü** | Ölçüm yapıp veriyi kablosuz gönderen küçük cihaz |
| **Derin uyku** (deep sleep) | Mikrodenetleyicinin neredeyse tamamen kapanıp çok az akım çektiği mod |
| **Görev döngüsü** (duty cycle) | Cihazın zamanının yüzde kaçında uyanık olduğu |
| **mA / µA** | Miliamper / mikroamper; akım birimleri (1 mA = 1000 µA) |
| **mAh** | Pilin kapasitesi; 1000 mAh pil, 1 mA ile yaklaşık 1000 saat dayanır |
| **BLE** | Bluetooth'un düşük enerjili sürümü |
| **LoRa** | Çok az enerjiyle kilometrelerce uzağa küçük veri gönderebilen kablosuz teknoloji |
| **MQTT** | Sensörlerin veri göndermesi için yaygın kullanılan hafif mesajlaşma protokolü |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, malzeme listesi ve ölçüm cihazı seçimi |
| 1–3 | Keşif (K1) | Sensör düğümünün kurulması, ölçüm düzeneği, baseline ölçümü |
| 4–5 | Geliştirme | **MVP:** derin uyku ile çalışan, veri gönderen ve akımı ölçülebilen düğüm |
| 6–8 | Geliştirme (K2) | Toplu gönderim, BLE/LoRa seçenekleri; ara değerlendirme |
| 9–11 | Tamamlama | Tam deney matrisi, uzun süreli pil testi |
| 12–13 | Tamamlama | Pil ömrü hesaplama aracı, belgeler |
| 14 | Sonuç (K3) | Teknik rapor ve tasarım önerileri |

## Başlamadan önce

**Bilmen iyi olur:** Temel C/C++, temel elektronik (akım, gerilim).
**Öğreneceklerin:** Gömülü sistemler, güç yönetimi, kablosuz iletişim, hassas ölçüm.
**Önerilen teknolojiler:** ESP32 veya nRF52, PlatformIO veya ESP-IDF, akım ölçüm cihazı (ör. Nordic Power Profiler Kit II), MQTT, Python.

## Dikkat!

- Geliştirme kartlarındaki LED'ler ve USB dönüştürücüler uykudayken bile akım çeker; ölçümü ya çıplak modülle yap ya da bu etkiyi ayrıca ölç.
- Sıradan bir multimetre mikroamper düzeyindeki ve hızlı değişen akımları doğru ölçemez; uygun ölçüm cihazı kullan.
- Lityum pillerle çalışırken kısa devre ve aşırı deşarj risklerine dikkat et.

## Projeyi genişletme fikirleri

- Güneş paneliyle kendi enerjisini üreten düğüm
- [CampusAir](38-campusair.md) sensör ağının enerji altyapısı
- Uyanma sıklığını ölçülen değere göre ayarlayan uyarlanabilir örnekleme

## Kaynaklar

- [ESP-IDF: Sleep Modes](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/system/sleep_modes.html)
- [Nordic Power Profiler Kit II](https://www.nordicsemi.com/Products/Development-hardware/Power-Profiler-Kit-2)
- [The Things Network: LoRaWAN](https://www.thethingsnetwork.org/docs/lorawan/)
- [MQTT](https://mqtt.org/)
