# 21 · AccessJourney

> **Alan:** F. HCI ve erişilebilirlik · **Zorluk:** Orta · **Tür:** Ürün (test aracı) + kullanıcı araştırması · **Ekip:** 2 kişi · **MVP:** 4–5 hafta

## Basitçe anlatalım

Fare kullanmadan, sadece klavyedeki Tab tuşuyla bir web sitesinde gezinmeyi dene. Tab'a bastıkça seçili olan şey bir yerden bir yere zıplar. Bazen ekranda hiçbir şeyin seçili olmadığını görürsün, bazen sayfanın en altına atlarsın, bazen bir menüye girer ve bir daha çıkamazsın. Görme engelli biri ya da eli titreyen biri siteyi tam olarak böyle kullanır.

Bu sorunları bulmak için otomatik tarama araçları var ama bir bilgisayar programı sayfaya "bakar", sayfayı **yaşamaz**. AccessJourney, bir kullanıcının siteyi baştan sona klavyeyle gezdiği **yolculuğu** taklit eden bir test aracı. Asıl merak ettiğimiz şey de şu: otomatik araçlar hangi sorunları yakalıyor, hangilerini hiç göremiyor?

**Tek cümleyle:** Web sitelerindeki klavye kullanımı, odak sırası ve etkileşim sorunlarını inceleyen ve otomatik erişilebilirlik taramasının neleri kaçırdığını analiz eden bir test aracı.

## Problem

Erişilebilirlik testlerinin büyük kısmı otomatik araçlarla yapılır (Lighthouse, axe). Bu araçlar eksik alternatif metin veya düşük renk kontrastı gibi sorunları iyi yakalar. Ama "bu menüden klavyeyle çıkılabiliyor mu?", "odak mantıklı bir sırada ilerliyor mu?" gibi **etkileşim** sorunları sayfanın durağan haline bakarak anlaşılamaz. W3C de otomatik araçların tüm sorunları bulamayacağını ve insan değerlendirmesinin gerektiğini açıkça belirtiyor.

## Ne geliştirilecek?

- Bir sayfayı tarayıcıda açıp **Tab tuşuyla baştan sona gezen** otomatik test aracı
- Odak sırasını sayfa üzerinde numaralı oklarla gösteren **görsel rapor**
- Klavye tuzaklarını, görünmeyen odak göstergelerini ve ulaşılamayan öğeleri tespit eden kurallar
- Sonuçları otomatik tarama araçlarının çıktısıyla yan yana koyan karşılaştırma sayfası

## Araştırma sorusu

> Gerçek web sitelerindeki klavye ve etkileşim kaynaklı erişilebilirlik sorunlarının ne kadarını statik otomatik tarama yakalayabiliyor, ne kadarı yalnızca etkileşim testiyle veya insan değerlendirmesiyle bulunabiliyor?

## Deney tasarımı

1. **Site seçimi:** 20–30 site seç: üniversite siteleri, belediye siteleri, popüler e-ticaret siteleri, öğrenci topluluk siteleri.
2. **Üç yöntemle değerlendir:**
   - (A) Otomatik tarama (axe-core, Lighthouse) — baseline
   - (B) AccessJourney'nin etkileşimli klavye testi
   - (C) Ekip üyelerinin WCAG 2.2 kontrol listesiyle elle yaptığı değerlendirme (doğru cevap kabul edilir)
3. Bulunan sorunları kategorilere ayır ve hangi yöntemin hangi kategoriyi yakaladığını tabloya dök.
4. İsteğe bağlı: ekran okuyucu kullanan gönüllülerle küçük bir kullanıcı testi (bilgilendirilmiş onam ile).

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Yakalama oranı | Elle bulunan sorunların kaçını her yöntem yakaladı? | Kategori bazında karşılaştırma |
| Yanlış alarm oranı | Aracın bildirdiği sorunların kaçı aslında sorun değil? | Elle doğrulama |
| Kategori kapsamı | Hangi WCAG kriterleri hangi yöntemle test edilebiliyor? | Tablo |
| Tarama süresi | Bir sayfanın testi ne kadar sürüyor? | Saniye |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Erişilebilirlik** (a11y) | Engelli bireyler dahil herkesin bir ürünü kullanabilmesi |
| **WCAG 2.2** | W3C'nin web erişilebilirliği için yayımladığı uluslararası kurallar |
| **Odak** (focus) | Klavyeden gelen tuşlara o anda hangi öğenin tepki vereceği |
| **Odak sırası** | Tab'a bastıkça odağın öğeler arasında ilerlediği sıra |
| **Klavye tuzağı** | Klavyeyle girilip bir daha çıkılamayan alan |
| **Odak göstergesi** | Seçili öğenin etrafındaki görünür çerçeve |
| **Ekran okuyucu** | Ekrandaki içeriği sesli okuyan yardımcı yazılım (NVDA, VoiceOver) |
| **ARIA** | Ekran okuyuculara bir öğenin ne işe yaradığını anlatan HTML öznitelikleri |
| **Headless tarayıcı** | Ekranı olmadan, programla yönetilen tarayıcı |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, WCAG 2.2 klavye kriterlerini oku |
| 1–3 | Keşif (K1) | Siteleri seç, otomatik tarama baseline'ı, ilk 5 sitenin elle değerlendirmesi |
| 4–5 | Geliştirme | **MVP:** sayfayı Tab ile gezip odak sırasını kaydeden araç |
| 6–8 | Geliştirme (K2) | Klavye tuzağı ve görünmez odak tespiti, görsel rapor; ara değerlendirme |
| 9–11 | Tamamlama | Tüm sitelerde üç yöntemli karşılaştırma, (isteğe bağlı) kullanıcı testi |
| 12–13 | Tamamlama | CI'da çalışan sürüm, belgeler |
| 14 | Sonuç (K3) | Teknik rapor: "Otomatik testler neyi kaçırıyor?" |

## Başlamadan önce

**Bilmen iyi olur:** HTML, CSS ve temel JavaScript.
**Öğreneceklerin:** Web erişilebilirliği, WCAG, tarayıcı otomasyonu, kullanıcı odaklı değerlendirme.
**Önerilen teknolojiler:** TypeScript, Playwright, axe-core, Lighthouse, NVDA (Windows) veya VoiceOver (macOS) ile elle test.

## Dikkat!

- Sitelerdeki sorunları yayımlarken kurumları teşhir eden bir dil kullanma. Sonuçları anonimleştir ya da kurumlara önce bildir.
- Elle değerlendirme için ekip içinde ortak bir kontrol listesi kullanın; yoksa farklı kişiler farklı şeyleri sorun sayar.
- Bir aracın "0 hata" demesi, sitenin erişilebilir olduğu anlamına gelmez. Raporun ana mesajı bu olabilir.

## Projeyi genişletme fikirleri

- TechOps'un kendi sitelerinde her PR'da çalışan erişilebilirlik kontrolü
- [KeyboardFirst](23-keyboardfirst.md) bileşenlerinin test altyapısı olarak kullanılması
- Ekran okuyucu yolculuğunu da taklit eden sürüm

## Kaynaklar

- [WCAG 2.2](https://www.w3.org/TR/WCAG22/) ve [Understanding WCAG 2.2](https://www.w3.org/WAI/WCAG22/Understanding/)
- [W3C WAI: Selecting Web Accessibility Evaluation Tools](https://www.w3.org/WAI/test-evaluate/tools/selecting/)
- [axe-core](https://github.com/dequelabs/axe-core)
- [Playwright](https://playwright.dev/)
