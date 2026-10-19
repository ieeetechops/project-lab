# 09 · FlakyTest Detective

> **Alan:** C. Yazılım mühendisliği · **Zorluk:** Orta · **Tür:** Ürün (CLI) + deneysel araştırma · **Ekip:** 2 kişi · **MVP:** 5–6 hafta · Kısa liste adayı

## Basitçe anlatalım

Evinde bir duman dedektörü var. Bazen yemek yaparken çalıyor, bazen hiçbir şey yokken çalıyor, bazen de gerçekten duman olduğunda çalmıyor. Bir süre sonra ona güvenmeyi bırakıyorsun ve çaldığında bakmıyorsun bile. Ve gün geliyor, gerçek bir yangını kaçırıyorsun.

Yazılımda da **testler** dedektör gibidir: kodda hata varsa "kırmızı" yanarlar. Ama bazı testler **kaprislidir**: kod hiç değişmediği halde bir çalıştırmada geçer, bir sonrakinde kalır. Geliştiriciler bu testlere güvenmeyi bırakır ve gerçek hataları kaçırır. FlakyTest Detective bu kaprisli testleri bulan bir **dedektif**. Asıl soru da şu: bir testi kaç kez çalıştırırsak kaprisli olduğundan emin olabiliriz ve bunun maliyeti ne?

**Tek cümleyle:** Bazen geçip bazen başarısız olan kararsız testleri tespit eden ve tespit yöntemlerinin doğruluğunu ve maliyetini karşılaştıran bir araç.

## Problem

Bazı otomatik testler, kod değişmediği hâlde farklı çalıştırmalarda farklı sonuç verir. Bu "flaky" testler CI'ı güvenilmez yapar, geliştiricilerin zamanını çalar ve gerçek hataların gözden kaçmasına neden olur. En basit çözüm testi çok kez tekrar çalıştırmaktır ama bu pahalıdır.

## Ne geliştirilecek?

- Test raporlarını (JUnit XML vb.) okuyup **kararsızlık şüphesi olan testleri sıralayan CLI aracı**
- Testleri kontrollü şekilde tekrar çalıştıran **yeniden çalıştırma modu**
- Geçmiş CI sonuçlarını analiz eden **tarihsel analiz modu**
- Bilerek kararsızlaştırılmış testlerden oluşan **deney veri kümesi**

## Araştırma sorusu

> Tekrarlı çalıştırma ve geçmiş başarısızlık analizi, kararsız testleri hangi doğrulukla ve hangi maliyetle belirleyebilir?

## Deney tasarımı

1. **Veri kümesi:** Açık kaynak bir projeye bilerek kararsızlık ekle; zamanlamaya bağlı (`sleep`), sıraya bağlı (testlerin çalışma sırası), rastgeleliğe bağlı, ağa bağlı testler. Hangi testlerin kararsız olduğunu sen bildiğin için "doğru cevap" elinde olur.
2. **Yöntemler:**
   - (A) N kez yeniden çalıştırma (N = 3, 5, 10, 20) — baseline
   - (B) Geçmiş CI sonuçlarında geç/kal geçişlerini sayma
   - (C) Test sırasını karıştırarak çalıştırma
   - (D) Birleşik yöntem
3. Her yöntem için precision, recall ve harcanan çalıştırma sayısını ölç.
4. Mümkünse gerçek kararsız test veri kümesiyle (IDoFT) doğrula.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Precision | "Kararsız" dediklerinin kaçı gerçekten kararsız? | Bilinen doğru cevapla karşılaştırma |
| Recall | Kararsız testlerin kaçını bulabildi? | Bilinen doğru cevapla karşılaştırma |
| Gerekli çalıştırma sayısı | Tespit için test kaç kez çalıştırıldı? | Sayaç |
| İşlem süresi | Toplam analiz süresi | Dakika |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Flaky test** (kararsız test) | Kod değişmediği halde bazen geçen bazen kalan test |
| **Test takımı** (test suite) | Bir projedeki testlerin tamamı |
| **CI** | Her kod değişikliğinde testlerin otomatik çalıştırılması |
| **JUnit XML** | Test sonuçlarını kaydetmek için yaygın kullanılan dosya formatı |
| **Sıra bağımlılığı** | Bir testin sonucunun önce hangi testin çalıştığına bağlı olması |
| **Zamanlama bağımlılığı** | Testin bilgisayarın hızına veya bekleme sürelerine bağlı olması |
| **Rerun** | Başarısız testi yeniden çalıştırmak |
| **Ground truth** (doğru cevap) | Hangi testin gerçekten kararsız olduğunun kesin bilgisi |
| **Karantina** | Kararsız testi düzeltilene kadar CI sonucunu etkilemeyecek şekilde ayırmak |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, literatürdeki flaky test sınıflandırmalarını oku |
| 1–3 | Keşif (K1) | Hedef açık kaynak projeyi seç, bilerek kararsızlaştırılmış testleri ekle, N-kez çalıştırma baseline'ı |
| 4–6 | Geliştirme | **MVP:** test raporlarını okuyup şüpheli testleri sıralayan CLI |
| 7–8 | Geliştirme (K2) | Tarihsel analiz modu; ara değerlendirme |
| 9–11 | Tamamlama | Tüm yöntemlerin karşılaştırma deneyi, IDoFT ile doğrulama |
| 12–13 | Tamamlama | Paketleme, GitHub Action, belgeler |
| 14 | Sonuç (K3) | Teknik rapor: "kaç çalıştırma yeterli?" sorusunun cevabı |

## Başlamadan önce

**Bilmen iyi olur:** Python veya Java, birim testi yazmış olmak, temel Git.
**Öğreneceklerin:** Yazılım testi araştırması, istatistiksel değerlendirme, CLI tasarımı, CI otomasyonu.
**Önerilen teknolojiler:** Python, pytest (+ pytest-rerunfailures, pytest-randomly), GitHub Actions; Java tarafı için Maven/JUnit.

## Dikkat!

- Bir testin 20 kez geçmesi "kesinlikle kararlı" demek değildir; olasılıksal bir sonuçtur. Sonuçlarını güven aralığıyla yaz.
- Deneylerde bilgisayarın yükü sonuçları etkiler; ortamı sabit tut.
- Kendi eklediğin kararsızlıklar gerçek dünyayı tam temsil etmeyebilir; bu sınırlılığı rapora yaz.

## Projeyi genişletme fikirleri

- Kararsızlığın **nedenini** tahmin eden sınıflandırıcı (zamanlama mı, sıra mı?)
- TechOps depolarında sürekli çalışan kararsız test raporu

## Kaynaklar

- [IDoFT](https://github.com/TestingResearchIllinois/idoft) — International Dataset of Flaky Tests
- Luo ve ark. (2014) — *An Empirical Analysis of Flaky Tests* (FSE)
- [pytest-rerunfailures](https://github.com/pytest-dev/pytest-rerunfailures)
- [pytest-randomly](https://github.com/pytest-dev/pytest-randomly)
