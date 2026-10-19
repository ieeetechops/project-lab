# 12 · MutationLab

> **Alan:** C. Yazılım mühendisliği · **Zorluk:** Orta–İleri · **Tür:** Deneysel araştırma + araç · **Ekip:** 2 kişi · **MVP:** 5–6 hafta

## Basitçe anlatalım

Bir okulun güvenlik görevlilerinin iyi olup olmadığını nasıl anlarsın? "Görevliler kampüsün %95'ini dolaşıyor" demek, şüpheli birini yakalayabildikleri anlamına gelmez. Dolaşıyor ama bakmıyor olabilirler. Daha iyi bir yöntem: **bilerek** sahte bir "şüpheli" gönderip yakalanıp yakalanmadığına bakmak.

Yazılım testlerinde de durum aynı. "Testlerimiz kodun %90'ını çalıştırıyor" (kod kapsamı) demek, testlerin hata yakaladığı anlamına gelmez. MutationLab, koda **bilerek küçük hatalar** sokar: bir `+` işaretini `-` yapar, bir `>` işaretini `>=` yapar. Sonra testlerin bu sahte hataları yakalayıp yakalamadığına bakar. Yakalanmayan her sahte hata, testlerdeki bir kör noktayı gösterir.

**Tek cümleyle:** Koda bilerek küçük hatalar ekleyip testlerin bunları yakalayıp yakalamadığını ölçen deneysel bir test kalitesi aracı.

## Problem

Kod kapsamı (coverage), test kalitesinin en yaygın ama en yanıltıcı ölçüsüdür. Bir test bir satırı çalıştırıp sonucunu hiç kontrol etmeyebilir. Mutasyon testi daha güçlü bir ölçüdür ama yavaştır ve hangi mutasyon türlerinin gerçek hataları temsil ettiği tartışmalıdır.

## Ne geliştirilecek?

- Basit bir dil alt kümesi için (ör. Python) **mutasyon üreten araç**
- Mutasyonları çalıştırıp hangilerinin "öldürüldüğünü" raporlayan sistem
- Kapsam ve mutasyon skorunu yan yana gösteren **rapor**
- Mutasyon türlerine göre test kör noktalarını sınıflandıran analiz

## Araştırma sorusu

> Kod kapsamı yüksek olan test takımları, farklı hata türlerini yakalamada da aynı ölçüde başarılı mı? Hangi mutasyon türleri, gerçek yazılım hatalarını yakalama yeteneğini en iyi temsil eder?

## Deney tasarımı

1. 3–5 açık kaynak proje seç; kapsam oranları farklı olsun.
2. Her proje için kod kapsamını ve mutasyon skorunu (tür bazında) ölç.
3. **Gerçek hatalarla doğrulama:** Defects4J (Java) veya BugsInPy (Python) gibi gerçek hata veri kümelerinde, mutasyon skoru yüksek testlerin gerçek hataları daha çok yakalayıp yakalamadığına bak.
4. Baseline: mevcut araçlar (mutmut, PIT) ile aynı ölçümler.
5. Maliyet: mutasyon testi kaç kat daha uzun sürüyor? Örnekleme ile hızlandırılabilir mi?

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Mutasyon skoru | Sahte hataların yüzde kaçı testlerle yakalandı? | Öldürülen / toplam mutant |
| Kapsam–mutasyon ilişkisi | Kapsam arttıkça mutasyon skoru da artıyor mu? | Korelasyon analizi |
| Gerçek hata tespiti | Gerçek hataların yüzde kaçı yakalandı? | Defects4J / BugsInPy |
| Çalışma süresi | Normal test süresine göre kaç kat? | Dakika |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Mutasyon testi** | Koda bilerek küçük hatalar ekleyip testlerin bunları yakalayıp yakalamadığına bakma |
| **Mutant** | İçine bilerek küçük bir hata eklenmiş kod sürümü |
| **Mutasyon operatörü** | Hata ekleme kuralı (ör. `+` → `-`, `True` → `False`) |
| **Mutantı öldürmek** | Testlerin o sahte hatayı fark edip başarısız olması |
| **Yaşayan mutant** | Testlerin fark edemediği sahte hata — kör nokta |
| **Eşdeğer mutant** | Değişiklik yapılmış ama davranışı aslında değişmeyen kod; hiçbir test yakalayamaz |
| **Kod kapsamı** | Testler çalışırken kodun yüzde kaçının çalıştırıldığı |
| **Defects4J** | Gerçek Java projelerinden toplanmış, tekrar üretilebilir gerçek hatalar veri kümesi |
| **Korelasyon** | İki ölçünün birlikte artıp azalma eğilimi; nedensellik demek değildir |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Mutasyon testi literatürünü oku, projeleri seç |
| 1–3 | Keşif (K1) | mutmut/PIT ile baseline ölçümleri |
| 4–8 | Geliştirme (K2) | **MVP:** 5 temel operatörlü mutasyon aracı + rapor; ara değerlendirme |
| 9–11 | Tamamlama | Kapsam–mutasyon deneyi, gerçek hata veri kümesiyle doğrulama |
| 12–13 | Tamamlama | Hızlandırma (örnekleme), belgeler |
| 14 | Sonuç (K3) | Teknik rapor ve "testlerin kör noktaları" sunumu |

## Başlamadan önce

**Bilmen iyi olur:** Python veya Java'da orta seviye, birim testi yazmak.
**Öğreneceklerin:** Program dönüştürme (AST), yazılım testi teorisi, deneysel yazılım mühendisliği, istatistik.
**Önerilen teknolojiler:** Python `ast` modülü, pytest, coverage.py, mutmut; Java tarafı için PIT ve Defects4J.

## Dikkat!

- Mutasyon testi çok yavaştır; küçük projelerle başla.
- Eşdeğer mutantlar skoru yapay olarak düşürür; bunlarla nasıl başa çıktığını yaz.
- Korelasyon bulman, kapsamın mutasyon skoruna **neden** olduğunu göstermez.

## Projeyi genişletme fikirleri

- Sadece değişen satırları mutasyona uğratan PR odaklı mod
- Yaşayan mutantlar için otomatik test önerisi

## Kaynaklar

- [Defects4J](https://github.com/rjust/defects4j) — gerçek Java hataları veri kümesi
- [BugsInPy](https://github.com/soarsmu/BugsInPy) — gerçek Python hataları veri kümesi
- [PIT](https://pitest.org) — Java mutasyon testi
- [mutmut](https://github.com/boxed/mutmut) — Python mutasyon testi
- [Stryker](https://stryker-mutator.io) — JavaScript/C#/Scala mutasyon testi
