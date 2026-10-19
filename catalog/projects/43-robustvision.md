# 43 · RobustVision

> **Alan:** K. Bilgisayarlı görü · **Zorluk:** Orta · **Tür:** Deneysel araştırma · **Ekip:** 2 kişi · **MVP:** 4–5 hafta

## Basitçe anlatalım

Bir arkadaşını güneşli bir günde kolayca tanırsın. Peki sisli bir havada, buğulu bir camın arkasından, gece sokak lambasının altında ya da bulanık bir fotoğrafta? Biz insanlar bu durumlarda da çoğunlukla tanırız. Ama bilgisayarların görüntü tanıma modelleri temiz fotoğraflarda çok başarılıyken, biraz bulanıklık veya karlı bir hava eklendiğinde şaşırtıcı hatalar yapabilir.

RobustVision, görüntü tanıma modellerinin **zor koşullara ne kadar dayanıklı** olduğunu ölçer. Fotoğraflara kontrollü şekilde bulanıklık, gürültü, karanlık, sis gibi bozulmalar ekleyip modellerin ne zaman ve nasıl çöktüğünü inceleriz. Sonra da modeli daha dayanıklı hale getirmenin yollarını deneriz.

**Tek cümleyle:** Görüntü sınıflandırma modellerinin bulanıklık, gürültü, ışık ve hava koşulları gibi bozulmalara karşı dayanıklılığını ölçen ve dayanıklılığı artırma yöntemlerini karşılaştıran bir araştırma projesi.

## Problem

Görüntü tanıma modelleri genellikle temiz test verisinde değerlendirilir ve yüksek doğruluk raporlanır. Gerçek dünyada kameralar kirlenir, ışık değişir, hareket bulanıklığı oluşur. Temiz veride yüksek başarı, bozulmuş veride de aynı başarı anlamına gelmez. Bu fark, güvenlik açısından kritik uygulamalarda ciddi sonuçlar doğurabilir.

## Ne geliştirilecek?

- Görüntülere farklı türde ve şiddette bozulmalar ekleyen **bozulma kütüphanesi**
- Farklı modelleri bozulmuş veri üzerinde otomatik değerlendiren **değerlendirme hattı**
- Modelin hangi bozulmada çöktüğünü gösteren **dayanıklılık raporu** (grafikler, örnek hatalar)
- Dayanıklılığı artıran eğitim yöntemlerinin uygulamaları

## Araştırma sorusu

> Farklı mimarilere sahip görüntü sınıflandırma modelleri (CNN ve Vision Transformer) bozulma türlerine karşı ne ölçüde dayanıklıdır? Veri artırma yöntemleri bu dayanıklılığı temiz veri doğruluğundan ne kadar ödün vererek artırır?

## Deney tasarımı

1. **Veri:** CIFAR-10 veya ImageNet'in küçük bir alt kümesi; bunların hazır bozulmuş sürümleri (CIFAR-10-C) ve kendi bozulma kütüphanenle üretilen görüntüler.
2. **Bozulmalar:** Gürültü, bulanıklık (hareket, odak), hava (sis, kar), ışık (parlaklık, kontrast), JPEG sıkıştırma; her biri 5 şiddet düzeyinde.
3. **Modeller:** Standart eğitimli ResNet — baseline; farklı boyutlarda CNN ve küçük Vision Transformer modelleri (hazır eğitilmiş ağırlıklar).
4. **İyileştirme yöntemleri:** Standart veri artırma, AugMix, bozulmuş verilerle eğitim.
5. Temiz doğruluk, bozulma başına doğruluk ve ortalama bozulma hatası hesaplanır. Eğitimde görülmeyen bozulmalara genelleme ayrıca ölçülür.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Temiz doğruluk | Bozulmamış görüntülerde doğruluk | Test kümesi |
| Bozulmuş doğruluk | Her bozulma türü ve şiddetinde doğruluk | Bozulmuş test kümeleri |
| mCE | Tüm bozulmalarda ortalama hata (baseline'a göre) | Standart formül |
| Görülmemiş bozulmalara genelleme | Eğitimde olmayan bozulmalarda başarı | Ayrı test |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Görüntü sınıflandırma** | Bir görüntünün ne olduğunu (kedi, araba, uçak) söyleme |
| **Dayanıklılık** (robustness) | Modelin beklenmedik veya bozulmuş girdilerde de doğru çalışabilmesi |
| **Dağılım kayması** | Gerçek dünyadaki verinin eğitim verisinden farklı olması |
| **Veri artırma** (data augmentation) | Eğitim görüntülerini döndürme, kırpma, renk değiştirme gibi yollarla çeşitlendirme |
| **CNN** | Görüntülerdeki desenleri küçük filtrelerle tarayan sinir ağı |
| **Vision Transformer** | Görüntüyü parçalara bölüp parçalar arası ilişkilere bakan yeni nesil model |
| **mCE** | Modelin bozulmalardaki ortalama hatasını referans modele göre gösteren ölçü |
| **Önceden eğitilmiş model** | Büyük bir veri kümesinde eğitilmiş, hazır kullanılabilen model |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, dayanıklılık literatürünü oku |
| 1–3 | Keşif (K1) | Bozulma kütüphanesi, baseline modelin değerlendirilmesi |
| 4–5 | Geliştirme | **MVP:** birden fazla modeli tüm bozulmalarda değerlendiren hat + rapor |
| 6–8 | Geliştirme (K2) | Farklı mimariler, iyileştirme yöntemleriyle eğitim; ara değerlendirme |
| 9–11 | Tamamlama | Tam deney matrisi, görülmemiş bozulma testleri |
| 12–13 | Tamamlama | Hata analizi, örnek görseller, belgeler |
| 14 | Sonuç (K3) | Teknik rapor |

## Başlamadan önce

**Bilmen iyi olur:** Python, temel derin öğrenme (bir model eğitmiş olmak).
**Öğreneceklerin:** Derin öğrenme değerlendirmesi, dayanıklılık, deney tasarımı, GPU ile çalışma.
**Önerilen teknolojiler:** PyTorch, torchvision, timm, Google Colab veya üniversite GPU kaynakları.

## Dikkat!

- Büyük modelleri sıfırdan eğitmek çok GPU zamanı ister; önceden eğitilmiş modellerle ve küçük veri kümeleriyle başla.
- Test için kullanacağın bozulmaları eğitimde kullanırsan sonuç yanıltıcı olur; eğitim ve test bozulmalarını ayır.
- Rastgele tohumları kaydet; sonuçların tekrarlanabilir olsun.

## Projeyi genişletme fikirleri

- [DocScan](41-docscan.md) veya [OccupancySense](42-occupancysense.md) modellerinin dayanıklılık testi
- Saldırgan (adversarial) örneklere karşı dayanıklılık
- Türkiye'ye özgü koşullarda (ör. yoğun güneş, toz) çekilmiş test kümesi

## Kaynaklar

- Hendrycks & Dietterich (2019) — *Benchmarking Neural Network Robustness to Common Corruptions and Perturbations*
- Hendrycks ve ark. (2020) — *AugMix*
- [RobustBench](https://robustbench.github.io/)
- [timm](https://github.com/huggingface/pytorch-image-models)
