# Değerlendirme Ölçütleri

Bu ölçütler hem **öneri kabulünde** (K0) hem **final değerlendirmede** (K3) kullanılır. Amaç, tanımlı bir problemde ölçülebilir ilerleme sağlayan projeleri seçmek ve desteklemektir.

> **Metrik değerlerinin yorumlanması:** Bir metrik değeri; hangi problem, hangi veri ve hangi başlangıç ölçümüyle (baseline) karşılaştırıldığı belirtilmeden sonuç olarak değerlendirilmez. Örneğin basit bir kural tabanlı çözüm %93 doğruluk sağlıyorsa, %95 doğruluk sağlayan bir modelin katkısı bu fark üzerinden değerlendirilir.

## Öneri değerlendirmesi (K0)

Her Kurul üyesi her ölçütü **1–5** arasında bağımsız puanlar.

| # | Ölçüt | Ağırlık | Soru |
| --- | --- | --- | --- |
| 1 | **Problemin gerçekliği** | ×3 | Kimin, hangi durumda, ne sıklıkla yaşadığı bir problem? Kanıtı var mı? |
| 2 | **Ölçülebilirlik** | ×3 | Başarı hangi metrikle, hangi baseline'a karşı, nasıl ölçülecek? |
| 3 | **Özgünlük / fark** | ×2 | Mevcut çözümler incelenmiş mi? Bu proje onlardan nasıl ayrılıyor veya neden yeniden yapılıyor? |
| 4 | **Fizibilite** | ×2 | Veri, erişim, beceri ve süre dönem içinde yeterli mi? |
| 5 | **Etki** | ×1 | Sonuç IEEE'ye, üniversiteye veya mühendislik topluluğuna nasıl fayda sağlar? |
| 6 | **Sürdürülebilirlik ve öğrenme** | ×1 | Devredilebilir mi? Ekip üyeleri yeni ve anlamlı bir şey öğrenecek mi? |

### Puan rehberi

| Puan | Anlamı |
| --- | --- |
| 1 | Tanımlanmamış veya ikna edici değil |
| 2 | Var ama belirsiz; büyük varsayımlara dayanıyor |
| 3 | Yeterli; makul kanıt ve plan var |
| 4 | Güçlü; somut kanıt, net plan |
| 5 | Örnek niteliğinde; diğer ekipler için referans olabilir |

### Karar kuralı

- **Kabul:** Ağırlıklı ortalama ≥ **3,5** **ve** ölçüt 1 ile 2'de hiçbir üyenin ortalaması 3'ün altında değil.
- **Koşullu kabul:** Ağırlıklı ortalama 3,0–3,5 veya tek bir ölçütte giderilebilir eksik var.
- **Revizyon:** Ağırlıklı ortalama < 3,0 ya da problem/ölçülebilirlik 3'ün altında.
- **Ret:** Etik, güvenlik veya hukuki engel; ya da programın kapsamı dışında.

Ağırlıklı ortalama = Σ(puan × ağırlık) / 12

## Ret için otomatik sebepler

- Kişisel veri, açık rıza veya kurum izni olmadan işlenecekse
- Problem, yalnızca bir teknolojiyi denemek için uydurulmuşsa ("blockchain ile bir şey yapalım")
- Başarı ölçütü tanımlanamıyorsa
- Lisansı veya kullanım koşulları çalışmaya izin vermeyen veri/kod gerekiyorsa

## Final değerlendirme (K3)

Final'de aynı ölçütler **sonuç üzerinden** tekrar puanlanır ve şu sorular yanıtlanır:

| Alan | Soru |
| --- | --- |
| Sonuç vs. baseline | Hedef metrikte baseline'a göre ne kadar değişim oldu? İstatistiksel olarak anlamlı mı? |
| Hata analizi | Sistem nerede başarısız oluyor? Neden? |
| Sınırlılıklar | Sonuç hangi koşullarda geçerli değil? |
| Tekrarlanabilirlik | Başka biri depodan aynı sonucu üretebiliyor mu? |
| Kullanım | Gerçek kullanıcı/paydaş denedi mi? Geri bildirim ne? |
| Mühendislik kalitesi | Test, CI, belge ve kod okunabilirliği yeterli mi? |
| Devir | Sonraki ekip devralabilir mi? |

Hedef metriğe ulaşılamaması tek başına düşük puan sebebi değildir. Nedeni dürüstçe analiz edilmiş ve belgelenmiş "olumsuz sonuç" iyi bir mühendislik çıktısıdır.
