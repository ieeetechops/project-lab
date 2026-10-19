# 52 · CloneSpotter

> **Alan:** M. Programlama dilleri ve derleyici araçları · **Zorluk:** Orta · **Tür:** Deneysel araştırma + ürün · **Ekip:** 2 kişi · **MVP:** 4–5 hafta

## Basitçe anlatalım

İki öğrencinin ödevi var. Biri diğerinin kodunu kopyalamış ama değişken adlarını değiştirmiş, birkaç satırın yerini değiştirmiş, araya boş satırlar eklemiş. Kelime kelime karşılaştırırsan iki kod farklı görünür. Ama programın yapısına, yani ne yaptığına bakarsan aynı olduklarını görürsün.

Bu sadece ödevlerde değil, büyük yazılım projelerinde de önemli: Aynı kod parçası projede on farklı yere kopyalanmışsa, birinde bulunan hata diğer dokuzunda da vardır. CloneSpotter, **birbirine benzeyen kod parçalarını** bulan bir araç geliştirir ve farklı yöntemlerin (metin karşılaştırma, kelime dizisi karşılaştırma, yapı karşılaştırma) ne kadar ustaca değiştirilmiş kopyaları yakalayabildiğini ölçer.

**Tek cümleyle:** Kod tekrarlarını ve benzer kod parçalarını tespit eden bir araç geliştiren ve metin, token ve sözdizimi ağacı tabanlı yöntemleri farklı değişiklik türlerine karşı tespit başarısı açısından karşılaştıran bir proje.

## Problem

Kod tekrarı yazılım bakımını zorlaştırır: bir hata düzeltildiğinde kopyaların unutulması yaygındır. Eğitimde ise kod benzerliği tespiti ödevlerin değerlendirilmesinde kullanılır. Basit yöntemler yeniden adlandırma veya satır sırası değişikliği gibi küçük değişikliklerle kolayca atlatılır; gelişmiş yöntemler ise yanlış alarm üretebilir.

## Ne geliştirilecek?

- Python ve Java kodlarında benzer parçaları bulan **CLI aracı**
- Üç tespit yöntemi: metin tabanlı, token tabanlı, soyut sözdizimi ağacı (AST) tabanlı
- Benzer parçaları yan yana ve farkları vurgulayarak gösteren **HTML raporu**
- Bir projedeki tekrarları özetleyen "kod tekrarı haritası"
- Kontrollü değişikliklerle üretilmiş değerlendirme veri kümesi

## Araştırma sorusu

> Metin, token ve AST tabanlı kod benzerliği tespit yöntemleri; yeniden adlandırma, satır sırası değişikliği, ifade eklenmesi/çıkarılması ve yapısal değişiklik içeren kopyaları hangi başarıyla tespit eder ve ne kadar yanlış alarm üretir?

## Deney tasarımı

1. **Veri kümesi:** Açık kaynak projelerden alınan fonksiyonlara kontrollü değişiklikler uygulanarak kopya çiftleri üretilir (Tip-1: birebir, Tip-2: yeniden adlandırma, Tip-3: satır ekleme/çıkarma, Tip-4: aynı işlevi farklı yazma). Benzer olmayan fonksiyon çiftleri de eklenir. Mümkünse BigCloneBench gibi hazır veri kümeleriyle de doğrulanır.
2. **Yöntemler:**
   - (A) Satır bazlı metin karşılaştırma — baseline
   - (B) Token dizisi karşılaştırma (değişken adları normalize edilmiş)
   - (C) AST alt ağaç karşılaştırma
3. Her kopya türü için precision, recall ve çalışma süresi ölçülür; 100 bin satırlık bir projede ölçeklenebilirlik test edilir.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Recall (tür bazında) | Her kopya türünün yüzde kaçı bulundu? | Bilinen kopya çiftleri |
| Precision | "Benzer" denen çiftlerin kaçı gerçekten kopya? | Etiketli veri |
| Çalışma süresi | Büyük bir projeyi taramak ne kadar sürüyor? | Saniye |
| Rapor kullanışlılığı | Geliştiriciler raporu anlaşılır buluyor mu? | Kısa kullanıcı değerlendirmesi |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Kod klonu** | Bir projede birden fazla yerde bulunan aynı veya çok benzer kod parçası |
| **Token** | Kodun en küçük anlamlı parçası (anahtar kelime, değişken adı, sembol) |
| **Normalizasyon** | Değişken adları gibi önemsiz farkları ortadan kaldırma |
| **AST** | Kodun yapısını ağaç şeklinde gösteren veri yapısı |
| **Tip-1/2/3/4 klon** | Birebir kopyadan aynı işi farklı yazmaya kadar giden benzerlik düzeyleri |
| **Parmak izi** (fingerprinting) | Kod parçalarının kısa özetlerini çıkarıp hızlı karşılaştırma yöntemi |
| **Winnowing** | Belgeler arası benzerliği verimli bulmak için kullanılan parmak izi seçme algoritması |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, klon tespiti literatürünü oku |
| 1–3 | Keşif (K1) | Değerlendirme veri kümesi üreteci, metin tabanlı baseline |
| 4–5 | Geliştirme | **MVP:** token tabanlı tespit yapan CLI + HTML rapor |
| 6–8 | Geliştirme (K2) | AST tabanlı yöntem, Java desteği; ara değerlendirme |
| 9–11 | Tamamlama | Karşılaştırma deneyi, ölçeklenebilirlik testleri |
| 12–13 | Tamamlama | Kullanıcı değerlendirmesi, paketleme, belgeler |
| 14 | Sonuç (K3) | Teknik rapor ve açık kaynak araç |

## Başlamadan önce

**Bilmen iyi olur:** Python, temel veri yapıları, ağaç gezinme algoritmaları.
**Öğreneceklerin:** Program analizi, ayrıştırma, benzerlik algoritmaları, yazılım bakımı.
**Önerilen teknolojiler:** Python, tree-sitter (çok dilli ayrıştırma), Jinja2 (HTML rapor).

## Dikkat!

- Bu araç ödev değerlendirmesinde kullanılacaksa sonuçlar yalnızca bir işarettir; kesin karar insan incelemesiyle verilmelidir. Bunu raporda ve araçta açıkça belirt.
- Öğrenci ödevlerini veri kümesi olarak kullanma; açık kaynak kod kullan.
- Kısa ve yaygın kod parçaları (getter/setter, import satırları) yanlış alarm üretir; en küçük parça boyutu belirle.

## Projeyi genişletme fikirleri

- [ChangeImpact](10-changeimpact.md) ile birleşerek kopyalanan koddaki hataların takibi
- TechOps depolarında CI üzerinde çalışan tekrar raporu
- Farklı diller arasında benzerlik (Python ↔ JavaScript)

## Kaynaklar

- Roy, Cordy & Koschke (2009) — *Comparison and evaluation of code clone detection techniques and tools*
- Schleimer, Wilkerson & Aiken (2003) — *Winnowing: Local Algorithms for Document Fingerprinting* (MOSS'un temeli)
- [BigCloneBench](https://github.com/clonebench/BigCloneBench)
- [tree-sitter](https://tree-sitter.github.io/)
