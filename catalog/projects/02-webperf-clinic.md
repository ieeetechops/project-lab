# 02 · WebPerf Clinic

> **Alan:** A. Web teknolojileri · **Zorluk:** Başlangıç–Orta · **Tür:** Ürün + deneysel araştırma · **Ekip:** 2 kişi · **MVP:** 4 hafta

## Basitçe anlatalım

Bir web sitesi açılırken aslında onlarca parça ayrı ayrı yüklenir: resimler, yazı tipleri, kod dosyaları, reklamlar... Bunu bir **restorandaki sipariş** gibi düşün: tabağın gelmesi için çorba, salata, ana yemek ve tatlının hepsinin hazırlanması gerekiyor. Tatlı çok geç hazırlanıyorsa bütün sofra bekliyor.

WebPerf Clinic, bir siteye **doktor gibi bakan** bir araç. "Şu resim gereğinden 10 kat büyük, şu kod dosyası sayfanın açılmasını 2 saniye bekletiyor" gibi teşhisler koyar. Araştırma kısmında da hangi "ilacın" (resmi küçültmek, kodu sonradan yüklemek vb.) gerçekten ne kadar işe yaradığını ölçeriz.

**Tek cümleyle:** Web sitelerini yavaşlatan şeyleri bulan ve her iyileştirmenin gerçek etkisini ölçen bir analiz aracı.

## Problem

Öğrenci kulüpleri ve küçük kurumların siteleri genellikle büyük görseller, gereksiz eklentiler ve sıralaması kötü kod dosyalarıyla yavaş açılır. Mevcut araçlar (Lighthouse vb.) puan verir ama öğrenciler için "neden?" ve "hangi düzeltme ne kadar kazandırır?" sorularını cevaplamakta zorlanır. Özellikle mobil ve yavaş bağlantılarda kullanıcılar sayfa açılmadan siteyi terk eder.

## Ne geliştirilecek?

- Bir URL verildiğinde sayfayı yükleyip kaynakları analiz eden **CLI aracı veya web paneli**
- Sorunları önem sırasına göre listeleyen, sade Türkçe açıklamalı **rapor**
- Aynı sayfanın "önce/sonra" sürümlerini karşılaştıran **deney modu**

## Araştırma sorusu

> Görsel optimizasyonu, JavaScript yükleme stratejisi (defer/async/lazy) ve render stratejisi (sunucu tarafı / istemci tarafı) değişikliklerinin her biri, farklı ağ koşullarında sayfa yükleme metriklerini ne kadar iyileştirir?

## Deney tasarımı

1. Gerçekçi bir **test sitesi** hazırla (veya izinle bir kulüp sitesinin kopyasını al).
2. Her optimizasyonu **tek tek** uygula: sadece görsel, sadece JS, sadece render. Sonra hepsini birlikte uygula.
3. Her sürümü 3 ağ profiliyle ölç: hızlı Wi-Fi, 4G, yavaş 3G.
4. Her ölçümü en az 10 kez tekrarla; medyan ve p75 değerlerini raporla.
5. Baseline: hiçbir optimizasyon yapılmamış sürüm.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| LCP | Sayfadaki en büyük öğenin görünme süresi | Lighthouse / web-vitals kütüphanesi |
| INP | Kullanıcı tıkladığında sayfanın tepki verme süresi | web-vitals kütüphanesi |
| CLS | Sayfa yüklenirken öğelerin ne kadar zıpladığı | web-vitals kütüphanesi |
| Toplam aktarılan veri | İndirilen toplam KB | Tarayıcı ağ kayıtları |
| Teşhis doğruluğu | Aracın bulduğu sorunlar gerçekten sorun mu? | Elle kontrol edilmiş sorun listesiyle karşılaştırma (precision/recall) |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Core Web Vitals** | Google'ın kullanıcı deneyimini ölçmek için seçtiği üç temel hız ölçüsü (LCP, INP, CLS) |
| **Render** | Tarayıcının kodu ekranda görünen piksellere çevirmesi |
| **Render-blocking** | Yüklenene kadar sayfanın çizilmesini durduran dosya |
| **defer / async** | JavaScript dosyalarının sayfayı bekletmeden yüklenmesini sağlayan işaretler |
| **Lazy loading** | Bir resmin ancak ekrana yaklaşınca yüklenmesi |
| **WebP / AVIF** | JPEG ve PNG'den daha küçük boyutlu modern resim formatları |
| **SSR / CSR** | Sayfanın sunucuda hazırlanıp gönderilmesi / tarayıcıda JavaScript ile oluşturulması |
| **Ağ kısıtlama** (throttling) | Hızlı internette yavaş bağlantıyı taklit etmek |
| **Waterfall** | Hangi dosyanın ne zaman başlayıp bittiğini gösteren şelale grafiği |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | 5 gerçek sitenin hız ölçümünü yap, sorunları gözlemle |
| 1–3 | Keşif (K1) | Lighthouse ve Chrome DevTools'u öğren, test sitesini kur, baseline ölç |
| 4–7 | Geliştirme | **MVP:** URL alıp kaynakları listeleyen ve en büyük 5 sorunu gösteren CLI |
| 8 | Ara değerlendirme (K2) | Demo + ilk ölçümler |
| 9–11 | Tamamlama | Optimizasyon deneyleri, ağ profilleri, tekrarlı ölçüm |
| 12–13 | Tamamlama | Sade Türkçe rapor çıktısı, belgeler |
| 14 | Sonuç (K3) | Teknik rapor: "hangi düzeltme kaç saniye kazandırır?" tablosu |

## Başlamadan önce

**Bilmen iyi olur:** HTML/CSS/JavaScript temelleri, tarayıcı geliştirici araçlarını açabilmek.
**Öğreneceklerin:** Tarayıcının sayfayı nasıl yüklediği, performans ölçümü, otomatik ölçüm ve istatistik.
**Önerilen teknolojiler:** Node.js, Lighthouse (programatik kullanım), Puppeteer veya Playwright, web-vitals.

## Dikkat!

- Tek ölçüm hiçbir şey kanıtlamaz; hız ölçümleri çok dalgalıdır. Mutlaka tekrarla.
- Başkasının sitesini izinsiz ve yoğun şekilde test etmek sunucusuna yük bindirir. Kendi test sitenle çalış.
- Lighthouse puanı bir amaç değil; gerçek kullanıcı süreleri önemlidir.

## Projeyi genişletme fikirleri

- GitHub Action olarak her PR'da hız regresyonu kontrolü
- IEEE İKÇÜ ve TechOps sitelerinin düzenli hız raporu

## Kaynaklar

- [web.dev: Web Vitals](https://web.dev/articles/vitals)
- [Lighthouse](https://developer.chrome.com/docs/lighthouse/overview)
- [WebPageTest](https://www.webpagetest.org)
- [MDN: Lazy loading](https://developer.mozilla.org/en-US/docs/Web/Performance/Guides/Lazy_loading)
