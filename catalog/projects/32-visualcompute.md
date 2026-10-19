# 32 · VisualCompute

> **Alan:** H. Grafik ve yaratıcı yazılım · **Zorluk:** İleri · **Tür:** Deneysel araştırma + yaratıcı mühendislik · **Ekip:** 2–3 kişi · **MVP:** 5–6 hafta

## Basitçe anlatalım

Bir fotoğraftaki her pikseli biraz daha parlak yapmak istiyorsun. Fotoğrafta 8 milyon piksel var. Bir yol, tek bir çok zeki kişiye bu işi vermek: piksel piksel, sırayla hepsini düzeltir. Diğer yol, 5000 tane sıradan kişiyi bir salona toplamak ve her birine birkaç piksel vermek: hepsi aynı anda çalışır ve iş saniyeler içinde biter.

Bilgisayardaki **işlemci (CPU)** o tek zeki kişi gibidir; **ekran kartı (GPU)** ise o kalabalık salon. Görüntü filtreleri ve binlerce parçacığın hareket ettiği simülasyonlar, kalabalık salonun tam işidir. VisualCompute, bu tür hesaplamaları **tarayıcı içinde** hem CPU hem de GPU ile yapan bir laboratuvar. Asıl soru şu: GPU ne zaman gerçekten daha hızlı ve bu hız, tarayıcılar arasındaki uyumluluk sorunlarına değer mi?

**Tek cümleyle:** Tarayıcı üzerinde görüntü filtreleri ve parçacık simülasyonları çalıştıran, CPU, WebGL ve WebGPU yaklaşımlarını hız, doğruluk ve uyumluluk açısından karşılaştıran bir hesaplama laboratuvarı.

## Problem

Tarayıcılar artık ciddi hesaplamalar yapabiliyor: fotoğraf düzenleme, video efektleri, yapay zekâ modelleri, bilimsel görselleştirme. WebGPU bu alanda büyük bir sıçrama vaat ediyor ama tarayıcılar arasında desteği hâlâ tam değil. Geliştiriciler "WebGPU mu, WebGL mi, yoksa sadece JavaScript/WebAssembly mi?" sorusuna sayılarla cevap veremiyor.

## Ne geliştirilecek?

- Aynı hesaplamaları farklı **arka uçlarla** çalıştırabilen tarayıcı laboratuvarı:
  - JavaScript (tek iş parçacığı) ve Web Workers (çok iş parçacığı)
  - WebAssembly (SIMD ile)
  - WebGL (shader hilesiyle hesaplama)
  - WebGPU (compute shader)
- İş yükleri: görüntü filtreleri (bulanıklaştırma, kenar bulma), parçacık simülasyonu (10³ – 10⁶ parçacık), Game of Life
- Kullanıcının cihazında otomatik benchmark çalıştıran ve sonuçları (anonim) toplayan sayfa
- WebGPU yoksa otomatik olarak WebGL veya CPU'ya geçen **yedekleme katmanı**

## Araştırma sorusu

> Tarayıcıda yapılan görüntü işleme ve parçacık simülasyonu iş yüklerinde, CPU (JS/Wasm), WebGL ve WebGPU yaklaşımları veri boyutuna ve cihaz türüne göre hız, doğruluk ve uyumluluk açısından nasıl karşılaştırılır? GPU'nun avantajı hangi veri boyutundan itibaren başlıyor?

## Deney tasarımı

