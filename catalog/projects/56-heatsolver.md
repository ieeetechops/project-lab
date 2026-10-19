# 56 · HeatSolver

> **Alan:** N. Bilimsel hesaplama ve simülasyon · **Zorluk:** Orta · **Tür:** Deneysel araştırma + eğitim aracı · **Ekip:** 2 kişi · **MVP:** 4 hafta

## Basitçe anlatalım

Soğuk bir metal kaşığın ucunu sıcak çaya batırdığında, sıcaklık yavaş yavaş sapa doğru ilerler. Birkaç dakika sonra sapını tuttuğun yer de ısınır. Bu yayılmanın nasıl gerçekleştiğini anlatan bir denklem var: **ısı denklemi**. Mühendisler bu denklemi bilgisayar kasalarını soğutmaktan bina yalıtımına kadar pek çok tasarımda kullanır.

Ama bu denklemi kâğıt üzerinde çözmek çoğu zaman mümkün değildir. Bilgisayar ise kaşığı küçük parçalara böler ve her parçanın sıcaklığını küçük zaman adımlarıyla günceller. İşin ilginç yanı şu: zaman adımını biraz büyük seçersen sonuçlar saçmalamaya başlar ve sıcaklıklar sonsuza fırlar. HeatSolver, ısı denklemini **farklı sayısal yöntemlerle** çözer ve hangi yöntemin ne zaman doğru, ne zaman kararsız olduğunu gösterir.

**Tek cümleyle:** Isı denklemini açık ve örtük sonlu farklar yöntemleriyle çözen, doğruluk, kararlılık ve hesaplama maliyetini karşılaştıran ve sonuçları etkileşimli olarak görselleştiren bir proje.

## Problem

Kısmi diferansiyel denklemler mühendisliğin her alanında kullanılır ama sayısal çözüm yöntemlerinin kararlılık ve doğruluk özellikleri derslerde çoğunlukla teorik olarak anlatılır. Öğrenciler zaman adımı ve ızgara boyutu seçiminin sonucu nasıl etkilediğini görerek öğrenme fırsatı nadiren bulur.

## Ne geliştirilecek?

- 1D ve 2D ısı denklemi için **sayısal çözücüler**: açık Euler (FTCS), örtük Euler, Crank–Nicolson
- Farklı başlangıç ve sınır koşulları (sabit sıcaklık, yalıtılmış kenar, ısı kaynağı)
- Analitik çözümü bilinen test problemleriyle doğrulama modülü
- Parametreleri değiştirip sonucu anında gösteren **etkileşimli görselleştirme** (ısı haritası, animasyon)
- Örnek mühendislik senaryosu: soğutucu kanatlı bir işlemci yüzeyi veya duvar yalıtımı

## Araştırma sorusu

> Isı denkleminin açık, örtük ve Crank–Nicolson sonlu farklar çözümleri; zaman adımı ve ızgara çözünürlüğü değiştikçe doğruluk, kararlılık ve hesaplama süresi açısından nasıl karşılaştırılır? Belirli bir doğruluk hedefine en az hesaplamayla hangi yöntem ulaşır?

## Deney tasarımı

1. **Test problemleri:** Analitik çözümü bilinen 1D ve 2D problemler.
2. **Yöntemler:** Açık Euler (FTCS) — baseline; örtük Euler, Crank–Nicolson.
3. **Değişkenler:** Izgara aralığı (Δx) ve zaman adımı (Δt) farklı değerlerde; kararlılık sınırının altında ve üstünde.
4. Analitik çözümle hata hesaplanır; ızgara inceldikçe hatanın azalma hızı (yakınsama düzeni) ölçülür.
5. Belirli bir hata eşiğine ulaşmak için gereken hesaplama süresi karşılaştırılır.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Hata | Sayısal çözüm gerçek çözümden ne kadar farklı? | Analitik çözümle karşılaştırma |
| Yakınsama düzeni | Izgara yarıya inince hata ne kadar azalıyor? | Log-log grafik eğimi |
| Kararlılık sınırı | Hangi zaman adımından sonra çözüm bozuluyor? | Deneysel + teorik |
| Hedef doğruluk maliyeti | Belirli hata düzeyine ulaşmak için harcanan süre | Saniye |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Isı denklemi** | Sıcaklığın zaman ve mekânda nasıl yayıldığını tanımlayan denklem |
| **Kısmi diferansiyel denklem** | Birden fazla değişkene (zaman, konum) bağlı değişimi tanımlayan denklem |
| **Sonlu farklar** | Türevleri, birbirine yakın noktalardaki değerlerin farkıyla yaklaşık hesaplama |
| **Açık yöntem** | Yeni değerleri doğrudan eski değerlerden hesaplayan yöntem; hızlı ama kararsız olabilir |
| **Örtük yöntem** | Yeni değerleri bir denklem sistemi çözerek bulan yöntem; daha kararlı ama adım başına pahalı |
| **Kararlılık** | Hesaplama hatalarının zamanla büyümeden kalması |
| **Sınır koşulu** | Nesnenin kenarlarında sıcaklığın nasıl davrandığına dair kural |
| **Seyrek matris** | Çoğu elemanı sıfır olan matris; örtük yöntemlerde verimli çözüm sağlar |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, sayısal yöntemler kaynaklarını oku |
| 1–3 | Keşif (K1) | 1D açık yöntem, analitik testler, kararlılık gözlemi |
| 4 | Geliştirme | **MVP:** 1D üç yöntemi karşılaştıran çözücü + grafikler |
| 5–8 | Geliştirme (K2) | 2D çözücüler, seyrek matris çözümü, etkileşimli görselleştirme; ara değerlendirme |
| 9–11 | Tamamlama | Yakınsama ve maliyet deneyleri, mühendislik senaryosu |
| 12–13 | Tamamlama | Eğitim sayfası, belgeler |
| 14 | Sonuç (K3) | Teknik rapor ve etkileşimli demo |

## Başlamadan önce

**Bilmen iyi olur:** Python, türev ve integral kavramları, temel lineer cebir.
**Öğreneceklerin:** Sayısal analiz, kısmi diferansiyel denklemler, bilimsel görselleştirme, hata analizi.
**Önerilen teknolojiler:** Python, NumPy, SciPy (seyrek matrisler), matplotlib veya Plotly; tarayıcı sürümü için TypeScript.

## Dikkat!

- Hatayı mutlaka analitik çözümle ölç; "grafik makul görünüyor" yeterli bir doğrulama değildir.
- 2D örtük yöntemlerde yoğun matris kullanmak belleği hızla tüketir; seyrek matris kullan.
- Birimleri tutarlı kullan (metre, saniye, Kelvin).

## Projeyi genişletme fikirleri

- Sonlu elemanlar yöntemiyle karmaşık geometriler
- [ParallelBench](55-parallelbench.md) ile büyük ızgaralarda paralel çözüm
- Sayısal analiz dersinde kullanılacak etkileşimli ders materyali

## Kaynaklar

- LeVeque — *Finite Difference Methods for Ordinary and Partial Differential Equations*
- Barba — [*12 Steps to Navier–Stokes*](https://lorenabarba.com/blog/cfd-python-12-steps-to-navier-stokes/)
- [SciPy sparse belgeleri](https://docs.scipy.org/doc/scipy/reference/sparse.html)
- Strang — *Computational Science and Engineering*
