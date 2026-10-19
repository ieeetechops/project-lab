# 41 · DocScan

> **Alan:** K. Bilgisayarlı görü · **Zorluk:** Başlangıç–Orta · **Tür:** Ürün + deneysel araştırma · **Ekip:** 2 kişi · **MVP:** 4 hafta

## Basitçe anlatalım

Bir belgeyi telefonla fotoğrafladığında genellikle eğri çıkar: kâğıt yamuk görünür, arkasında masa vardır, bir köşesi gölgede kalır. Tarayıcı uygulamaları bu fotoğrafı alıp sanki gerçek bir tarayıcıdan çıkmış gibi düz, temiz ve okunaklı hale getirir.

Bunun için bilgisayarın önce fotoğrafta **kâğıdın nerede olduğunu** bulması, sonra köşelerinden tutup **düzeltmesi**, en son da gölgeleri temizlemesi gerekir. DocScan bu işi yapan bir araç geliştirir ve şu soruyu araştırır: kâğıdın kenarlarını bulmak için klasik görüntü işleme yöntemleri mi yeterli, yoksa derin öğrenme gerçekten fark yaratıyor mu? Hangi durumlarda?

**Tek cümleyle:** Telefon fotoğrafından belgeyi bulup perspektif düzeltmesi ve görüntü iyileştirmesi yapan bir tarayıcı geliştiren ve klasik görüntü işleme ile derin öğrenme tabanlı belge algılamayı karşılaştıran bir proje.

## Problem

Öğrenciler ve kurumlar belgeleri sıklıkla telefonla fotoğraflar. Zor koşullarda (karmaşık arka plan, düşük ışık, kıvrılmış kâğıt, beyaz masa üzerinde beyaz kâğıt) mevcut yöntemler belgeyi bulamaz veya yanlış kırpar. Klasik yöntemler hızlıdır ama kırılgan; derin öğrenme daha dayanıklıdır ama ağırdır. Hangisinin ne zaman tercih edilmesi gerektiği net değildir.

## Ne geliştirilecek?

- Fotoğraftaki belgenin dört köşesini bulan **belge algılama modülü** (klasik ve derin öğrenme tabanlı iki sürüm)
- Belgeyi düz bir sayfaya dönüştüren **perspektif düzeltme**
- Gölge giderme, kontrast iyileştirme ve siyah-beyaz tarama modu
- Tarayıcıda veya mobilde çalışan basit arayüz
- Zorluk düzeyine göre etiketlenmiş **test fotoğrafı kümesi**

## Araştırma sorusu

> Kenar ve kontur tabanlı klasik belge algılama ile derin öğrenme tabanlı köşe/bölütleme yöntemleri; farklı arka plan, ışık ve kâğıt durumu koşullarında köşe bulma doğruluğu ve işlem süresi açısından nasıl karşılaştırılır?

## Deney tasarımı

1. **Veri kümesi:** Ekip tarafından çekilmiş 300–500 belge fotoğrafı; her biri zorluk etiketleriyle (sade/karmaşık arka plan, iyi/kötü ışık, düz/kıvrık kâğıt, düşük kontrast). Köşeler elle işaretlenir. Kişisel bilgi içermeyen belgeler kullanılır.
2. **Yöntemler:**
   - (A) Canny kenar bulma + kontur arama — baseline
   - (B) Klasik yöntem + uyarlanabilir eşikleme ve ön işleme iyileştirmeleri
   - (C) Hafif bir bölütleme modeli (ör. MobileNet tabanlı) ile belge maskesi
3. Köşe hatası, başarı oranı ve işlem süresi ölçülür; sonuçlar zorluk koşullarına göre ayrılır.
4. İsteğe bağlı: düzeltilmiş belgelerde OCR doğruluğunu karşılaştır.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Köşe hatası | Bulunan köşeler gerçek köşelerden kaç piksel uzak? | Elle işaretlenen köşelerle karşılaştırma |
| Başarı oranı | Belge kabul edilebilir doğrulukla bulundu mu? | IoU eşiği |
| İşlem süresi | Bir fotoğraf ne kadar sürede işlendi? | Milisaniye |
| OCR doğruluğu | Düzeltilmiş belgedeki metin ne kadar doğru okunuyor? | Karakter hata oranı |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Bilgisayarlı görü** | Bilgisayarların görüntülerden anlam çıkarmasını sağlayan alan |
| **Kenar bulma** (Canny) | Görüntüde parlaklığın aniden değiştiği yerleri bulan yöntem |
| **Kontur** | Bir nesnenin dış hattını oluşturan nokta dizisi |
| **Perspektif dönüşümü** | Yamuk görünen bir dikdörtgeni düz bir dikdörtgene çeviren matematiksel işlem |
| **Bölütleme** (segmentation) | Görüntüdeki her pikselin hangi nesneye ait olduğunu belirleme |
| **IoU** | Tahmin edilen alan ile gerçek alanın ne kadar örtüştüğü (0–1) |
| **OCR** | Görüntüdeki yazıyı metne çeviren teknoloji |
| **Eşikleme** | Görüntüyü belirli bir parlaklık değerine göre siyah ve beyaza ayırma |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, fotoğraf çekim protokolünü yaz |
| 1–3 | Keşif (K1) | Fotoğraf kümesi ve köşe etiketleri, klasik baseline |
| 4 | Geliştirme | **MVP:** fotoğraftan belgeyi bulup düzelten araç |
| 5–8 | Geliştirme (K2) | İyileştirilmiş klasik yöntem, derin öğrenme modeli; ara değerlendirme |
| 9–11 | Tamamlama | Karşılaştırma deneyi, OCR testi |
| 12–13 | Tamamlama | Arayüz, belgeler, veri kümesinin yayımlanması |
| 14 | Sonuç (K3) | Teknik rapor ve demo |

## Başlamadan önce

**Bilmen iyi olur:** Python, temel matris kavramı.
**Öğreneceklerin:** Görüntü işleme, bilgisayarlı görü, derin öğrenme ile bölütleme, değerlendirme metrikleri.
**Önerilen teknolojiler:** Python, OpenCV, PyTorch, Tesseract (OCR), isteğe bağlı OpenCV.js veya ONNX Runtime Web (tarayıcı sürümü).

## Dikkat!

- Kimlik, transkript gibi kişisel bilgi içeren belgeleri veri kümesine koyma; örnek belgeler kullan.
- Fotoğrafları aynı telefonla çekersen sonuçlar genellenmeyebilir; farklı cihazlar kullan.
- Derin öğrenme modelini eğitirken test fotoğraflarını eğitimde kullanma.

## Projeyi genişletme fikirleri

- Çok sayfalı belgeleri tek PDF'e dönüştürme
- Kıvrık sayfaları (kitap) düzeltme
- Kolun arşiv belgelerini dijitalleştirme sürecinde kullanılması

## Kaynaklar

- [OpenCV belgeleri](https://docs.opencv.org/)
- Szeliski — [*Computer Vision: Algorithms and Applications*](https://szeliski.org/Book/) (ücretsiz)
- [Tesseract OCR](https://github.com/tesseract-ocr/tesseract)
- [SmartDoc 2015 Challenge](https://smartdoc.univ-lr.fr/) — belge yakalama veri kümesi
