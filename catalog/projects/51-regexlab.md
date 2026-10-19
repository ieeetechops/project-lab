# 51 · RegexLab

> **Alan:** M. Programlama dilleri ve derleyici araçları · **Zorluk:** Orta · **Tür:** Deneysel araştırma + ürün · **Ekip:** 2 kişi · **MVP:** 4–5 hafta

## Basitçe anlatalım

Bir telefon rehberinde "adı A ile başlayıp soyadı 'han' ile biten herkesi bul" demek istiyorsun. Bilgisayarlarda bu tür aramalar **düzenli ifadelerle** (regex) yapılır: e-posta adreslerini doğrulamak, bir metindeki tarihleri bulmak, log dosyalarını taramak için her yerde kullanılır.

Ama düzenli ifadelerin bir tuzağı var. Bazı ifadeler, belirli bir metinle karşılaşınca bilgisayarı saniyeler, dakikalar, hatta saatlerce meşgul edebilir; çünkü arama motoru olası tüm yolları tek tek denemeye başlar. Bir web sitesine bu tür bir metin gönderen biri sunucuyu kilitleyebilir. RegexLab, **kendi düzenli ifade motorunu yazarak** farklı arama yöntemlerini karşılaştırır ve bu tehlikeli ifadeleri önceden tespit eden bir araç geliştirir.

**Tek cümleyle:** İki farklı yaklaşımla (geri izleme ve otomat tabanlı) bir düzenli ifade motoru geliştiren, performanslarını karşılaştıran ve aşırı yavaşlamaya yol açan tehlikeli ifadeleri tespit eden bir araç yapan proje.

## Problem

Düzenli ifadeler yazılımın her yerindedir. Çoğu programlama dilinin düzenli ifade motoru geri izleme yöntemini kullanır ve bu yöntem bazı ifadelerde girdinin boyutuyla üstel olarak yavaşlayabilir. Bu durum ReDoS (düzenli ifade hizmet engelleme) güvenlik açıklarına yol açar. Geliştiriciler yazdıkları ifadenin tehlikeli olup olmadığını genellikle bilmez.

## Ne geliştirilecek?

- **Geri izleme** (backtracking) tabanlı düzenli ifade motoru
- **Thompson NFA** (otomat) tabanlı düzenli ifade motoru
- Bir ifadenin iç yapısını (otomat diyagramı) ve eşleştirme adımlarını görselleştiren araç
- Tehlikeli ifadeleri statik analizle bulan **ReDoS tespit aracı**
- Açık kaynak projelerdeki ifadeleri tarayan komut satırı aracı

## Araştırma sorusu

> Geri izleme ve otomat tabanlı düzenli ifade motorları, normal ve kötü niyetli girdilerde çalışma süresi açısından nasıl karşılaştırılır? Statik analiz, açık kaynak projelerdeki tehlikeli ifadelerin ne kadarını doğru tespit edebilir?

## Deney tasarımı

1. **Motor karşılaştırması:**
   - (A) Geri izleme motoru — baseline
   - (B) Thompson NFA motoru
   - Referans olarak Python `re`, JavaScript ve Go `regexp` (RE2 yaklaşımı)
2. **Girdiler:** Normal metinler ve bilinen tehlikeli desenler için büyüyen boyutlarda kötü niyetli girdiler.
3. **Tespit deneyi:** Açık kaynak projelerden (npm, PyPI) toplanan binlerce düzenli ifade taranır; tespit edilenlerin bir örneklemi gerçek girdilerle doğrulanır.
4. Çalışma süresi, girdi boyutuna göre büyüme eğrisi, tespit aracının precision ve recall değerleri ölçülür.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Eşleştirme süresi | İfade metinde ne kadar sürede eşleşiyor? | Mikrosaniye |
| Büyüme eğrisi | Girdi büyüdükçe süre nasıl artıyor (doğrusal mı, üstel mi)? | Grafik |
| Tespit precision | "Tehlikeli" denen ifadelerin kaçı gerçekten tehlikeli? | Gerçek girdiyle doğrulama |
| Tespit recall | Bilinen tehlikeli ifadelerin kaçı bulundu? | Bilinen örnekler kümesi |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Düzenli ifade** (regex) | Metinde desen aramak için kullanılan özel yazım dili |
| **Geri izleme** (backtracking) | Bir yol başarısız olunca geri dönüp başka yolu deneyen arama yöntemi |
| **Sonlu otomat** | Durumlar ve aralarındaki geçişlerden oluşan basit makine modeli |
| **NFA** | Aynı anda birden fazla durumda olabilen otomat; Thompson yöntemiyle düzenli ifadeden kurulur |
| **ReDoS** | Kötü niyetli girdiyle düzenli ifade motorunu kilitleyen hizmet engelleme saldırısı |
| **Üstel karmaşıklık** | Girdi bir birim büyüyünce sürenin katlanarak artması |
| **Statik analiz** | Kodu veya ifadeyi çalıştırmadan inceleyerek sorun bulma |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, otomat teorisi ve regex motorlarını oku |
| 1–3 | Keşif (K1) | Regex ayrıştırıcı, geri izleme motoru, test takımı |
| 4–5 | Geliştirme | **MVP:** iki motorun aynı ifadeleri çalıştırıp süresini karşılaştırması |
| 6–8 | Geliştirme (K2) | Görselleştirme, ReDoS tespit aracı; ara değerlendirme |
| 9–11 | Tamamlama | Açık kaynak ifadelerin taranması ve doğrulama |
| 12–13 | Tamamlama | Aracın paketlenmesi, belgeler |
| 14 | Sonuç (K3) | Teknik rapor |

## Başlamadan önce

**Bilmen iyi olur:** Bir programlama dilinde iyi düzeyde kodlama, temel düzenli ifade kullanımı, özyineleme.
**Öğreneceklerin:** Otomat teorisi, derleyici ön yüzü, algoritma karmaşıklığı, yazılım güvenliği.
**Önerilen teknolojiler:** TypeScript, Go veya Rust; görselleştirme için D3.js veya Graphviz.

## Dikkat!

- Tüm düzenli ifade özelliklerini (geri referans, lookahead) desteklemeye çalışma; temel özelliklerle başla.
- Açık kaynak projelerde bulduğun açıkları herkese açık yayımlamadan önce proje sahiplerine sorumlu açıklama ilkelerine uygun bildir.
- Kötü niyetli girdi testlerini zaman sınırıyla çalıştır; aksi halde bilgisayarın kilitlenebilir.

## Projeyi genişletme fikirleri

- [SecretGuard](14-secretguard.md) ile birleşerek CI'da tehlikeli ifade kontrolü
- Tehlikeli ifadeyi güvenli eşdeğerine dönüştürme önerisi
- Eğitim amaçlı etkileşimli otomat görselleştirme sitesi

## Kaynaklar

- Russ Cox — [*Regular Expression Matching Can Be Simple And Fast*](https://swtch.com/~rsc/regexp/regexp1.html)
- Davis ve ark. (2018) — *The Impact of Regular Expression Denial of Service (ReDoS) in Practice*
- [OWASP: ReDoS](https://owasp.org/www-community/attacks/Regular_expression_Denial_of_Service_-_ReDoS)
- [RE2](https://github.com/google/re2)
