# 60 · PlotterPath

> **Alan:** O. Ses, müzik ve dijital sanat teknolojileri · **Zorluk:** Orta · **Tür:** Yaratıcı mühendislik + deneysel araştırma · **Ekip:** 2 kişi · **MVP:** 4–5 hafta

## Basitçe anlatalım

Kalemli çizici (pen plotter), bilgisayardan aldığı çizgileri gerçek bir kalemle kâğıda çizen bir makinedir. Dijital sanatçılar bu makinelerle üretken sanat eserlerini fiziksel olarak basar. Ama bir sorun var: bilgisayar çizgileri rastgele bir sırayla gönderirse, kalem kâğıdın bir ucundan diğerine sürekli boşuna gidip gelir. Bir saatte bitecek çizim beş saat sürebilir.

Bu, aslında ünlü bir matematik probleminin kılık değiştirmiş halidir: **gezgin satıcı problemi**. Bir satıcı birçok şehri ziyaret edecek; en kısa rota hangisi? PlotterPath, çizimlerdeki çizgileri **en az boş hareketle** çizecek şekilde sıralayan algoritmaları karşılaştırır ve gerçek bir çizicide çizim süresini ne kadar kısalttıklarını ölçer.

**Tek cümleyle:** Kalemli çiziciler için çizim yolunu optimize eden bir araç geliştiren ve gezgin satıcı problemi sezgisellerini boş hareket mesafesi, hesaplama süresi ve gerçek çizim süresi açısından karşılaştıran bir proje.

## Problem

Kalemli çiziciler dijital sanatta, mimari çizimlerde ve eğitimde kullanılır. Üretken sanat yazılımlarının çıktıları çoğunlukla binlerce çizgi içerir ve çizim sırası optimize edilmediğinde kalem havada uzun mesafeler kat eder. En iyi sıralamayı bulmak NP-zor bir problemdir; pratikte hangi sezgisel yöntemin kalite ve hız arasında en iyi dengeyi sağladığı çizim türüne göre değişir.

## Ne geliştirilecek?

- SVG dosyasını okuyup çizgileri optimize edilmiş sırayla yeniden yazan **komut satırı aracı**
- Uygulanacak yöntemler: en yakın komşu, açgözlü eşleştirme, 2-opt iyileştirme, çizgi yönünü ters çevirme ve bitişik çizgileri birleştirme
- Kalemin izleyeceği yolu ve boş hareketleri animasyonla gösteren önizleme
- Farklı türde test çizimleri (üretken desenler, metin, tarama çizgili görseller, harita)
- Gerçek bir çizici (ör. AxiDraw veya kolun erişebildiği bir çizici) ile süre ölçümü

## Araştırma sorusu

> En yakın komşu, açgözlü eşleştirme ve 2-opt gibi gezgin satıcı problemi sezgiselleri; farklı türdeki çizimlerde kalemin boş hareket mesafesini ve toplam çizim süresini ne kadar azaltır? Ek optimizasyon süresi, kazanılan çizim süresine değer mi?

## Deney tasarımı

1. **Test çizimleri:** 500 – 50.000 çizgi içeren, 5 farklı türde 20 çizim.
2. **Yöntemler:**
   - (A) Dosyadaki orijinal sıra — baseline
   - (B) En yakın komşu
   - (C) B + çizgi yönünü ters çevirme + birleştirme
   - (D) C + 2-opt iyileştirme
3. Boş hareket mesafesi, optimizasyon süresi ve tahmini çizim süresi (çizici hız modeliyle) hesaplanır.
4. Seçilen 4–5 çizim gerçek çizicide basılarak tahmini süre ile gerçek süre karşılaştırılır.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Boş hareket mesafesi | Kalemin kâğıda değmeden kat ettiği yol | Milimetre |
| Toplam çizim süresi | Çizimin baştan sona sürdüğü süre | Dakika (tahmin + gerçek ölçüm) |
| Optimizasyon süresi | Aracın sıralamayı hesaplaması ne kadar sürdü? | Saniye |
| Kalem kaldırma sayısı | Kalem kaç kez kaldırılıp indirildi? | Sayım |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Kalemli çizici** (pen plotter) | Kalemi motorlarla hareket ettirip kâğıda çizim yapan makine |
| **SVG** | Görselleri çizgiler ve şekiller olarak saklayan vektör dosya biçimi |
| **Boş hareket** | Kalemin kaldırılmış halde bir çizgiden diğerine gitmesi |
| **Gezgin satıcı problemi** | Tüm noktaları bir kez ziyaret eden en kısa rotayı bulma problemi |
| **NP-zor** | Kesin en iyi çözümü bulmanın, büyük problemlerde pratikte imkânsız derecede uzun sürdüğü problem sınıfı |
| **Sezgisel** (heuristic) | En iyiyi garanti etmeyen ama hızlıca iyi bir çözüm bulan yöntem |
| **2-opt** | Rotadaki çapraz kesişen iki parçayı ters çevirerek rotayı kısaltan iyileştirme |
| **k-d ağacı** | En yakın noktayı hızlı bulmaya yarayan veri yapısı |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, çizici erişimini netleştir |
| 1–3 | Keşif (K1) | SVG okuma/yazma, test çizimleri, mesafe hesabı, baseline |
| 4–5 | Geliştirme | **MVP:** en yakın komşu ile optimize eden CLI + önizleme |
| 6–8 | Geliştirme (K2) | Ters çevirme, birleştirme, 2-opt, k-d ağacı ile hızlandırma; ara değerlendirme |
| 9–11 | Tamamlama | Deney matrisi, gerçek çizicide ölçüm |
| 12–13 | Tamamlama | Araç paketleme, belgeler |
| 14 | Sonuç (K3) | Teknik rapor ve basılmış eser sergisi |

## Başlamadan önce

**Bilmen iyi olur:** Python veya JavaScript, temel geometri, temel algoritmalar.
**Öğreneceklerin:** Kombinatoryal optimizasyon, hesaplamalı geometri, vektör grafik, dijital üretim.
**Önerilen teknolojiler:** Python (svgpathtools, NumPy, SciPy k-d ağacı) veya TypeScript; vpype ile karşılaştırma.

## Dikkat!

- Çizici yoksa tahmini süre modeliyle çalışabilirsin; ama modelin gerçek süreyle uyumunu bir kez de olsa doğrulamaya çalış.
- 2-opt büyük çizimlerde çok yavaşlayabilir; zaman sınırı veya komşu listesi kullan.
- Çizgilerin yönünü ters çevirmek bazı çizimlerde (ör. fırça efektli kalemler) görüntüyü etkileyebilir.

## Projeyi genişletme fikirleri

- [Generative Canvas](29-generative-canvas.md) eserlerinin doğrudan çiziciye aktarılması
- Fotoğraftan çizici için çizgi sanatı üretme
- Kol etkinliklerinde ziyaretçilere kişisel çizim basan stant

## Kaynaklar

- Applegate ve ark. — *The Traveling Salesman Problem: A Computational Study*
- [vpype](https://github.com/abey79/vpype) — çizici odaklı vektör işleme aracı
- [AxiDraw belgeleri](https://wiki.evilmadscientist.com/AxiDraw)
- [SciPy KDTree](https://docs.scipy.org/doc/scipy/reference/generated/scipy.spatial.KDTree.html)
