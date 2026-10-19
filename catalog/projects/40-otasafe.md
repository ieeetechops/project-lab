# 40 · OTASafe

> **Alan:** J. Gömülü sistemler ve nesnelerin interneti · **Zorluk:** Orta–İleri · **Tür:** Ürün + deneysel araştırma · **Ekip:** 2 kişi · **MVP:** 5–6 hafta

## Basitçe anlatalım

Telefonun güncelleme yaparken şarjın bittiğini düşün. İyi tasarlanmış bir telefon yeniden açıldığında ya güncellemeye devam eder ya da eski sürümle açılır. Kötü tasarlanmış bir cihaz ise hiç açılmaz ve elinde bir tuğla kalır.

Akıllı prizler, sensörler ve endüstriyel cihazlar da internet üzerinden güncellenir. Bu cihazlar binlerce farklı yerdedir; güncelleme sırasında elektrik kesilirse, internet koparsa ya da yeni yazılım hatalıysa her birine teknisyen göndermek imkânsızdır. OTASafe, mikrodenetleyiciler için **güncelleme sırasında ne olursa olsun cihazın çalışır kalmasını** sağlayan bir güncelleme sistemi geliştirir ve bunu bilerek elektrik keserek, bağlantı kopararak test eder.

**Tek cümleyle:** Mikrodenetleyiciler için kesinti ve hatalı yazılıma karşı dayanıklı, imzalı ve geri alınabilir kablosuz güncelleme sistemi geliştirip farklı güncelleme stratejilerini hata enjeksiyonu ile test eden bir proje.

## Problem

Nesnelerin interneti cihazlarının uzaktan güncellenmesi hem güvenlik açıklarını kapatmak hem de yeni özellik eklemek için zorunludur. Ancak güncelleme sırasında yaşanan güç kesintisi, ağ kopması veya hatalı sürüm cihazı kullanılamaz hale getirebilir. Ayrıca imzasız güncellemeler saldırganların cihaza kötü amaçlı yazılım yüklemesine yol açabilir.

## Ne geliştirilecek?

- Yeni sürümü yedek bölüme indirip doğrulayan **A/B bölümlü güncelleme sistemi**
- Güncelleme dosyalarının **dijital imza** ile doğrulanması
- Yeni sürüm açılışta sorun çıkarırsa otomatik olarak eski sürüme **geri dönme** mekanizması
- Güncelleme dosyalarını sunan basit bir güncelleme sunucusu
- Güncelleme sırasında rastgele anlarda güç kesen ve bağlantıyı koparan **hata enjeksiyon düzeneği**

## Araştırma sorusu

> Tek bölümlü, A/B bölümlü ve sıkıştırılmış/fark tabanlı güncelleme stratejileri; güç kesintisi, ağ kopması ve hatalı sürüm senaryolarında cihazın kurtarılabilirlik oranı, güncelleme süresi ve bellek ihtiyacı açısından nasıl karşılaştırılır?

## Deney tasarımı

1. **Stratejiler:**
   - (A) Tek bölümlü, doğrudan üzerine yazan güncelleme — baseline
   - (B) A/B bölümlü güncelleme + açılış doğrulaması
   - (C) A/B + sıkıştırılmış veya fark (delta) tabanlı güncelleme
2. **Hata senaryoları:** Güncellemenin rastgele bir anında güç kesintisi (röle ile), ağ kopması, bilerek bozulmuş dosya, açılışta çöken sürüm, imzasız dosya.
3. Her strateji × senaryo için en az 50 otomatik deneme.
4. Cihazın kendi kendine çalışır duruma dönüp dönmediği, güncelleme süresi, aktarılan veri ve gereken flash bellek ölçülür.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Kurtarılabilirlik oranı | Hata sonrası cihaz kendiliğinden çalışır duruma döndü mü? | Başarılı deneme yüzdesi |
| Güncelleme süresi | İndirme + doğrulama + yeniden başlatma süresi | Saniye |
| Aktarılan veri | Güncelleme için ne kadar veri indirildi? | KB |
| Bellek maliyeti | Strateji için ne kadar ek flash bellek gerekiyor? | KB |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **OTA** (Over-The-Air) | Cihaza kablo bağlamadan, internet üzerinden yazılım güncellemesi |
| **Firmware** | Cihazın içinde çalışan, donanımı yöneten yazılım |
| **Bootloader** | Cihaz açılırken ilk çalışan ve hangi yazılımın başlatılacağına karar veren küçük program |
| **A/B bölümleri** | Belleği iki parçaya ayırıp biri çalışırken diğerine yeni sürümü yazma yöntemi |
| **Geri alma** (rollback) | Sorunlu yeni sürümden önceki çalışan sürüme dönme |
| **Dijital imza** | Güncellemenin gerçekten üreticiden geldiğini ve değiştirilmediğini kanıtlayan kriptografik işaret |
| **Hata enjeksiyonu** | Sistemin dayanıklılığını ölçmek için bilerek hata oluşturmak |
| **Watchdog** | Yazılım takılırsa cihazı otomatik yeniden başlatan zamanlayıcı |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, mevcut OTA çözümlerini incele (ESP-IDF OTA, MCUboot) |
| 1–3 | Keşif (K1) | Tek bölümlü baseline, güncelleme sunucusu, hata enjeksiyon düzeneği |
| 4–6 | Geliştirme | **MVP:** imzalı A/B güncelleme ve otomatik geri alma |
| 7–8 | Geliştirme (K2) | Otomatik deney betikleri, fark tabanlı güncelleme; ara değerlendirme |
| 9–11 | Tamamlama | Tüm senaryolarda deney matrisi |
| 12–13 | Tamamlama | Güvenlik gözden geçirmesi, belgeler |
| 14 | Sonuç (K3) | Teknik rapor ve tekrar kullanılabilir OTA şablonu |

## Başlamadan önce

**Bilmen iyi olur:** C programlama, temel gömülü sistemler, temel kriptografi kavramları faydalı.
**Öğreneceklerin:** Bootloader ve bellek yerleşimi, güvenli güncelleme, dayanıklılık testi, IoT güvenliği.
**Önerilen teknolojiler:** ESP32 + ESP-IDF veya Zephyr + MCUboot, röle modülü (güç kesme için), Python (deney otomasyonu).

## Dikkat!

- Bootloader'ı yanlış yazarsan kartı kurtarmak için kablo ile yeniden programlaman gerekir; yedek kart bulundur.
- Özel imza anahtarını asla depoya commit etme; test anahtarı ile gerçek anahtarı ayır.
- Güç kesme deneylerini yalnızca geliştirme kartlarıyla yap.

## Projeyi genişletme fikirleri

- [DeltaSync](28-deltasync.md) tekniklerinin mikrodenetleyiciye uyarlanması
- Cihaz filosunu kademeli güncelleyen (önce %10, sonra hepsi) sunucu
- [CampusAir](38-campusair.md) istasyonlarının uzaktan güncellenmesi

## Kaynaklar

- [ESP-IDF: Over The Air Updates](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/system/ota.html)
- [MCUboot](https://docs.mcuboot.com/)
- [The Update Framework (TUF)](https://theupdateframework.io/)
- [OWASP IoT Top 10](https://owasp.org/www-project-internet-of-things/)
