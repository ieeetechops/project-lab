# 03 · Browser ImageLab

> **Alan:** A. Web teknolojileri · **Zorluk:** Orta · **Tür:** Ürün + deneysel araştırma · **Ekip:** 2 kişi · **MVP:** 5 hafta

## Basitçe anlatalım

Bir fotoğrafı küçültmek istediğinde genellikle bir siteye yüklersin, o site fotoğrafı kendi bilgisayarında küçültür ve sana geri gönderir. Yani fotoğrafın **başkasının bilgisayarına gider**. Fotoğraf kişiselse bu iyi değil, üstelik yükleme ve indirme zaman alır.

Browser ImageLab, işi **senin bilgisayarında, tarayıcının içinde** yapar. Fotoğraf hiçbir yere gitmez. Burada ilginç bir soru var: tarayıcıda iş yapmanın iki yolu var. Biri herkesin bildiği JavaScript, diğeri WebAssembly adlı daha "makineye yakın" ve hızlı bir yöntem. Bunu bisiklet ile motosiklet gibi düşün: motosiklet daha hızlı ama ağır ve çalıştırması zahmetli. Hangisi hangi işte daha mantıklı? Bunu ölçeceğiz.

**Tek cümleyle:** Fotoğrafları hiçbir sunucuya göndermeden tarayıcıda düzenleyen bir araç ve JavaScript ile WebAssembly'nin karşılaştırılması.

## Problem

Görsel sıkıştırma ve düzenleme çoğunlukla sunucuya yükleme gerektirir; bu gizlilik riski, bant genişliği maliyeti ve gecikme demektir. Tarayıcıda çalışan çözümler var, ancak öğrenciler ve geliştiriciler JavaScript ile WebAssembly arasında **hangi işlem için hangisinin ne kadar avantajlı olduğunu** gösteren tekrarlanabilir karşılaştırmalara kolay ulaşamaz.

## Ne geliştirilecek?

- Tamamen istemci tarafında çalışan, **yeniden boyutlandırma, sıkıştırma, format dönüştürme ve temel filtreler** sunan web uygulaması
- Aynı işlemin **JavaScript ve WebAssembly** sürümleri
- Kalite, hız ve bellek kullanımını ölçen **benchmark sayfası**

## Araştırma sorusu

> Tarayıcıda görüntü işleme işlemleri için WebAssembly, saf JavaScript'e göre hangi görüntü boyutlarında ve hangi işlem türlerinde anlamlı hız ve bellek avantajı sağlar; bu avantaj indirme boyutu ve başlatma maliyetine değer mi?

## Deney tasarımı

1. **İşlemler:** yeniden boyutlandırma, JPEG/WebP sıkıştırma, bulanıklaştırma filtresi.
2. **Görüntüler:** küçük (0,5 MP), orta (4 MP), büyük (24 MP); fotoğraf, ekran görüntüsü, çizim türleri.
3. **Uygulamalar:** saf JS, Canvas API (tarayıcının hazır özelliği — baseline), WebAssembly (Rust veya C ile).
4. **Cihazlar:** en az bir masaüstü ve bir orta seviye telefon.
5. Her ölçüm 10 tekrar; ilk çalıştırma (soğuk) ve sonraki çalıştırmalar (sıcak) ayrı raporlanır.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| İşlem süresi | Bir görüntünün işlenmesi kaç ms sürdü? | `performance.now()` |
| Bellek kullanımı | Tepe bellek tüketimi | Tarayıcı bellek araçları |
| Görüntü kalitesi | Sıkıştırılmış görüntü orijinale ne kadar benziyor? | SSIM / PSNR |
| Dosya boyutu | Çıktı ne kadar küçüldü? | KB cinsinden |
| Başlatma maliyeti | WASM modülünün indirilip hazır olma süresi | Ağ ve zaman ölçümü |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **İstemci tarafı** (client-side) | İşin kullanıcının kendi cihazında, tarayıcıda yapılması |
| **WebAssembly (WASM)** | Tarayıcıda neredeyse makine hızında çalışan, C/Rust gibi dillerden derlenen kod formatı |
| **Canvas API** | Tarayıcıda piksel piksel çizim yapmayı sağlayan hazır özellik |
| **Web Worker** | Ağır işleri arka planda yapıp sayfanın donmasını engelleyen yardımcı iş parçacığı |
| **Kayıplı sıkıştırma** | Gözün fark etmeyeceği detayları atarak dosyayı küçültmek (JPEG gibi) |
| **SSIM / PSNR** | İki görüntünün birbirine ne kadar benzediğini sayıyla ölçen yöntemler |
| **Soğuk / sıcak başlatma** | İlk çalıştırma (her şey yükleniyor) / sonraki çalıştırmalar (her şey hazır) |
| **Megapiksel (MP)** | Bir milyon piksel; görüntü çözünürlüğü ölçüsü |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Squoosh gibi mevcut araçları incele, eksikleri yaz |
| 1–3 | Keşif (K1) | Canvas ile yeniden boyutlandırma (baseline), Rust → WASM "merhaba dünya" |
| 4–8 | Geliştirme (K2) | **MVP:** tarayıcıda sıkıştırma + JS/WASM sürümleri; ara değerlendirme |
| 9–11 | Tamamlama | Benchmark sayfası, cihaz ve görüntü setiyle ölçümler |
| 12–13 | Tamamlama | Arayüz iyileştirme, Web Worker, belgeler |
| 14 | Sonuç (K3) | Teknik rapor ve canlı demo |

## Başlamadan önce

**Bilmen iyi olur:** JavaScript, temel görüntü kavramları (piksel, RGB). Rust veya C bilmek artı ama şart değil.
**Öğreneceklerin:** WebAssembly derleme zinciri, performans ölçümü, görüntü kalite metrikleri.
**Önerilen teknolojiler:** TypeScript, Vite, Rust + wasm-pack (veya Emscripten), Web Workers.

## Dikkat!

- WASM her zaman daha hızlı değildir; JS ↔ WASM arasında veri kopyalamak maliyetlidir. Bunu ölç.
- Tarayıcının hazır Canvas fonksiyonları çok optimize olabilir; güçlü bir baseline'dır.
- Telefon ölçümleri cihaz ısındıkça değişir; ölçümler arasında ara ver.

## Projeyi genişletme fikirleri

- IEEE etkinlik fotoğraflarını yüklemeden önce otomatik küçülten bileşen
- Toplu (batch) işlem ve ZIP olarak indirme

## Kaynaklar

- [Squoosh](https://squoosh.app) — Google'ın tarayıcı tabanlı görüntü sıkıştırma uygulaması
- [WebAssembly](https://webassembly.org)
- [MDN: WebAssembly](https://developer.mozilla.org/en-US/docs/WebAssembly)
- [Rust and WebAssembly kitabı](https://rustwasm.github.io/docs/book/)
