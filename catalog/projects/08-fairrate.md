# 08 · FairRate

> **Alan:** B. Backend, API ve dağıtık sistemler · **Zorluk:** Orta–İleri · **Tür:** Ürün (kütüphane) + deneysel araştırma · **Ekip:** 2 kişi · **MVP:** 5–6 hafta

## Basitçe anlatalım

Bir lunaparkta çok popüler bir hız treni var. Herkes binmek istiyor ama tren dakikada sadece 20 kişi alabiliyor. Biri kalkıp 50 arkadaşını getirip sırayı doldurursa diğer herkes saatlerce bekler.

Lunapark görevlisinin bir kurala ihtiyacı var: "Her kişi saatte en fazla 3 kez binebilir" gibi. Sunucular da aynı sorunu yaşar: tek bir kullanıcı (veya kötü niyetli bir bot) saniyede binlerce istek gönderip sistemi herkes için yavaşlatabilir. FairRate, sunucu için **adil bir lunapark görevlisi** yazar ve farklı kuralların ne kadar adil ve verimli olduğunu ölçer.

**Tek cümleyle:** API'lere gelen istekleri adil ve verimli biçimde sınırlayan bir kütüphane ve farklı sınırlama algoritmalarının karşılaştırılması.

## Problem

Hız sınırlaması (rate limiting) olmayan API'ler kötüye kullanıma, botlara ve yanlışlıkla sonsuz döngüye giren istemcilere karşı savunmasızdır. Ancak kaba sınırlar meşru kullanıcıları da cezalandırabilir (aynı kampüs IP'sinin arkasındaki yüzlerce öğrenci gibi). Algoritmalar arasındaki adalet ve performans farkları pratikte nadiren ölçülür.

## Ne geliştirilecek?

- Token bucket, fixed window, sliding window ve **uyarlanabilir** limit algoritmalarını sunan bir **kütüphane** (Node.js veya Python)
- Tek sunucu (bellek içi) ve çok sunuculu (Redis) modlar
- Farklı kullanıcı davranışlarını taklit eden **trafik üretici**
- Sonuç karşılaştırma paneli

## Araştırma sorusu

> Token bucket, sliding window ve sistem yüküne göre uyarlanan limit algoritmaları; ani yoğunluk, kötü niyetli kullanıcı ve paylaşılan IP senaryolarında meşru kullanıcıların başarı oranını, adaleti ve sunucu yükünü nasıl etkiler?

## Deney tasarımı

1. **Kullanıcı tipleri:** normal (düzenli az istek), patlamalı (kısa sürede çok istek, sonra sessiz), kötü niyetli (sürekli maksimum hız), paylaşılan IP (100 öğrenci tek IP).
2. **Algoritmalar:** sınırsız (baseline), fixed window, sliding window, token bucket, uyarlanabilir.
3. Her senaryoda meşru isteklerin kaçının reddedildiğini, kötü niyetli isteklerin kaçının geçtiğini ölç.
4. Redis modunda çok sunuculu kurulumda tutarlılığı test et.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Meşru başarı oranı | Normal kullanıcıların isteklerinin yüzde kaçı geçti? | Trafik üretici kayıtları |
| Kötüye kullanım engelleme | Kötü niyetli isteklerin yüzde kaçı durduruldu? | Trafik üretici kayıtları |
| Adalet | Kullanıcılar arasında hizmet ne kadar eşit? | Jain adalet indeksi |
| Ek gecikme | Sınırlayıcının her isteğe eklediği süre | p50 / p99 µs |
| Bellek | Kullanıcı başına bellek maliyeti | Byte |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Rate limiting** | Belirli sürede yapılabilecek istek sayısını sınırlamak |
| **Token bucket** | Kovaya düzenli aralıklarla jeton düşer; her istek bir jeton harcar. Kova boşsa beklersin. Kısa patlamalara izin verir |
| **Fixed window** | "Her dakika 0'dan başlayarak 100 istek" — dakika sınırında hile yapılabilir |
| **Sliding window** | Son 60 saniyeye bakarak sayar; daha adil ama daha maliyetli |
| **Uyarlanabilir limit** | Sunucu yoğunlaştıkça limitlerin otomatik daralması |
| **HTTP 429** | "Çok fazla istek" hata kodu |
| **Redis** | Çok hızlı, bellek içi veri deposu; birden fazla sunucunun ortak sayaç tutmasını sağlar |
| **Atomik işlem** | Yarıda kesilemeyen, ya tamamen olan ya hiç olmayan işlem |
| **Paylaşılan IP / NAT** | Birçok cihazın internete tek bir IP adresiyle çıkması (kampüs ağı gibi) |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Mevcut kütüphaneleri incele, IEEE sistemlerinde risk noktalarını bul |
| 1–3 | Keşif (K1) | Fixed window (baseline) + trafik üretici |
| 4–8 | Geliştirme (K2) | **MVP:** 3 algoritma, bellek içi mod, ilk ölçümler; ara değerlendirme |
| 9–11 | Tamamlama | Redis modu, uyarlanabilir limit, tüm senaryolar |
| 12–13 | Tamamlama | Paket yayını, belgeler, örnek entegrasyon |
| 14 | Sonuç (K3) | Teknik rapor ve kütüphane v1.0 |

## Başlamadan önce

**Bilmen iyi olur:** Node.js veya Python, HTTP, temel veri yapıları.
**Öğreneceklerin:** Dağıtık sayaçlar, eşzamanlılık, yük testi, kütüphane tasarımı ve yayınlama.
**Önerilen teknolojiler:** TypeScript veya Python, Redis (Lua betikleri), k6, Docker Compose.

## Dikkat!

- Çok sunuculu modda iki sunucunun aynı anda sayaç artırması yarış durumuna yol açar; atomik işlemler kullan.
- Sadece IP'ye göre sınırlamak kampüs kullanıcılarını cezalandırır; kullanıcı kimliği seçeneği sun.
- Saat farkları (sunucular arasında) sliding window hesabını bozabilir.

## Projeyi genişletme fikirleri

- Yük altında otomatik devreye giren "koruma modu"
- Kullanıcıya "X saniye sonra tekrar dene" bilgisini standart başlıklarla iletmek

## Kaynaklar

- [Cloudflare: How we built rate limiting](https://blog.cloudflare.com/counting-things-a-lot-of-different-things/)
- [Token bucket (Wikipedia)](https://en.wikipedia.org/wiki/Token_bucket)
- [Redis belgeleri](https://redis.io/docs/latest/)
- [MDN: HTTP 429](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Status/429)
