# 55 · ParallelBench

> **Alan:** N. Bilimsel hesaplama ve simülasyon · **Zorluk:** Orta–İleri · **Tür:** Deneysel araştırma · **Ekip:** 2 kişi · **MVP:** 4–5 hafta

## Basitçe anlatalım

Bir duvarı boyaman gerekiyor. Tek başına bir günde bitirirsin. Dört arkadaşını çağırırsan dört kat hızlı bitirir misin? Belki. Ama bir tane fırça varsa, ya da herkes aynı boya kovasını kullanmak için sıra beklerse, ya da sürekli "sen hangi kısmı boyadın?" diye konuşursanız o kadar hızlanamazsınız.

Bilgisayarlar da hesaplamaları birden fazla çekirdeğe veya ekran kartına bölerek hızlandırır. Bilim insanları gezegenlerin hareketini, moleküllerin davranışını ya da hava durumunu hesaplarken buna ihtiyaç duyar. ParallelBench, aynı bilimsel hesaplamayı **farklı paralelleştirme yöntemleriyle** yazar ve hangi yöntemin, hangi problem boyutunda, gerçekten ne kadar hızlandırdığını ölçer.

**Tek cümleyle:** N-cisim simülasyonu gibi bilimsel hesaplama problemlerini saf Python, NumPy, Numba, çok işlemcili çalıştırma ve GPU yaklaşımlarıyla uygulayıp hızlanma, ölçeklenme ve geliştirme zahmeti açısından karşılaştıran bir proje.

## Problem

Bilimsel hesaplamada Python yaygın olarak kullanılır ama saf Python yavaştır. Hızlandırmak için birçok seçenek vardır: vektörleştirme, derleme (JIT), çok çekirdekli çalıştırma, GPU. Öğrenciler ve araştırmacılar hangi seçeneğin kendi problemlerine uygun olduğunu, ne kadar kazanç sağlayacağını ve ne kadar emek gerektireceğini genellikle bilmeden karar verir.

## Ne geliştirilecek?

- Üç bilimsel hesaplama problemi: N-cisim yerçekimi simülasyonu, ısı dağılımı (ızgara hesabı), Monte Carlo ile π tahmini
- Her problem için aynı sonucu veren beş uygulama: saf Python, NumPy, Numba, çok işlemcili (multiprocessing), GPU (CuPy veya Numba CUDA)
- Sonuçların doğruluğunu karşılaştıran test takımı
- Farklı problem boyutlarında ve çekirdek sayılarında otomatik çalışan **benchmark düzeneği**
- Sonuçları grafiklerle sunan rapor

## Araştırma sorusu

> Farklı türdeki bilimsel hesaplama problemlerinde (hesaplama yoğun, bellek yoğun, bağımsız örneklemeli) NumPy vektörleştirmesi, Numba JIT derlemesi, çok işlemcili çalıştırma ve GPU hesaplama; problem boyutu ve çekirdek sayısına göre ne kadar hızlanma sağlar ve paralelleştirmenin ek maliyeti hangi boyutun altında kazancı ortadan kaldırır?

## Deney tasarımı

1. **Problemler ve boyutlar:** N-cisim için 100 – 50.000 cisim; ısı dağılımı için 100² – 4000² ızgara; Monte Carlo için 10⁵ – 10⁹ örnek.
2. **Uygulamalar:** Saf Python — baseline; NumPy, Numba, Numba paralel, multiprocessing, GPU.
3. **Donanım:** En az iki farklı bilgisayar (dizüstü ve masaüstü/sunucu); GPU erişimi varsa (ör. üniversite sunucusu veya Colab) GPU testi.
4. Her ölçüm ısınma turlarıyla ve en az 5 tekrarla yapılır; hızlanma, verimlilik (hızlanma / çekirdek sayısı) ve sonuç farkları ölçülür.
5. Her uygulamanın kod satırı ve geliştirme süresi kayıt altına alınır.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Hızlanma | Saf Python'a göre kaç kat hızlı? | Süre oranı |
| Paralel verimlilik | Çekirdek sayısı arttıkça hızlanma ne kadar korunuyor? | Hızlanma / çekirdek |
| Başa baş noktası | Paralelleştirme hangi problem boyutundan sonra kazanç sağlıyor? | Grafik |
| Geliştirme zahmeti | Uygulamayı yazmak ne kadar emek gerektirdi? | Kod satırı, saat |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Paralel hesaplama** | Bir işi parçalara bölüp aynı anda birden fazla işlemciye yaptırma |
| **Çekirdek** | İşlemcinin bağımsız çalışabilen birimi |
| **Vektörleştirme** | Döngü yerine tüm diziyi tek seferde işleyen komutlar kullanma (NumPy) |
| **JIT derleme** | Kodun çalışma anında makine diline çevrilip hızlandırılması (Numba) |
| **GIL** | Python'da aynı anda yalnızca bir iş parçacığının Python kodu çalıştırmasına izin veren kilit |
| **Amdahl yasası** | Bir programın paralelleştirilemeyen kısmının toplam hızlanmayı sınırladığını söyleyen kural |
| **N-cisim problemi** | Birbirini çeken çok sayıda cismin (gezegen, yıldız) hareketini hesaplama |
| **Ek maliyet** (overhead) | İşi bölme, veriyi kopyalama ve sonuçları birleştirme için harcanan süre |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, donanım erişimini netleştir |
| 1–3 | Keşif (K1) | Üç problemin saf Python ve NumPy sürümleri, doğruluk testleri |
| 4–5 | Geliştirme | **MVP:** üç problemi üç yöntemle ölçen benchmark düzeneği |
| 6–8 | Geliştirme (K2) | Numba, multiprocessing, GPU sürümleri; ara değerlendirme |
| 9–11 | Tamamlama | Tam deney matrisi, farklı donanımlarda tekrar |
| 12–13 | Tamamlama | Analiz, "hangi durumda hangi yöntem" kılavuzu |
| 14 | Sonuç (K3) | Teknik rapor |

## Başlamadan önce

**Bilmen iyi olur:** İyi düzeyde Python, NumPy temelleri, temel fizik (kuvvet, ivme).
**Öğreneceklerin:** Yüksek performanslı hesaplama, paralel programlama, performans ölçümü, bilimsel yazılım geliştirme.
**Önerilen teknolojiler:** Python, NumPy, Numba, multiprocessing, CuPy, pytest-benchmark.

## Dikkat!

- Hızlı ama yanlış bir sonuç işe yaramaz; her uygulamanın sonucunu referansla karşılaştır.
- Dizüstü bilgisayarlar ısındıkça yavaşlar; uzun ölçümleri prize takılı ve soğuk başlangıçla yap.
- Numba ilk çalıştırmada derleme yapar; ilk süreyi ölçüme dahil etme, ayrıca raporla.

## Projeyi genişletme fikirleri

- [VisualCompute](32-visualcompute.md) ile tarayıcıda GPU karşılaştırması
- C++ ve OpenMP uygulamalarının eklenmesi
- Üniversite hesaplama kümesinde (cluster) çok düğümlü deneme

## Kaynaklar

- Gorelick & Ozsvald — *High Performance Python*
- [Numba belgeleri](https://numba.readthedocs.io/)
- [CuPy](https://cupy.dev/)
- Amdahl (1967) — *Validity of the single processor approach to achieving large scale computing capabilities*
