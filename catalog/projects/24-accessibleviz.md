# 24 · AccessibleViz

> **Alan:** F. HCI ve erişilebilirlik · **Zorluk:** Orta · **Tür:** Kullanıcı araştırması + ürün (grafik kütüphanesi) · **Ekip:** 2 kişi · **MVP:** 4–6 hafta · Kısa liste adayı

## Basitçe anlatalım

Bir trafik lambasının sadece renklerle çalıştığını düşün; üstte, ortada ve altta değil, hep aynı yerde sadece renk değiştiriyor. Kırmızı ile yeşili ayırt edemeyen biri ne zaman geçeceğini bilemez. Gerçek trafik lambaları bu yüzden renk + konum kullanır: kırmızı hep üstte, yeşil hep altta.

Grafikler de çoğu zaman bilgiyi sadece renkle anlatır: "kırmızı çizgi bizim şehir, yeşil çizgi komşu şehir". Erkeklerin yaklaşık 12'de biri renk körlüğü yaşar ve bu grafikleri doğru okuyamaz. AccessibleViz, **herkesin doğru okuyabildiği grafikler** üretmeyi araştırır: renk yerine ya da renkle birlikte desen, doğrudan etiket veya şekil kullanırsak insanlar grafiği daha doğru yorumlar mı?

**Tek cümleyle:** Renk körlüğü ve farklı görsel ihtiyaçlar için okunabilir grafikler üreten ve renk, etiket ve desen kullanımının yorumlama doğruluğuna etkisini gerçek kullanıcılarla ölçen bir araştırma projesi.

## Problem

Grafikler kararların verildiği yerlerdir: raporlar, sunumlar, panolar. Ancak çoğu grafik kütüphanesinin varsayılan renkleri renk körü kullanıcılar için ayırt edilemez, açıklama kutusu (lejant) grafikten uzak durur, ekran okuyucular için hiçbir metin alternatifi yoktur. "Erişilebilir grafik" tavsiyeleri vardır ama hangi önlemin ne kadar fark yarattığı az ölçülmüştür.

## Ne geliştirilecek?

- Aynı veriyi farklı erişilebilirlik stratejileriyle çizebilen **grafik kütüphanesi / sarmalayıcı** (çizgi, sütun, pasta)
- Renk körlüğü türlerini taklit ederek grafiği önizleyen **simülatör**
- Grafiğin metin özetini otomatik üreten modül (ekran okuyucular için)
- Katılımcılara grafik gösterip soru soran **deney platformu**

## Araştırma sorusu

> Renk paletinin seçimi, doğrudan etiketleme ve desen/şekil kodlaması, renk görme farklılığı olan ve olmayan kullanıcıların grafikleri doğru yorumlama oranını ve süresini nasıl etkiler?

## Deney tasarımı

1. **Grafik sürümleri:** Aynı veri için 4 sürüm:
   - (A) Varsayılan kütüphane renkleri + ayrı lejant — baseline
   - (B) Renk körlüğü dostu palet + ayrı lejant
   - (C) Dostu palet + doğrudan etiket (çizginin yanında adı yazar)
   - (D) Dostu palet + desen/şekil kodlaması
2. **Katılımcılar:** 30–50 gönüllü. Kısa bir Ishihara benzeri tarama ile renk görme durumu (isteğe bağlı ve anonim) sorulur. Renk körü katılımcılara ulaşmak için duyuru yap; bulunamazsa simülasyonla ek analiz yap.
3. **Görevler:** "En yüksek değer hangi şehirde?", "2024'te hangi seri düştü?" gibi doğru cevabı olan sorular.
4. Doğruluk, cevap süresi ve güven düzeyi kaydedilir.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Yorumlama doğruluğu | Sorulara doğru cevap oranı | Doğru cevapla karşılaştırma |
| Cevap süresi | Soruyu cevaplamak ne kadar sürdü? | Otomatik kayıt |
| Güven | Katılımcı cevabından ne kadar emin? | 1–5 ölçeği |
| Kontrast uyumu | Renkler WCAG kontrast kurallarını sağlıyor mu? | Otomatik hesap |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Renk körlüğü** (renk görme eksikliği) | Bazı renkleri ayırt edememe; en yaygını kırmızı-yeşil karışıklığı |
| **Protanopi / deuteranopi / tritanopi** | Kırmızıyı / yeşili / maviyi algılamada güçlük çekilen türler |
| **Lejant** | Grafikte hangi rengin neyi temsil ettiğini gösteren açıklama kutusu |
| **Doğrudan etiketleme** | Seri adını lejant yerine doğrudan çizginin veya sütunun yanına yazmak |
| **Desen kodlaması** | Renklere ek olarak çizgili, noktalı gibi dokular veya farklı şekiller kullanmak |
| **Kontrast oranı** | İki renk arasındaki açıklık farkı; WCAG belirli bir alt sınır ister |
| **Metin alternatifi** | Görseli göremeyenler için içeriği anlatan yazı |
| **Simülasyon** | Bir renk körünün ekranı nasıl gördüğünü taklit eden dönüşüm |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, erişilebilir görselleştirme literatürünü oku |
| 1–3 | Keşif (K1) | Mevcut kütüphanelerin varsayılanlarını incele, renk körlüğü simülatörü, 4 grafik sürümü |
| 4–6 | Geliştirme | **MVP:** 4 stratejiyle çizen kütüphane + deney platformu |
| 7–8 | Geliştirme (K2) | Pilot test, metin özeti modülü; ara değerlendirme |
| 9–11 | Tamamlama | Ana kullanıcı deneyi |
| 12–13 | Tamamlama | Analiz, kütüphanenin yayımlanması, tasarım kılavuzu |
| 14 | Sonuç (K3) | Teknik rapor ve "erişilebilir grafik" kontrol listesi |

## Başlamadan önce

**Bilmen iyi olur:** JavaScript, temel grafik çizme (herhangi bir kütüphaneyle).
**Öğreneceklerin:** Veri görselleştirme, renk bilimi, erişilebilirlik, kullanıcı deneyi tasarımı, istatistik.
**Önerilen teknolojiler:** D3.js veya Observable Plot, TypeScript, React, Python veya R (analiz).

## Dikkat!

- Renk körlüğü tıbbi bir bilgidir; zorunlu sorma, anonim tut ve onam al.
- Renk körü katılımcı bulmak zor olabilir. Bu bir sınırlılık; simülasyonun gerçek deneyimin yerini tutmadığını rapora yaz.
- Farklı ekranlarda renkler farklı görünür. Deneyi mümkünse aynı cihazlarda yap ya da cihaz bilgisini kaydet.

## Projeyi genişletme fikirleri

- IEEE ve TechOps raporlarında kullanılacak erişilebilir grafik şablonları
- Ekran okuyucu kullanıcılarla grafiğin sesli/sonifikasyonlu sunumu
- Mevcut bir grafiği analiz edip "bu grafik renk körleri için okunamaz" uyarısı veren araç

## Kaynaklar

- [Okabe & Ito renk paleti](https://jfly.uni-koeln.de/color/) — renk körlüğü dostu palet
- [Chartability](https://chartability.fizz.studio/) — erişilebilir veri görselleştirme ölçütleri
- [WCAG 2.2 — 1.4.1 Rengin kullanımı](https://www.w3.org/WAI/WCAG22/Understanding/use-of-color)
- [Coblis](https://www.color-blindness.com/coblis-color-blindness-simulator/) — renk körlüğü simülatörü
