# 23 · KeyboardFirst

> **Alan:** F. HCI ve erişilebilirlik · **Zorluk:** Orta · **Tür:** Ürün (bileşen kütüphanesi) + kullanıcı araştırması · **Ekip:** 2 kişi · **MVP:** 5 hafta

## Basitçe anlatalım

Bir asansör düşün: düğmeleri sadece dokunmatik ekranda. Elinde poşet varsa, eldiven giydiysen ya da ekranı göremiyorsan asansörü kullanamazsın. İyi bir asansörde hem dokunmatik ekran hem de basılabilen, üzerinde kabartma yazı olan düğmeler bulunur.

Web sitelerindeki açılır menüler, takvimler, sekmeler ve pencereler de çoğu zaman sadece fareyle kullanılacak şekilde yapılır. Fare kullanamayan biri için bu asansördeki dokunmatik ekran gibidir. KeyboardFirst, **tamamen klavyeyle kullanılabilen** arayüz bileşenleri yapar ve bunların gerçekten iyi çalışıp çalışmadığını test eder. Hatta bir şey daha merak ediyoruz: klavye kullanıcıları için iyi tasarım, herkes için daha hızlı mı?

**Tek cümleyle:** Tamamen klavyeyle kullanılabilen arayüz bileşenleri ve onları sınayan bir test altyapısı geliştirip farklı etkileşim tasarımlarında görev tamamlama süresini karşılaştıran bir proje.

## Problem

Görme engelli kullanıcılar, motor engelli kullanıcılar ve hızlı çalışmak isteyen "güç kullanıcıları" klavyeye dayanır. Ama özel yapılmış birçok bileşen (tarih seçici, çoklu seçim kutusu, sürükle-bırak listesi) klavyeyle ya hiç kullanılamaz ya da çok zahmetlidir. Hazır kütüphaneler bile her zaman doğru davranmaz ve bunu düzenli test eden bir altyapı nadiren vardır.

## Ne geliştirilecek?

- 5–6 temel bileşenden oluşan **klavye öncelikli bileşen kütüphanesi**: açılır menü, sekmeler, modal pencere, tarih seçici, combobox (arama + seçim), sıralanabilir liste
- Her bileşen için **otomatik klavye testleri** (doğru tuş doğru şeyi yapıyor mu?)
- Bileşenleri canlı deneyebileceğin **dokümantasyon sitesi**
- Kullanıcı testi için görev tabanlı deney sayfası

## Araştırma sorusu

> Aynı bileşen için farklı klavye etkileşim tasarımları (ör. ok tuşlarıyla gezinme vs. Tab ile gezinme, yazarak arama vs. listeden seçme), klavye kullanıcılarının görev tamamlama süresini ve hata sayısını nasıl etkiler?

## Deney tasarımı

1. **Bileşen seç:** En az 2 bileşen için 2–3 farklı etkileşim tasarımı hazırla (ör. tarih seçici: takvim ızgarasında ok tuşları vs. doğrudan yazarak giriş vs. ayrı gün/ay/yıl alanları).
2. **Katılımcılar:** 15–25 gönüllü; mümkünse aralarında günlük olarak klavye veya ekran okuyucu kullanan birkaç kişi.
3. **Görevler:** "15 Mart 2027'yi seç", "listeden 'Makine Mühendisliği'ni bul" gibi net görevler.
4. Her katılımcı tüm tasarımları denesin (gruplar içi tasarım); sıralama katılımcılar arasında dengelenmeli.
5. Süreyi, tuş vuruşu sayısını, hataları ve tercihleri kaydet.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Görev süresi | Görev ne kadar sürede tamamlandı? | Otomatik kayıt |
| Tuş vuruşu sayısı | Görevi bitirmek için kaç tuşa basıldı? | Otomatik kayıt |
| Hata sayısı | Yanlış seçim veya geri dönüş sayısı | Otomatik kayıt |
| Test kapsamı | ARIA kalıplarında tanımlı tuş davranışlarının kaçı test edildi? | Kontrol listesi |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Bileşen** (component) | Tekrar tekrar kullanılabilen arayüz parçası (buton, menü, takvim) |
| **ARIA APG** | W3C'nin "bu bileşen klavyeyle nasıl davranmalı?" sorusuna cevap veren kılavuzu |
| **Combobox** | Hem yazı yazabildiğin hem de açılan listeden seçim yapabildiğin kutu |
| **Roving tabindex** | Bir grup içinde Tab'ın sadece bir öğeye gidip, grup içinde ok tuşlarıyla gezilmesi tekniği |
| **Odak tuzağı** (focus trap) | Modal açıkken odağın pencere içinde kalması; bu durumda istenen bir davranıştır |
| **Gruplar içi tasarım** | Her katılımcının tüm sürümleri denediği deney düzeni |
| **Dengeleme** (counterbalancing) | Sürümlerin hangi sırayla denendiğini katılımcılar arasında değiştirmek; böylece öğrenme etkisi dengelenir |
| **Fitts yasası** | Hedefe ulaşma süresinin hedefin uzaklığına ve boyutuna bağlı olduğunu söyleyen kural (fare için) |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, ARIA APG'deki bileşen kalıplarını oku |
| 1–3 | Keşif (K1) | Mevcut kütüphanelerin klavye davranışını incele, ilk 2 bileşen ve test altyapısı |
| 4–5 | Geliştirme | **MVP:** 4 bileşen + otomatik klavye testleri + dokümantasyon sitesi |
| 6–8 | Geliştirme (K2) | Alternatif etkileşim tasarımları, deney sayfası; ara değerlendirme |
| 9–11 | Tamamlama | Pilot + ana kullanıcı testi |
| 12–13 | Tamamlama | Analiz, kütüphanenin npm'de yayımlanması |
| 14 | Sonuç (K3) | Teknik rapor ve yayımlanmış kütüphane |

## Başlamadan önce

**Bilmen iyi olur:** React veya başka bir arayüz framework'ü, temel HTML/CSS.
**Öğreneceklerin:** Erişilebilir bileşen tasarımı, ARIA, bileşen testi, kullanıcı araştırması, kütüphane yayımlama.
**Önerilen teknolojiler:** React + TypeScript, Vitest + Testing Library, Playwright, Storybook veya basit bir dokümantasyon sitesi.

## Dikkat!

- Tekerleği yeniden icat etme: önce ARIA APG'deki kalıpları oku, tuş davranışlarını oradan al.
- ARIA yanlış kullanılırsa erişilebilirliği iyileştirmez, bozar. "ARIA'sız çözüm varsa onu kullan" kuralını unutma.
- Sadece fare kullanan ekip üyelerinin bulduğu sonuçlar klavye kullanıcılarını temsil etmez; gerçek kullanıcılara ulaşmaya çalış.

## Projeyi genişletme fikirleri

- TechOps'un tüm projelerinde ortak kullanılan bileşen kütüphanesine dönüşmesi
- [AccessJourney](21-accessjourney.md) ile bileşenlerin otomatik denetlenmesi
- Ekran okuyucu ile sesli kullanım deneyi

## Kaynaklar

- [WAI-ARIA Authoring Practices Guide (APG)](https://www.w3.org/WAI/ARIA/apg/)
- [WCAG 2.2 — 2.1 Klavye ile erişilebilir](https://www.w3.org/WAI/WCAG22/Understanding/keyboard)
- [Testing Library](https://testing-library.com/)
- [React Aria](https://react-spectrum.adobe.com/react-aria/) — inceleme için iyi bir örnek
