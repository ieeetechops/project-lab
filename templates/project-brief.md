# Project Brief — <Proje Adı>

> Katalogdan seçilen veya yeni önerilen bir projenin bir sayfalık özeti. Proje önerisi açılmadan önce ekip tarafından doldurulur. Kabul edilirse [proje sözleşmesine](project-charter.md) dönüşür.

| Alan | Değer |
| --- | --- |
| Katalog sayfası | catalog/projects/NN-ad.md *(yeni projeyse "—")* |
| Alan | ör. C. Yazılım mühendisliği |
| Tür | Ürün / Deneysel araştırma / Kullanıcı araştırması / Yaratıcı mühendislik |
| Ekip | @kullanıcı, @kullanıcı |

## Problem
*Tek paragraf. Kim, hangi durumda, neyi yapamıyor?*

## Araştırma sorusu
*Ölçülerek cevaplanabilen tek bir soru.*

## Geliştirilecek ürün
*Dönem sonunda elle tutulur ne olacak? (CLI aracı, kütüphane, web uygulaması, simülatör…)*

## Deney
*Neyi neyle, hangi koşullarda karşılaştıracağız? Baseline ne?*

## Başarı ölçütleri

| Metrik | Baseline | Hedef |
| --- | --- | --- |
| | | |

## Teslimatlar
- [ ] GitHub deposu
- [ ] Çalışan prototip
- [ ] Testler
- [ ] Deney veri kümesi / sonuç tabloları
- [ ] Teknik rapor

## Kendi bağlamımız
*Katalogdaki sayfadan neyi değiştirdik, daralttık veya ekledik? Neden?*

---

### Örnek: FlakyTest Detective

| Alan | Değer |
| --- | --- |
| **Problem** | Bazı otomatik testler kod değişmediği hâlde farklı çalıştırmalarda başarısız olabiliyor. |
| **Araştırma sorusu** | Tekrarlı çalıştırma ve geçmiş başarısızlık analizi, kararsız testleri hangi doğruluk ve maliyetle belirleyebilir? |
| **Geliştirilecek ürün** | Test raporlarını inceleyen, kararsızlık şüphesi olan testleri sıralayan CLI aracı. |
| **Deney** | Kontrollü olarak kararsızlaştırılmış testler üzerinde farklı tespit yöntemlerinin karşılaştırılması. |
| **Başarı ölçütleri** | Precision, recall, tespit için gereken çalıştırma sayısı ve işlem süresi. |
| **Teslimatlar** | GitHub deposu, çalışan prototip, testler, deney veri kümesi ve teknik rapor. |
