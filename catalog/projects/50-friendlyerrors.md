# 50 · FriendlyErrors

> **Alan:** M. Programlama dilleri ve derleyici araçları · **Zorluk:** Başlangıç–Orta · **Tür:** Ürün + kullanıcı araştırması · **Ekip:** 2 kişi · **MVP:** 4 hafta

## Basitçe anlatalım

Programlamaya yeni başlayan biri kodunu çalıştırıyor ve ekranda şu yazıyor: `TypeError: 'NoneType' object is not subscriptable`. Ne demek bu? Hata nerede? Ne yapması gerekiyor? Çoğu yeni başlayan bu noktada ya rastgele değişiklikler yapmaya başlar ya da pes eder.

Aynı hata şöyle anlatılabilirdi: "12. satırda `sonuc[0]` yazmışsın ama `sonuc` değişkeninin içi boş (None). Bu genellikle bir fonksiyonun `return` ile değer döndürmeyi unuttuğu durumlarda olur. 8. satırdaki `hesapla` fonksiyonuna bak." FriendlyErrors, yeni başlayanlar için **hata mesajlarını anlaşılır hale getiren** bir araç geliştirir ve bunun öğrencilerin hatayı düzeltme süresini gerçekten kısaltıp kısaltmadığını ölçer.

**Tek cümleyle:** Programlamaya yeni başlayanlar için Python hata mesajlarını açıklayıcı ve Türkçe hale getiren bir araç geliştiren ve iyileştirilmiş mesajların hata düzeltme süresi ve başarısına etkisini öğrencilerle ölçen bir proje.

## Problem

Derleyici ve yorumlayıcı hata mesajları deneyimli geliştiriciler için yazılır. Yeni başlayanlar için bu mesajlar teknik terimler içerir, hatanın gerçek nedenini değil belirtisini gösterir ve çoğunlukla İngilizcedir. Hata mesajlarının iyileştirilmesinin öğrenmeye etkisi konusunda araştırmalar karışık sonuçlar vermiştir; bu nedenle ölçüm yapmak önemlidir.

## Ne geliştirilecek?

- Python programındaki hatayı yakalayıp **açıklayıcı ve Türkçe mesaj** üreten araç
- En sık görülen 20–30 hata türü için açıklama şablonları (değişken adı, satır, olası neden, düzeltme ipucu)
- Kodu analiz edip hatanın gerçek kaynağını bulmaya çalışan modül (ör. `return` unutulmuş fonksiyon)
- Öğrencilerin kod yazdığı ve hata aldığı **web tabanlı deney ortamı**
- Hangi hata türünün ne kadar sık görüldüğünü gösteren anonim istatistikler

## Araştırma sorusu

> Programlamaya yeni başlayan öğrencilerde, açıklayıcı ve ana dilde yazılmış hata mesajları; standart hata mesajlarına kıyasla hatayı düzeltme süresini, düzeltme başarısını ve aynı hatanın tekrarlanma oranını nasıl etkiler?

## Deney tasarımı

1. **Katılımcılar:** Programlamaya giriş dersini alan veya yeni başlamış 30–60 gönüllü öğrenci; rastgele iki gruba ayrılır. Onam alınır, kişisel veri toplanmaz.
2. **Koşullar:**
   - (A) Standart Python hata mesajları — baseline
   - (B) FriendlyErrors mesajları
3. **Görevler:** İçinde bilerek hata bırakılmış 8–10 kısa program; öğrencilerden hataları düzeltmeleri istenir.
4. Her görev için düzeltme süresi, kaç denemede düzeltildiği ve başarı kaydedilir. Sonda kısa bir anket ve aynı hata türlerini içeren yeni görevlerle öğrenme testi yapılır.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Düzeltme süresi | Hatayı düzeltmek ne kadar sürdü? | Deney ortamı kaydı |
| Deneme sayısı | Doğru çözüme kaç çalıştırmada ulaşıldı? | Kayıt |
| Başarı oranı | Hataların yüzde kaçı süre içinde düzeltildi? | Kayıt |
| Öğrenme etkisi | Benzer yeni hatalar daha hızlı düzeltildi mi? | Son test |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Hata mesajı** | Program çalışmadığında dilin verdiği açıklama |
| **Sözdizimi hatası** | Kodun dilin yazım kurallarına uymaması (eksik parantez gibi) |
| **Çalışma zamanı hatası** | Kod yazım olarak doğru ama çalışırken bir sorunla karşılaşıyor |
| **Traceback** | Hatanın hangi fonksiyonlar üzerinden oluştuğunu gösteren çağrı listesi |
| **Statik analiz** | Kodu çalıştırmadan inceleyerek olası sorunları bulma |
| **A/B deneyi** | İki farklı sürümü farklı gruplara verip sonuçları karşılaştırma |
| **Rastgele atama** | Katılımcıların gruplara şansa göre dağıtılması |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, ilgili derslerin hocalarıyla görüş |
| 1–3 | Keşif (K1) | En sık hata türlerinin belirlenmesi, ilk açıklama şablonları |
| 4 | Geliştirme | **MVP:** 10 hata türü için Türkçe açıklama üreten araç |
| 5–8 | Geliştirme (K2) | Neden bulma modülü, web deney ortamı, pilot test; ara değerlendirme |
| 9–11 | Tamamlama | Ana deney |
| 12–13 | Tamamlama | Analiz, aracın pip paketi olarak yayımlanması |
| 14 | Sonuç (K3) | Teknik rapor ve araç |

## Başlamadan önce

**Bilmen iyi olur:** İyi düzeyde Python, programlamaya yeni başlayanlara yardım etmiş olmak faydalı.
**Öğreneceklerin:** Python iç yapısı, statik analiz, eğitim teknolojisi, kullanıcı araştırması, istatistik.
**Önerilen teknolojiler:** Python (`ast`, `traceback` modülleri), Pyodide (tarayıcıda Python), React, Python veya R (analiz).

## Dikkat!

- Yanlış bir açıklama, standart mesajdan daha zararlıdır. Neden bulma modülü emin değilse bunu açıkça belirtmeli.
- Deney sırasında öğrencilerin ders notlarını etkileyecek bir durum oluşturma; katılım gönüllü olmalı.
- Ekip arkadaşlarını katılımcı yapma; görevlerdeki hataları zaten biliyorlar.

## Projeyi genişletme fikirleri

- [MiniLang](49-minilang.md) için hata mesajı tasarımı
- Programlamaya giriş derslerinde kullanılacak eklenti (VS Code, Jupyter)
- Diğer diller (C, Java) için sürümler

## Kaynaklar

- Becker ve ark. (2019) — *Compiler Error Messages Considered Unhelpful* (ITiCSE Working Group)
- [friendly-traceback](https://github.com/friendly-traceback/friendly-traceback) — benzer açık kaynak proje
- [Pyodide](https://pyodide.org/)
- [Python `ast` modülü](https://docs.python.org/3/library/ast.html)
