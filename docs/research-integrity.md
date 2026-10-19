# Araştırma Dürüstlüğü

Araştırma ve Machine Learning projeleri için zorunlu kurallar. Amaç, sonuçların güvenilir, tekrarlanabilir ve yanıltıcı olmamasını sağlamaktır.

## Sonuç raporlama

- **Baseline zorunludur.** En az bir basit yöntem (çoğunluk sınıfı, kural tabanlı çözüm, klasik model veya mevcut açık kaynak çözüm) ile karşılaştırma yapılır.
- **Doğru metrik seçilir.** Dengesiz veri kümesinde yalnızca accuracy raporlanmaz; precision/recall/F1, AUC veya probleme uygun metrik kullanılır ve seçim gerekçelendirilir.
- **Varyans raporlanır.** Sonuçlar mümkünse birden fazla tohum (seed) veya çapraz doğrulama ile ortalama ± standart sapma olarak verilir.
- **Olumsuz sonuçlar gizlenmez.** Denenen ama işe yaramayan yaklaşımlar deney günlüğünde ve final raporunda yer alır.
- **Sınırlılıklar yazılır.** Sonucun hangi veri dağılımında, hangi koşullarda geçerli olduğu belirtilir.

## Veri

- Eğitim, doğrulama ve test kümeleri **deney başlamadan** ayrılır; test kümesi yalnızca final ölçüm için kullanılır.
- **Veri sızıntısı** (leakage) kontrol edilir: aynı kişi/belge/zaman aralığının farklı kümelere düşmesi, gelecekteki bilginin geçmişe sızması vb.
- Her veri kümesinin kaynağı, lisansı ve toplanma yöntemi veri kartında belgelenir.
- Kişisel veri içeren kümeler depoya **konmaz**; anonimleştirme yöntemi belgelenir ve Program Lead onayı alınır.

## Tekrarlanabilirlik

- Kod, yapılandırma ve rastgelelik tohumları sürüm kontrolündedir.
- Ortam (Python sürümü, kütüphane sürümleri, donanım) belgelenir.
- Final sonuçları tek bir komut veya not defteriyle yeniden üretilebilir.
- Büyük model/veri dosyaları için Git LFS, Hugging Face Hub veya kurumsal Drive kullanılır; bağlantılar README'de verilir.

## Etik

- Projenin olası zararları (yanlış sınıflandırmanın etkisi, önyargı, gözetim riski) proje sözleşmesinde değerlendirilir.
- İnsan katılımcı içeren çalışmalarda (anket, kullanıcı testi) bilgilendirilmiş onam alınır; gerekiyorsa akademik danışman aracılığıyla etik kurul süreci işletilir.
- Başkalarının kodu, verisi ve fikirleri her zaman atıfla kullanılır. Üretken yapay zekâ araçlarıyla üretilen kod veya metin raporda belirtilir.

## Yayın

Sonuçlar konferans, dergi veya yarışmaya gönderilecekse önce Kurul'a ve varsa akademik danışmana bilgi verilir. Yazarlık sıralaması katkıya göre belirlenir (bkz. [lisans ve sahiplik](ip-and-licensing.md)).
