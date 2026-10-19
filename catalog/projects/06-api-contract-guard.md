# 06 · API Contract Guard

> **Alan:** B. Backend, API ve dağıtık sistemler · **Zorluk:** Orta · **Tür:** Ürün + deneysel araştırma · **Ekip:** 2 kişi · **MVP:** 5 hafta · IEEE ve diğer öğrenci kolları için kullanışlı

## Basitçe anlatalım

Bir restoranda garsonla anlaşman var: "Menüdeki 5 numarayı istersem bana mercimek çorbası gelir." Bir gün mutfak menüyü değiştiriyor ve 5 numara artık tavuk çorbası oluyor ama kimseye haber vermiyor. Sen yine 5 diyorsun ve beklemediğin bir şey geliyor.

Programlar da birbirleriyle böyle **anlaşmalar** (API) üzerinden konuşur. Bir backend ekibi API'sini güncellediğinde, onu kullanan mobil uygulama veya web sitesi farkında olmadan bozulabilir. API Contract Guard, değişiklik yayınlanmadan önce **"bu değişiklik birilerini bozar mı?"** diye kontrol eden bir bekçidir.

**Tek cümleyle:** API güncellemelerinin mevcut istemcileri bozup bozmayacağını önceden söyleyen bir araç.

## Problem

API'ler değişir: alanlar yeniden adlandırılır, zorunlu hale gelir, veri tipleri değişir. Bu değişiklikler çoğunlukla ancak üretimde bir istemci bozulduğunda fark edilir. Şema karşılaştırma araçları var, ama bir değişikliğin **gerçekten** istemcileri bozup bozmadığını her zaman doğru söyleyemezler. Bazı "kırıcı" görünen değişiklikler zararsızdır, bazı "zararsız" görünenler ise kırıcıdır.

## Ne geliştirilecek?

- İki OpenAPI şemasını karşılaştırıp **kırıcı değişiklikleri** listeleyen CLI aracı
- PR'larda otomatik çalışan **GitHub Action**
- Gerçek istemci isteklerini kaydedip yeni API'ye karşı **tekrar oynatan** uyumluluk testi
- Değişiklik türlerini açıklayan sade Türkçe rapor

## Araştırma sorusu

> Statik şema karşılaştırmasıyla tespit edilen "kırıcı değişiklikler", gerçek istemci trafiğinin tekrar oynatılmasıyla gözlenen bozulmalarla ne kadar örtüşür; hangi değişiklik türlerinde yanlış alarm veya kaçırma oluşur?

## Deney tasarımı

1. **Değişiklik kataloğu oluştur:** alan silme, yeniden adlandırma, tip değiştirme, opsiyonel → zorunlu, yeni enum değeri, yeni alan ekleme vb. (en az 20 tür).
2. Örnek bir API ve 2–3 farklı istemci (katı doğrulayan, gevşek olan) yaz.
3. Her değişiklik için:
   - Şema karşılaştırması ne diyor? (kırıcı / değil)
   - İstemcileri yeni API'ye karşı çalıştırınca gerçekte ne oluyor? (bozuldu / bozulmadı)
4. Sonuçları karışıklık matrisinde (confusion matrix) göster.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Precision | "Kırıcı" denen değişikliklerin kaçı gerçekten kırıcıydı? | Gerçek testlerle karşılaştırma |
| Recall | Gerçek kırıcı değişikliklerin kaçı yakalandı? | Gerçek testlerle karşılaştırma |
| Çalışma süresi | CI'da ne kadar sürüyor? | Saniye |
| Anlaşılırlık | Geliştirici raporu okuyunca ne yapacağını biliyor mu? | 3–5 geliştiriciyle kısa test |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **API sözleşmesi** (contract) | Bir API'nin hangi istekleri kabul edip hangi cevapları verdiğinin yazılı tanımı |
| **OpenAPI** | REST API'lerini tanımlamak için kullanılan standart dosya formatı (YAML/JSON) |
| **Şema** | Verinin yapısını (hangi alanlar, hangi tipler) tarif eden tanım |
| **Kırıcı değişiklik** (breaking change) | Eski istemcilerin çalışmasını bozan değişiklik |
| **Geriye dönük uyumluluk** | Yeni sürümün eski istemcilerle çalışmaya devam etmesi |
| **Semantik sürümleme** | `MAJOR.MINOR.PATCH` sürüm numaraları; kırıcı değişiklikte MAJOR artar |
| **Consumer-driven contract** | API'yi kullananların "benim beklediğim bu" diye test yazması |
| **Trafik tekrar oynatma** (replay) | Gerçek istekleri kaydedip yeni sisteme tekrar göndermek |
| **Confusion matrix** | Doğru/yanlış tahminleri dört kutuda gösteren tablo |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Mevcut araçları (oasdiff vb.) dene, eksiklerini not et |
| 1–3 | Keşif (K1) | Örnek API + istemciler, değişiklik kataloğu, mevcut araçla baseline |
| 4–8 | Geliştirme (K2) | **MVP:** şema karşılaştıran CLI + GitHub Action; ara değerlendirme |
| 9–11 | Tamamlama | Replay tabanlı uyumluluk testi, karşılaştırma deneyi |
| 12–13 | Tamamlama | Rapor çıktısı, belgeler, örnek depo |
| 14 | Sonuç (K3) | Teknik rapor ve açık kaynak sürüm |

## Başlamadan önce

**Bilmen iyi olur:** REST API, JSON, bir backend dili.
**Öğreneceklerin:** API tasarımı ve sürümleme, statik analiz, CI/CD, test otomasyonu.
**Önerilen teknolojiler:** TypeScript veya Go, OpenAPI, GitHub Actions, Pact (karşılaştırma için).

## Dikkat!

- Mevcut güçlü araçları baseline olarak kullan; farkını göster, sıfırdan aynısını yazma.
- "Kırıcı" kavramı istemciye göre değişir; varsayımlarını açıkça yaz.

## Projeyi genişletme fikirleri

- GraphQL şemaları desteği
- IEEE Hub API'lerinde kullanım

## Kaynaklar

- [OpenAPI Initiative](https://www.openapis.org)
- [oasdiff](https://github.com/oasdiff/oasdiff) — OpenAPI karşılaştırma aracı
- [Pact](https://pact.io) — consumer-driven contract testing
- [Semantic Versioning](https://semver.org/lang/tr/)
