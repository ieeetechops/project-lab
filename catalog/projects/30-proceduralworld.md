# 30 · ProceduralWorld

> **Alan:** H. Grafik ve yaratıcı yazılım · **Zorluk:** Orta · **Tür:** Yaratıcı mühendislik + deneysel araştırma · **Ekip:** 2 kişi · **MVP:** 4–6 hafta · Kısa liste adayı

## Basitçe anlatalım

Minecraft'ta yeni bir dünya açtığında karşına daha önce kimsenin görmediği dağlar, nehirler ve ormanlar çıkar. Ama bu dünyaları kimse elle çizmedi. Oyuna küçük bir sayı (seed) verilir ve oyun bu sayıdan, belirli kurallarla koca bir dünya **yetiştirir**. Aynı sayıyı arkadaşına verirsen o da birebir aynı dünyayı görür.

ProceduralWorld, tek bir sayıdan 2D oyun haritaları üreten bir sistem. İşin zor ve ilginç tarafı şu: rastgele üretmek kolay, ama **oynanabilir** üretmek zor. Haritada her yere ulaşılabiliyor mu? Çok mu boş, çok mu kalabalık? Her harita birbirinin kopyası mı, yoksa gerçekten farklı mı? Bunları ölçmek projenin araştırma kısmı.

**Tek cümleyle:** Seed değerinden otomatik 2D oyun haritaları veya sanal ortamlar üreten ve üretim çeşitliliğini, oynanabilirliği ve hesaplama maliyetini ölçen bir sistem.

## Problem

Prosedürel içerik üretimi oyun endüstrisinde (Minecraft, No Man's Sky, Spelunky, roguelike oyunlar) yaygındır, ama iyi bir üreteç yazmak zordur: çıktılar ya tekdüze ya kaotik olur ya da oyun açısından bozuktur (ulaşılamayan bölgeler, imkânsız geçitler). Farklı üretim algoritmalarının bu açılardan sistemli karşılaştırılması nadiren yapılır.

## Ne geliştirilecek?

- Seed'den harita üreten **üreteç kütüphanesi**
- Algoritmalar: gürültü tabanlı arazi (Perlin/Simplex), hücresel otomat ile mağara, BSP ile zindan odaları, Wave Function Collapse (WFC) ile karo tabanlı haritalar
- Üretilen haritayı otomatik analiz eden **değerlendirici**: ulaşılabilirlik, alan dağılımı, yol uzunlukları
- Haritada gezilebilen basit, oynanabilir **demo oyun** (tarayıcıda)
- Seed paylaşma ve galeri sayfası

## Araştırma sorusu

> Farklı prosedürel üretim algoritmaları; çıktı çeşitliliği, oynanabilirlik (ulaşılabilirlik, denge) ve üretim süresi açısından nasıl karşılaştırılır? Algoritmaları birleştirmek (ör. gürültü + kısıt tabanlı düzeltme) bu dengeyi iyileştirir mi?

## Deney tasarımı

1. **Algoritmalar:** Saf rastgele karo yerleştirme — baseline; Perlin gürültüsü, hücresel otomat, BSP, WFC ve bir hibrit yöntem.
2. Her algoritmayla 1000 seed'den harita üret.
3. **Otomatik ölçümler:** Ulaşılabilir alan oranı, en kısa yol uzunlukları, bölge sayısı, haritalar arası çeşitlilik (ör. karo dağılımı farkı, ifade aralığı analizi).
4. **Kullanıcı ölçümü:** 15–25 gönüllüye demo oyunda farklı algoritmaların haritalarını oynat; "ilginçlik" ve "adillik" puanı, haritayı bitirme süresi.
5. Üretim süresini harita boyutuna göre ölç.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Ulaşılabilirlik | Haritanın yüzde kaçına başlangıçtan gidilebiliyor? | Taşma doldurma (flood fill) |
| Çeşitlilik | Farklı seed'lerin haritaları birbirinden ne kadar farklı? | İkili harita mesafesi |
| Oyuncu puanı | Oyuncular haritayı ne kadar ilginç ve adil buldu? | 1–7 ölçeği |
| Üretim süresi | Harita üretmek ne kadar sürüyor? | Milisaniye |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Prosedürel üretim** (PCG) | İçeriğin elle değil, algoritmayla otomatik üretilmesi |
| **Seed** | Üretimi başlatan sayı; aynı seed her zaman aynı dünyayı üretir |
| **Karo** (tile) | Haritayı oluşturan kare parçalar (çim, su, duvar) |
| **Perlin / Simplex gürültüsü** | Doğal görünen tepe ve vadiler üreten yumuşak rastgelelik |
| **Hücresel otomat** | Her karenin komşularına bakarak değiştiği basit kural sistemi; mağara üretmek için idealdir |
| **BSP** | Alanı tekrar tekrar ikiye bölerek oda yerleşimi üreten yöntem |
| **Wave Function Collapse** (WFC) | Hangi karonun hangisinin yanına gelebileceği kurallarına uyarak haritayı adım adım dolduran algoritma |
| **Flood fill** | Bir noktadan başlayıp ulaşılabilen tüm alanı boyayan algoritma |
| **İfade aralığı** (expressive range) | Bir üretecin ne kadar farklı türde çıktı üretebildiğinin görselleştirilmesi |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, PCG kitabının ilgili bölümlerini oku |
| 1–3 | Keşif (K1) | Karo haritası altyapısı, seed'li üreteç, gürültü ve hücresel otomat |
| 4–6 | Geliştirme | **MVP:** 2 algoritmayla harita üretip tarayıcıda gösteren ve gezilebilen demo |
| 7–8 | Geliştirme (K2) | BSP, WFC, otomatik değerlendirici; ara değerlendirme |
| 9–11 | Tamamlama | 1000 seed'lik deney, hibrit yöntem, oyuncu testi |
| 12–13 | Tamamlama | Galeri ve seed paylaşma, demo cilası |
| 14 | Sonuç (K3) | Teknik rapor ve **canlı demo** |

## Başlamadan önce

**Bilmen iyi olur:** JavaScript/TypeScript veya C#, temel veri yapıları (2D dizi, kuyruk), grafik arama (BFS) bilgisi faydalı.
**Öğreneceklerin:** Prosedürel üretim, oyun geliştirme, algoritma tasarımı, otomatik değerlendirme, kullanıcı testi.
**Önerilen teknolojiler:** TypeScript + Phaser veya PixiJS; alternatif olarak Godot veya Unity (C#).

## Dikkat!

- Grafiklere çok zaman harcama; basit renkli karelerle başla. Bu projenin özü algoritma ve ölçüm.
- WFC çelişkiye düşüp takılabilir; geri alma (backtracking) veya yeniden başlatma stratejisi düşün.
- "Çeşitlilik" tek bir sayıyla tam ölçülemez; birkaç farklı ölçüm kullan ve örnek haritaları rapora ekle.

## Projeyi genişletme fikirleri

- [AdaptivePuzzle](31-adaptivepuzzle.md) ile birleşip oyuncuya göre zorlaşan harita
- 3D arazi üretimi
- Haritaya hikâye ve görev yerleştiren üreteç

## Kaynaklar

- Shaker, Togelius & Nelson — [*Procedural Content Generation in Games*](https://www.pcgbook.com/) (ücretsiz)
- [Wave Function Collapse](https://github.com/mxgmn/WaveFunctionCollapse) — orijinal uygulama
- [Red Blob Games](https://www.redblobgames.com/) — harita üretimi ve yol bulma üzerine interaktif yazılar
- Smith & Whitehead (2010) — *Analyzing the Expressive Range of a Level Generator*