1. **İş yükleri:** 3 görüntü filtresi (farklı görüntü boyutları: 0,5 – 24 megapiksel) ve parçacık simülasyonu (1.000 – 1.000.000 parçacık).
2. **Arka uçlar:** Tek iş parçacıklı JavaScript — baseline; Web Workers, WebAssembly SIMD, WebGL, WebGPU.
3. **Cihazlar:** En az 4–5 farklı cihaz: dizüstü (entegre GPU), masaüstü (harici GPU), Android telefon, iPhone/iPad. Tarayıcılar: Chrome, Firefox, Safari.
4. Her ölçüm için ısınma turları + tekrarlı ölçüm; GPU'ya veri gönderme ve geri alma süresi ayrıca ölçülür.
5. Doğruluk: GPU sonuçları CPU sonuçlarıyla piksel piksel karşılaştırılır (kayan nokta farkları).

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Hızlanma | Baseline'a göre kaç kat hızlı? | Süre oranı |
| Başa baş noktası | GPU hangi veri boyutundan sonra CPU'yu geçiyor? | Grafik üzerinde kesişim |
| Kare hızı (FPS) | Simülasyon saniyede kaç kare çizebiliyor? | requestAnimationFrame ölçümü |
| Doğruluk farkı | GPU ve CPU sonuçları arasındaki fark | Piksel bazında ortalama hata |
| Uyumluluk | Hangi tarayıcı/cihazda hangi arka uç çalışıyor? | Uyumluluk tablosu |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **CPU / GPU** | Genel amaçlı işlemci / binlerce basit işi aynı anda yapan ekran kartı işlemcisi |
| **Paralel hesaplama** | Bir işi parçalara bölüp aynı anda birçok işlemciye yaptırmak |
| **Shader** | GPU üzerinde çalışan küçük program |
| **Compute shader** | Çizim yerine genel hesaplama için yazılmış shader |
| **WebGL / WebGPU** | Tarayıcıdan GPU'yu kullanmayı sağlayan teknolojiler; WebGPU daha yeni ve daha güçlü |
| **WGSL** | WebGPU'nun shader dili |
| **WebAssembly SIMD** | Tarayıcıda tek komutla birden fazla sayı üzerinde işlem yapabilen hızlı kod |
| **Web Worker** | Tarayıcıda arka planda ayrı iş parçacığında çalışan JavaScript |
| **Konvolüsyon** | Her pikselin komşularıyla birlikte hesaplandığı filtre işlemi (bulanıklaştırma, kenar bulma) |
| **Kayan nokta hassasiyeti** | Bilgisayarda ondalık sayıların sınırlı hassasiyetle saklanması; GPU ve CPU küçük farklar üretebilir |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, WebGPU temellerini ve tarayıcı desteğini incele |
| 1–3 | Keşif (K1) | JS baseline'ı, ölçüm altyapısı, ilk WebGL filtre |
| 4–6 | Geliştirme | **MVP:** 1 filtre + parçacık simülasyonu, CPU ve WebGL arka uçlarıyla, benchmark sayfası |
| 7–8 | Geliştirme (K2) | WebGPU ve Wasm SIMD; yedekleme katmanı; ara değerlendirme |
| 9–11 | Tamamlama | Çok cihazlı deney, doğruluk analizi |
| 12–13 | Tamamlama | Herkese açık benchmark sayfası, görsel demo |
| 14 | Sonuç (K3) | Teknik rapor ve canlı demo |

## Başlamadan önce

**Bilmen iyi olur:** JavaScript/TypeScript iyi düzeyde, lineer cebir temelleri, bilgisayar grafiklerine ilgi.
**Öğreneceklerin:** GPU programlama, paralel hesaplama, performans mühendisliği, tarayıcı uyumluluğu.
**Önerilen teknolojiler:** TypeScript, WebGPU (WGSL), WebGL2 (GLSL), Rust → WebAssembly, Vite.

## Dikkat!

- WebGPU desteği tarayıcıya, işletim sistemine ve sürüme göre değişir. Deneyden önce MDN ve tarayıcı uyumluluk tablolarını kontrol et; her zaman çalışan bir yedek yol (WebGL/CPU) bulundur.
- GPU ölçümlerinde veriyi GPU'ya gönderme ve geri alma süresini atlarsan GPU'yu olduğundan hızlı gösterirsin.
- Telefonlarda ısınma nedeniyle performans düşer; uzun testlerde bunu kaydet.
- İlk WebGPU kodun büyük ihtimalle çalışmayacak; hata ayıklama için küçük adımlarla ilerle.

## Projeyi genişletme fikirleri

- [Browser ImageLab](03-browser-imagelab.md) için GPU hızlandırma
- [Generative Canvas](29-generative-canvas.md) algoritmalarının GPU sürümleri
- Tarayıcıda küçük bir sinir ağının GPU ile çalıştırılması

## Kaynaklar

- [MDN: WebGPU API](https://developer.mozilla.org/en-US/docs/Web/API/WebGPU_API) — güncel tarayıcı desteği dahil
- [WebGPU Fundamentals](https://webgpufundamentals.org/)
- [WebGL2 Fundamentals](https://webgl2fundamentals.org/)
- [Can I use: WebGPU](https://caniuse.com/webgpu)
