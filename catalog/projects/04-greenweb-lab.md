# 04 · GreenWeb Lab

> **Alan:** A. Web teknolojileri · **Zorluk:** Orta · **Tür:** Deneysel araştırma · **Ekip:** 2 kişi · **MVP:** 5 hafta

## Basitçe anlatalım

Bir web sayfasını açtığında telefonun biraz enerji harcar, internet altyapısı veriyi taşırken enerji harcar, sunucu cevap verirken enerji harcar. Tek bir sayfa için çok az ama milyonlarca kişi her gün açınca büyük bir rakam olur.

Aynı yemeği iki farklı şekilde pişirebilirsin: biri ocağı 2 saat açık tutar, diğeri düdüklü tencereyle 20 dakikada bitirir. Sonuç aynı yemek ama harcanan enerji çok farklı. GreenWeb Lab da **aynı işi yapan iki web sayfasından hangisinin daha az kaynak harcadığını** ölçer: ne kadar veri indiriyor, işlemciyi ne kadar yoruyor, ne kadar bellek kullanıyor?

Önemli bir uyarı: "Bu sayfa tam olarak 0,3 gram karbon salıyor" demek çok zordur ve genellikle yanlıştır. Biz **ölçebildiğimiz şeyleri dürüstçe ölçüp** tahminlerimizin sınırlarını açıkça yazacağız.

**Tek cümleyle:** Aynı işlevi farklı tasarımlarla yapan web arayüzlerinin ağ, işlemci ve bellek tüketimini karşılaştıran bir laboratuvar.

## Problem

Web sayfalarının boyutu yıllar içinde sürekli arttı. Ağır arayüzler hem düşük donanımlı cihaz kullananları hem de sınırlı mobil verisi olanları dışlar ve enerji tüketimini artırır. Tasarımcı ve geliştiriciler, bir tasarım kararının (video arka plan, ağır animasyon, büyük kütüphane) **kaynak maliyetini** genellikle bilmez.

## Ne geliştirilecek?

- Aynı işlevi (ör. etkinlik listesi sayfası) **3–4 farklı tasarımla** yapan örnek sayfalar
- Her sayfanın ağ trafiği, CPU zamanı ve bellek kullanımını otomatik ölçen **ölçüm aracı**
- Sonuçları karşılaştıran bir **rapor/panel**
- Geliştiriciler için "düşük kaynak tüketen arayüz" **kontrol listesi**

## Araştırma sorusu

> Aynı işlevi sunan web arayüzlerinde tasarım kararları (görsel yoğunluk, JavaScript çerçevesi, animasyon, yazı tipi kullanımı) ağ trafiğini, CPU zamanını ve bellek kullanımını ne ölçüde değiştirir; bu farklar kullanıcı deneyimi metrikleriyle nasıl ilişkilidir?

## Deney tasarımı

1. **Sabit işlev:** "20 etkinliği listele, birine tıklayınca detayını göster."
2. **Tasarım varyantları:**
   - (A) Ağır: büyük görseller, video arka plan, büyük bir UI kütüphanesi
   - (B) Orta: optimize görseller, popüler bir çerçeve
   - (C) Hafif: sistem yazı tipleri, minimal JS, sunucu tarafı HTML
3. Her varyantı aynı tarayıcı ve cihazda, otomatik kullanıcı senaryosuyla (sayfayı aç, kaydır, tıkla) 10'ar kez çalıştır.
4. Ağ trafiği, CPU zamanı ve bellek ölç; karbon tahmini yapılacaksa **hangi modelin, hangi varsayımlarla** kullanıldığını yaz.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Aktarılan veri | Sayfanın indirdiği toplam KB | Ağ kayıtları |
| CPU zamanı | İşlemcinin sayfa için çalıştığı toplam süre | Chrome DevTools Performance / tracing |
| Tepe bellek | En yüksek bellek kullanımı | Tarayıcı bellek ölçümü |
| Kullanıcı deneyimi | Sayfa hâlâ hızlı ve kullanışlı mı? | LCP, INP |
| Tahmini emisyon (opsiyonel) | Seçilen modele göre CO₂e **tahmini** | CO2.js, varsayımlar açıkça yazılarak |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Sürdürülebilir yazılım** (green software) | Daha az enerji ve donanım kaynağı harcayacak şekilde tasarlanan yazılım |
| **CPU zamanı** | İşlemcinin bir iş için harcadığı süre; ne kadar uzunsa o kadar enerji |
| **Sayfa ağırlığı** | Bir sayfanın açılması için indirilen toplam veri miktarı |
| **CO₂e** | Farklı sera gazlarının etkisinin karbondioksit cinsinden ifadesi |
| **Emisyon modeli** | Veri miktarından karbon tahmini yapan hesaplama yöntemi; her modelin varsayımları farklıdır |
| **Tracing** | Tarayıcının yaptığı her işi zaman çizelgesi olarak kaydetmek |
| **Sistem yazı tipi** | Cihazda zaten yüklü olan, indirilmesi gerekmeyen yazı tipi |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Literatür ve Green Software Foundation çalışmalarını incele |
| 1–3 | Keşif (K1) | Ölçüm yöntemlerini dene, ölçüm gürültüsünü anla, ilk varyantı yaz |
| 4–8 | Geliştirme (K2) | **MVP:** 3 varyant + otomatik ölçüm betiği; ara değerlendirme |
| 9–11 | Tamamlama | Tüm ölçümler, istatistiksel analiz, mobil cihaz testi |
| 12–13 | Tamamlama | Geliştirici kontrol listesi, rapor paneli |
| 14 | Sonuç (K3) | Teknik rapor: hangi tasarım kararı ne kadar kaynak harcıyor? |

## Başlamadan önce

**Bilmen iyi olur:** HTML/CSS/JS, en az bir frontend çerçevesi.
**Öğreneceklerin:** Tarayıcı performans profillemesi, ölçüm metodolojisi, sürdürülebilir yazılım prensipleri.
**Önerilen teknolojiler:** Playwright/Puppeteer, Chrome DevTools Protocol, CO2.js, Python/pandas (analiz için).

## Dikkat!

- **Kesin karbon emisyonu hesapladığımızı iddia etmeyelim.** Sadece veri aktarımına bakarak yapılan karbon hesapları kaba tahminlerdir; varsayımları açıkça yaz.
- Varyantlar arasında **işlev farkı olmamalı**; yoksa elma ile armudu karşılaştırırsın.
- Arka planda açık başka programlar ölçümleri bozar; temiz bir ortamda ölç.

## Projeyi genişletme fikirleri

- TechOps sitesinin kaynak tüketimi raporu ve iyileştirilmesi
- CI'da sayfa ağırlığı bütçesi kontrolü

## Kaynaklar

- [Green Software Foundation](https://greensoftware.foundation)
- [CO2.js](https://github.com/thegreenwebfoundation/co2.js) — The Green Web Foundation
- [Sustainable Web Design](https://sustainablewebdesign.org)
- [Chrome DevTools: Performance](https://developer.chrome.com/docs/devtools/performance)
