# 18 · SourceCheck

> **Alan:** E. Veri mühendisliği ve yapay zekâ · **Zorluk:** İleri · **Tür:** Deneysel araştırma + prototip · **Ekip:** 2–3 kişi · **MVP:** 5–6 hafta

## Basitçe anlatalım

Bir arkadaşına ödev için üç kitap verdin ve "bunlara bakarak bir özet yaz" dedin. Arkadaşın güzel bir özet getirdi ama içinde bir cümle var ki o üç kitabın hiçbirinde geçmiyor. Arkadaşın onu ya yanlış hatırladı ya da uydurdu. Özet o kadar akıcı ki fark etmesi çok zor.

Yapay zekâ sohbet sistemleri de bazen böyle davranır: sana kaynak verildiği halde kaynakta olmayan bilgileri, çok emin bir dille yazabilir. SourceCheck, bu cevapları **cümle cümle kontrol eden bir öğretmen** gibi çalışır: "Bu cümle kaynakta var mı? Kaynak gerçekten bunu mu söylüyor?" Amacımız, desteklenmeyen iddiaları ne kadar iyi yakalayabildiğimizi ölçmek.

**Tek cümleyle:** Kaynaklardan cevap üreten yapay zekâ sistemlerinin iddialarını verilen kaynaklarla karşılaştıran ve desteklenmeyen iddiaları yakalama başarısını ölçen bir doğrulama prototipi.

## Problem

RAG (kaynaktan cevap üretme) sistemleri giderek yaygınlaşıyor: şirket içi asistanlar, ders asistanları, yönetmelik botları. Bu sistemler kaynak gösterse bile, cevabın her cümlesi o kaynakla desteklenmeyebilir. Kullanıcı kaynağı açıp kontrol etmez. Desteklenmeyen iddiaları otomatik yakalayabilmek güvenilirlik için kritik.

## Ne geliştirilecek?

- Bir cevabı **tek tek iddialara (cümlelere) bölen** modül
- Her iddiayı kaynak metinle karşılaştırıp **"destekleniyor / desteklenmiyor / çelişiyor"** etiketi veren doğrulayıcı
- Cevabı renklendirerek gösteren arayüz: yeşil = kaynakta var, kırmızı = kaynakta yok
- Elle etiketlenmiş **Türkçe değerlendirme veri kümesi** (ör. IEEE yönetmelikleri veya üniversite yönergeleri üzerinde)

## Araştırma sorusu

> Desteklenmeyen iddiaları yakalamada basit metin benzerliği, doğal dil çıkarımı (NLI) modelleri ve büyük dil modeliyle değerlendirme (LLM-as-judge) yöntemleri hangi doğrulukla ve hangi maliyetle çalışır?

## Deney tasarımı

1. **Veri kümesi:** 20–30 belge seç. Bunlar hakkında sorular sor, bir RAG sistemine cevaplat. Cevaplardaki her iddiayı ekipçe elle etiketle (destekleniyor / desteklenmiyor). İki kişi bağımsız etiketlesin, uyuşmazlıkları tartışın.
2. **Yöntemler:**
   - (A) Kelime/gömme benzerliği: iddiaya en benzer kaynak cümle yeterince benzer mi? — baseline
   - (B) NLI modeli: "kaynak cümle bu iddiayı gerektiriyor mu?"
   - (C) Bir dil modeline kaynak + iddia verip karar istemek
3. Her yöntem için precision, recall ve iddia başına maliyet/süre ölç.
4. Hataları kategorilere ayır: sayı hataları, olumsuzluk (değil/yok) hataları, kaynakta hiç olmayan bilgi.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Recall (desteklenmeyen) | Desteklenmeyen iddiaların kaçını yakaladı? | Elle etiketle karşılaştırma |
| Precision | "Desteklenmiyor" dediklerinin kaçı gerçekten öyle? | Elle etiketle karşılaştırma |
| Etiketleyici uyumu | İki insan etiketleyici ne kadar anlaşıyor? | Cohen's kappa |
| Maliyet ve süre | İddia başına harcanan süre / API ücreti | Ölçüm |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **RAG** (Retrieval-Augmented Generation) | Önce ilgili belgeleri bulup sonra cevabı onlara dayanarak üreten yapay zekâ sistemi |
| **Halüsinasyon** | Yapay zekânın gerçekte olmayan bir bilgiyi emin bir dille üretmesi |
| **İddia** (claim) | Doğru ya da yanlış olabilen tek bir bilgi parçası |
| **Gömme** (embedding) | Metni, anlamı benzer metinlerin yakın düştüğü bir sayı listesine çevirmek |
| **NLI** (doğal dil çıkarımı) | "A cümlesi doğruysa B cümlesi de doğru mu?" sorusunu cevaplayan model türü |
| **LLM-as-judge** | Bir dil modelini başka bir çıktıyı değerlendirmek için kullanmak |
| **Cohen's kappa** | İki kişinin etiketlerde şans eseri olmayan ne kadar uyum gösterdiğini ölçen sayı |
| **Groundedness** (kaynağa dayanma) | Cevabın verilen kaynaklarla ne kadar desteklendiği |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, belge kümesini seç, literatür taraması |
| 1–3 | Keşif (K1) | Basit RAG sistemi kur, cevap üret, etiketleme kılavuzunu yaz, ilk 100 iddiayı etiketle |
| 4–6 | Geliştirme | **MVP:** iddialara bölme + benzerlik baseline'ı + renkli arayüz |
| 7–8 | Geliştirme (K2) | NLI ve LLM-as-judge yöntemleri; ara değerlendirme |
| 9–11 | Tamamlama | Tam veri kümesi (300+ iddia), karşılaştırma deneyi, hata analizi |
| 12–13 | Tamamlama | Arayüz, veri kümesinin yayımlanması, belgeler |
| 14 | Sonuç (K3) | Teknik rapor ve Türkçe değerlendirme veri kümesi |

## Başlamadan önce

**Bilmen iyi olur:** Python, temel makine öğrenmesi kavramları, bir API kullanmış olmak.
**Öğreneceklerin:** Doğal dil işleme, RAG mimarisi, veri etiketleme, değerlendirme metodolojisi.
**Önerilen teknolojiler:** Python, sentence-transformers, Hugging Face Transformers (çok dilli NLI modelleri), bir LLM API'si, Streamlit.

## Dikkat!

- Bu projenin en zor ve en değerli kısmı **etiketleme**. Etiketleme kılavuzunu erken yaz; "kısmen destekleniyor" gibi durumlar için kural koy.
- LLM-as-judge kullanırken değerlendiren model de halüsinasyon görebilir. Onu da elle etiketlerle ölç, kör güvenme.
- Türkçe NLI modelleri İngilizce kadar güçlü değil; bu bir sınırlılık ve aynı zamanda bir bulgu.
- API maliyetlerini baştan hesapla ve bütçe koy.

## Projeyi genişletme fikirleri

- Cevap üretilirken desteklenmeyen cümleyi anında düzelten sistem
- IEEE Hub'daki yardım asistanına doğrulama katmanı olarak eklenmesi

## Kaynaklar

- Es ve ark. (2023) — *RAGAS: Automated Evaluation of Retrieval Augmented Generation*
- Min ve ark. (2023) — *FActScore: Fine-grained Atomic Evaluation of Factual Precision*
- [Hugging Face: NLI modelleri](https://huggingface.co/models?pipeline_tag=zero-shot-classification)
- [sentence-transformers](https://www.sbert.net/)
