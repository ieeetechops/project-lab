# 44 · SignSpell

> **Alan:** K. Bilgisayarlı görü · **Zorluk:** Orta–İleri · **Tür:** Deneysel araştırma + prototip · **Ekip:** 2–3 kişi · **MVP:** 5–6 hafta

## Basitçe anlatalım

İşitme engelli bireyler Türk İşaret Dili (TİD) ile iletişim kurar. Bir ismi veya bilinmeyen bir kelimeyi anlatmak için de her harfi elle tek tek gösterirler; buna **parmak alfabesi** denir. İşaret dili bilmeyen biri için bu harfleri okumak zordur.

Bir kamera, eli izleyip hangi harfin gösterildiğini anlayabilir mi? Bunun iki yolu var: Birincisi görüntünün tamamına bakıp "bu A harfi" demek. İkincisi önce elin iskeletini bulmak (parmak eklemlerinin konumları) ve sadece bu noktalara bakarak karar vermek. İkinci yol daha hafif ve kişinin yüzünü veya ortamı kullanmadığı için daha mahremiyet dostu. SignSpell, **TİD parmak alfabesini tanıyan** bir prototip geliştirir ve bu iki yaklaşımı karşılaştırır.

**Tek cümleyle:** Türk İşaret Dili parmak alfabesini kamera görüntüsünden tanıyan bir prototip geliştiren ve el iskeleti tabanlı yöntemlerle doğrudan görüntü tabanlı yöntemleri karşılaştıran bir proje.

## Problem

İşaret dili tanıma çalışmalarının büyük kısmı Amerikan İşaret Dili üzerinedir; Türk İşaret Dili için açık veri ve araç sayısı sınırlıdır. Görüntü tabanlı modeller arka plana, ışığa ve kişinin görünümüne aşırı uyum sağlayabilir. El iskeleti tabanlı yöntemler bu sorunları azaltabilir ama benzer harfleri ayırt etmekte zorlanabilir.

## Ne geliştirilecek?

- TİD parmak alfabesi için gönüllülerle toplanmış, onaylı **veri kümesi**
- El iskeleti noktalarını çıkarıp harf tanıyan model
- Doğrudan görüntüden harf tanıyan model (karşılaştırma için)
- Kameradan canlı harf tanıyıp kelime oluşturan **web demo**
- Karışan harf çiftlerini gösteren hata analizi

## Araştırma sorusu

> Türk İşaret Dili parmak alfabesi tanımada el iskeleti noktalarına dayalı modeller ile ham görüntüye dayalı modeller; eğitimde görülmemiş kişilerde ve farklı ortamlarda tanıma doğruluğu ve çalışma hızı açısından nasıl karşılaştırılır?

## Deney tasarımı

1. **Veri:** Mümkünse işaret dili bilen gönüllülerle (ör. üniversitenin engelsiz üniversite birimi veya ilgili derneklerle iş birliği) her harf için çok sayıda örnek. Bilgilendirilmiş onam alınır; isteğe bağlı olarak sadece el iskeleti noktaları saklanır.
2. **Yöntemler:**
   - (A) El iskeleti noktaları + basit sınıflandırıcı (k-en yakın komşu) — baseline
   - (B) El iskeleti + küçük sinir ağı (hareketli harfler için zaman serisi modeli)
   - (C) Ham görüntü + önceden eğitilmiş CNN
3. **Değerlendirme:** Kişi bazında ayrım yapılır; test kişileri eğitimde hiç kullanılmaz. Farklı arka plan ve ışık koşullarında ayrı test.
4. Harf doğruluğu, karışıklık matrisi ve kare başına işlem süresi ölçülür.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Harf doğruluğu | Harflerin yüzde kaçı doğru tanındı? | Görülmemiş kişilerle test |
| Ortam dayanıklılığı | Farklı arka plan ve ışıkta doğruluk ne kadar düşüyor? | Ayrı test koşulları |
| Karışan harfler | Hangi harf çiftleri sıklıkla karıştırılıyor? | Karışıklık matrisi |
| Hız | Saniyede kaç kare işlenebiliyor? | FPS |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Türk İşaret Dili (TİD)** | Türkiye'deki işitme engelli bireylerin kullandığı, kendine özgü dilbilgisi olan görsel dil |
| **Parmak alfabesi** | Harflerin el şekilleriyle tek tek gösterilmesi |
| **El iskeleti** (hand landmarks) | Elin bileği ve parmak eklemlerini temsil eden 21 noktanın konumu |
| **MediaPipe** | Görüntüden el, yüz ve vücut noktalarını çıkaran hazır kütüphane |
| **Karışıklık matrisi** | Hangi sınıfın hangisiyle ne sıklıkla karıştırıldığını gösteren tablo |
| **Kişi bazlı ayrım** | Test kişilerinin eğitimde hiç kullanılmaması; böylece model yeni kişilerde sınanır |
| **k-en yakın komşu** | Yeni örneği, ona en çok benzeyen eğitim örneklerine bakarak sınıflandıran basit yöntem |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, iş birliği yapılacak kişi/kurumlarla iletişime geç |
| 1–3 | Keşif (K1) | Veri toplama protokolü ve onam metni, ilk veriler, iskelet tabanlı baseline |
| 4–6 | Geliştirme | **MVP:** statik harfleri canlı tanıyan web demo |
| 7–8 | Geliştirme (K2) | Hareketli harfler, görüntü tabanlı model; ara değerlendirme |
| 9–11 | Tamamlama | Görülmemiş kişilerle ve farklı ortamlarda karşılaştırma |
| 12–13 | Tamamlama | Hata analizi, kullanıcı geri bildirimi, belgeler |
| 14 | Sonuç (K3) | Teknik rapor ve demo |

## Başlamadan önce

**Bilmen iyi olur:** Python, temel makine öğrenmesi, JavaScript (web demo için) faydalı.
**Öğreneceklerin:** Bilgisayarlı görü, zaman serisi sınıflandırma, veri toplama etiği, erişilebilirlik odaklı tasarım.
**Önerilen teknolojiler:** MediaPipe, scikit-learn, PyTorch, TensorFlow.js veya ONNX Runtime Web.

## Dikkat!

- Bu proje bir topluluğa hizmet etmeyi amaçlar; işaret dili kullanan kişilerin görüşlerini en baştan sürece dahil et.
- Parmak alfabesi TİD'in yalnızca küçük bir parçasıdır; projenin "işaret dilini çeviren" bir sistem olmadığını açıkça belirt.
- Görüntü verisi kişiyi tanımlayabilir; mümkünse yalnızca iskelet noktalarını sakla.

## Projeyi genişletme fikirleri

- Sık kullanılan kelime işaretlerinin tanınması
- İşaret dili öğrenenler için geri bildirim veren eğitim uygulaması
- Veri kümesinin açık olarak yayımlanması (onam kapsamı izin veriyorsa)

## Kaynaklar

- [MediaPipe Hand Landmarker](https://ai.google.dev/edge/mediapipe/solutions/vision/hand_landmarker)
- [Türk İşaret Dili Sözlüğü](https://tidsozluk.aile.gov.tr/)
- Sincan & Keles (2020) — *AUTSL: A Large Scale Multi-modal Turkish Sign Language Dataset and Baseline Methods*
- [scikit-learn](https://scikit-learn.org/)
