# 15 · PrivacyMetrics

> **Alan:** D. Siber güvenlik ve mahremiyet · **Zorluk:** Orta–İleri · **Tür:** Deneysel araştırma + kütüphane · **Ekip:** 2 kişi · **MVP:** 6 hafta

## Basitçe anlatalım

Sınıfa bir soru soruyorsun: "Hiç kopya çektin mi?" Kimse dürüstçe cevap vermez, çünkü cevabı bilinirse başı derde girer. Şöyle bir hile var: herkes gizlice yazı tura atar. Yazı gelirse dürüst cevap verir, tura gelirse rastgele "evet" veya "hayır" der. Artık kimsenin tek başına verdiği cevaba güvenemezsin; "evet" diyen kişi belki sadece tura atmıştır. Ama **sınıfın genelinde kaç kişinin kopya çektiğini** matematikle hesaplayabilirsin!

PrivacyMetrics bu fikri web sitelerine uyguluyor: "Bu sayfayı kaç kişi ziyaret etti?", "Hangi etkinlik daha çok ilgi gördü?" gibi soruları **kimseyi tek tek takip etmeden** cevaplamak. Bedeli de var: gizlilik arttıkça sonuçlar biraz bulanıklaşıyor. Bu dengeyi ölçeceğiz.

**Tek cümleyle:** Kullanıcıları tek tek takip etmeden toplam kullanım istatistikleri üretmek ve gizlilik korumasının veri faydasına etkisini ölçmek.

## Problem

Web analitiği çoğunlukla her kullanıcıyı çerezlerle tek tek takip ederek yapılır. Bu KVKK/GDPR riskleri, çerez onayı yükü ve kullanıcı güveni sorunları doğurur. Oysa kurumların çoğunun ihtiyacı bireysel takip değil, toplam istatistiklerdir. Gizlilik koruyan yöntemler var ama bunların küçük kurumların veri ölçeğinde ne kadar kullanışlı sonuç verdiği belirsizdir.

## Ne geliştirilecek?

- Kişisel tanımlayıcı tutmayan, **toplam sayaç tabanlı** analitik toplayıcı
- **Diferansiyel gizlilik** gürültüsü ekleyen raporlama katmanı
- Rastgele cevap (randomized response) tabanlı istemci tarafı anket modülü
- Gizlilik parametresi (ε) değiştikçe sonuçların nasıl değiştiğini gösteren **etkileşimli panel**

## Araştırma sorusu

> Diferansiyel gizlilik ve rastgele cevap yöntemleri, küçük ve orta ölçekli trafik altında (günde 100–10.000 ziyaret) toplam istatistiklerin doğruluğunu ne kadar etkiler; hangi gizlilik seviyesinde sonuçlar hâlâ karar vermeye yeterlidir?

## Deney tasarımı

1. **Sentetik trafik** üret: farklı günlük ziyaret sayıları ve sayfa dağılımları.
2. **Yöntemler:** ham sayım (baseline, gizlilik yok), ε = 0,1 / 0,5 / 1 / 5 ile Laplace gürültüsü, rastgele cevap.
3. Her ayarda gerçek değerle tahmin arasındaki hatayı ve sıralama doğruluğunu ("en popüler 5 sayfa doğru mu?") ölç.
4. Her ayarı 100 kez tekrar edip hata dağılımını raporla.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Göreli hata | Tahmin gerçek değerden yüzde kaç sapıyor? | \|tahmin − gerçek\| / gerçek |
| Sıralama doğruluğu | "En popüler" listesi doğru mu? | Kendall tau / top-k örtüşmesi |
| Gizlilik bütçesi | Ne kadar gizlilik "harcandı"? | ε |
| Karar eşiği | Hangi ε'da sonuçlar hâlâ kullanışlı? | Önceden tanımlı hata sınırı |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Toplam istatistik** (aggregate) | Kişiler değil, grubun geneli hakkındaki sayılar |
| **Diferansiyel gizlilik** | Sonuçlara hesaplanmış miktarda rastgele gürültü ekleyerek tek bir kişinin verisinin sonucu belirgin şekilde değiştirmemesini sağlayan matematiksel yöntem |
| **ε (epsilon)** | Gizlilik seviyesini ayarlayan sayı; küçükse gizlilik yüksek ama sonuç daha gürültülü |
| **Gürültü** | Gerçek değere bilerek eklenen rastgele sapma |
| **Laplace mekanizması** | Diferansiyel gizlilikte gürültü eklemek için kullanılan yaygın yöntem |
| **Rastgele cevap** (randomized response) | Yazı-tura hilesi; bireysel cevap gizli kalır, toplam tahmin edilebilir |
| **Gizlilik–fayda dengesi** | Gizlilik arttıkça verinin işe yararlığının azalması |
| **KVKK** | Türkiye'nin Kişisel Verilerin Korunması Kanunu |
| **Yeniden tanımlama** (re-identification) | "Anonim" veriden kişinin kim olduğunun bulunması |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Diferansiyel gizlilik temellerini oku, KVKK açısından ihtiyacı yaz |
| 1–3 | Keşif (K1) | Sentetik trafik üretici, ham sayım baseline'ı |
| 4–8 | Geliştirme (K2) | **MVP:** gürültülü sayaçlar + ilk hata ölçümleri; ara değerlendirme |
| 9–11 | Tamamlama | Rastgele cevap modülü, tüm deneyler |
| 12–13 | Tamamlama | Etkileşimli panel, belgeler |
| 14 | Sonuç (K3) | Teknik rapor: "küçük bir kulüp için hangi ε mantıklı?" |

## Başlamadan önce

**Bilmen iyi olur:** Python, temel olasılık ve istatistik.
**Öğreneceklerin:** Mahremiyet mühendisliği, diferansiyel gizlilik, simülasyon, veri görselleştirme.
**Önerilen teknolojiler:** Python, NumPy, OpenDP veya Google differential-privacy kütüphanesi, Streamlit veya React (panel).

## Dikkat!

- Diferansiyel gizliliği **kendin sıfırdan doğru uygulamak zordur**; deneyler için güvenilir bir kütüphane kullan, kendi uygulamanı onunla karşılaştır.
- Gizlilik bütçesi her sorguda harcanır; aynı veriye sınırsız sorgu yapılmasına izin verme.
- **Gerçek kullanıcı verisi kullanma**; sentetik veriyle çalış.

## Projeyi genişletme fikirleri

- TechOps sitesi için çerezsiz, gizlilik dostu ziyaret sayacı
- Etkinlik geri bildirim anketlerinde rastgele cevap modülü

## Kaynaklar

- [OpenDP](https://opendp.org)
- [Google differential-privacy](https://github.com/google/differential-privacy)
- Dwork & Roth — *The Algorithmic Foundations of Differential Privacy* (ücretsiz kitap)
- [KVKK](https://www.kvkk.gov.tr)
