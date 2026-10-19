# 29 · Generative Canvas

> **Alan:** H. Grafik ve yaratıcı yazılım · **Zorluk:** Başlangıç–Orta · **Tür:** Yaratıcı mühendislik + deneysel karşılaştırma · **Ekip:** 2 kişi · **MVP:** 4 hafta

## Basitçe anlatalım

Bir ağacın dallarına bak: gövde ikiye ayrılır, her dal tekrar ikiye ayrılır, her küçük dal da yine ikiye. Doğa çok basit bir kuralı tekrar tekrar uygulayarak inanılmaz karmaşık şekiller çizer. Bir kar tanesi, bir deniz kabuğu, bir eğreltiotu yaprağı da böyledir.

Generative Canvas, bilgisayara **çizim yerine kural veren** bir uygulama. Sen "bir çizgi çiz, ucunda ikiye ayrıl, her seferinde biraz kısal" dersin, bilgisayar bu kuralı binlerce kez uygulayıp bir ağaç çizer. Kurala biraz rastgelelik eklersen her seferinde farklı ama birbirine benzeyen ağaçlar çıkar. Hangi kuralların daha güzel, daha çeşitli ya da daha hızlı sonuç verdiğini karşılaştırmak da projenin araştırma tarafı.

**Tek cümleyle:** Matematiksel kurallardan, fraktallardan ve rastlantısal süreçlerden görsel sanat üreten ve farklı üretim algoritmalarını karşılaştıran interaktif bir uygulama.

## Problem

Üretken sanat (generative art), bilgisayar bilimi ile sanatın kesiştiği güçlü bir alan ama genellikle dağınık kod örnekleriyle öğrenilir. Algoritmaların görsel çeşitliliği, estetik etkisi ve hesaplama maliyeti nadiren sistemli olarak karşılaştırılır. Aynı zamanda bu alan, algoritmaları "görerek" öğrenmenin en eğlenceli yollarından biri.

## Ne geliştirilecek?

- Tarayıcıda çalışan, parametreleri **kaydırıcılarla canlı değiştirilebilen** üretken sanat stüdyosu
- Algoritma modülleri: fraktallar (Mandelbrot, Julia), L-sistemleri (bitki benzeri yapılar), akış alanları (Perlin gürültüsü), parçacık sistemleri, Voronoi desenleri
- **Seed** ile tekrarlanabilir üretim: aynı seed + aynı parametreler = aynı eser
- Yüksek çözünürlüklü PNG/SVG dışa aktarma
- Galeri: üretilen eserleri parametreleriyle birlikte kaydetme

## Araştırma sorusu

> Farklı üretken algoritmalar görsel çeşitlilik (aynı algoritmanın farklı seed'lerle ne kadar farklı sonuç verdiği), izleyicinin estetik değerlendirmesi ve hesaplama maliyeti açısından nasıl karşılaştırılır?

## Deney tasarımı

1. **Algoritmalar:** En az 4 algoritma ailesi, her biri için sabit parametrelerle 100'er seed.
2. **Görsel çeşitlilik:** Üretilen görüntüler arasındaki benzerliği ölç (ör. görüntü özellik vektörleri arasındaki mesafe, renk histogramı farkı).
3. **Estetik değerlendirme:** 20–30 gönüllüye eşleştirilmiş görüntüler göster ("hangisini daha çok beğendin?"), sonuçları sıralama modeliyle puana çevir.
4. **Maliyet:** Her algoritmanın 1920×1080 görüntüyü üretme süresi; CPU ve GPU (WebGL) sürümleri.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Görsel çeşitlilik | Aynı algoritmanın çıktıları birbirinden ne kadar farklı? | Ortalama ikili görüntü mesafesi |
| Estetik tercih puanı | İzleyiciler hangisini daha çok beğendi? | Eşleştirilmiş karşılaştırma (Bradley–Terry) |
| Üretim süresi | Bir görüntüyü üretmek ne kadar sürüyor? | Milisaniye |
| Etkileşim akıcılığı | Parametre değişince ekran ne kadar akıcı güncelleniyor? | FPS |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Üretken sanat** (generative art) | Sanatçının doğrudan çizmek yerine kural yazdığı, bilgisayarın üretimi yaptığı sanat |
| **Fraktal** | Büyüttükçe kendine benzeyen parçalar gösteren şekil |
| **L-sistemi** | Basit harf değiştirme kurallarıyla bitki ve dal yapıları üreten sistem |
| **Perlin gürültüsü** | Yumuşak geçişli, doğal görünen rastgelelik (bulut, dalga, arazi için) |
| **Seed** (tohum) | Rastgele sayı üretecinin başlangıç değeri; aynı seed hep aynı "rastgele" sonucu verir |
| **Parçacık sistemi** | Binlerce küçük noktanın basit kurallarla hareket ederek bir bütün oluşturması |
| **Voronoi diyagramı** | Düzlemi, her noktaya en yakın bölgelere ayıran desen |
| **Canvas / WebGL** | Tarayıcıda çizim yapmayı sağlayan teknolojiler; WebGL ekran kartını kullanır |
| **FPS** | Saniyede ekrana çizilen kare sayısı |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, örnek eserleri ve algoritmaları incele |
| 1–3 | Keşif (K1) | Canvas altyapısı, seed'li rastgele sayı üreteci, ilk 2 algoritma |
| 4 | Geliştirme | **MVP:** 2 algoritmalı, kaydırıcılı, PNG dışa aktaran stüdyo |
| 5–8 | Geliştirme (K2) | 4+ algoritma, galeri, WebGL sürümü; ara değerlendirme |
| 9–11 | Tamamlama | Çeşitlilik ve maliyet ölçümleri, estetik tercih anketi |
| 12–13 | Tamamlama | Arayüz cilası, kullanıcı rehberi |
| 14 | Sonuç (K3) | Teknik rapor ve **TechOps sergisi**: en iyi eserlerin yayımlanması |

## Başlamadan önce

**Bilmen iyi olur:** Temel JavaScript, lise matematiği (koordinatlar, trigonometri).
**Öğreneceklerin:** Bilgisayar grafikleri, algoritma tasarımı, rastgelelik ve tekrarlanabilirlik, performans optimizasyonu.
**Önerilen teknolojiler:** TypeScript, p5.js veya doğrudan Canvas API, WebGL (regl veya three.js), React (arayüz).

## Dikkat!

- Estetik değerlendirme öznel bir ölçüdür; sonuçları "evrensel güzellik" olarak değil, "bu katılımcı grubunun tercihi" olarak yaz.
- Seed tabanlı tekrarlanabilirlik için `Math.random()` kullanma; kendi seed'li üretecini kullan.
- Algoritmanın her adımında ekrana çizmek yavaştır; çizimleri gruplayarak yap.

## Projeyi genişletme fikirleri

- IEEE etkinlikleri için otomatik afiş/arka plan üretici
- Müziğe tepki veren görseller (ses + grafik)
- Fiziksel çıktı: pen plotter ile kâğıda çizim

## Kaynaklar

- Shiffman — [*The Nature of Code*](https://natureofcode.com/) (ücretsiz çevrimiçi kitap)
- Prusinkiewicz & Lindenmayer — [*The Algorithmic Beauty of Plants*](http://algorithmicbotany.org/papers/#abop) (ücretsiz)
- [p5.js](https://p5js.org/)
- [Inigo Quilez makaleleri](https://iquilezles.org/articles/) — fraktal ve prosedürel grafik
