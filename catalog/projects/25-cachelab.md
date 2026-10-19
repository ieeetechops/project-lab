# 25 · CacheLab

> **Alan:** G. İşletim sistemleri ve ağlar · **Zorluk:** Orta · **Tür:** Deneysel araştırma + simülatör · **Ekip:** 2 kişi · **MVP:** 4–5 hafta

## Basitçe anlatalım

Çalışma masanda sadece 5 kitaba yer var, geri kalan kitaplar odanın diğer ucundaki rafta. Yeni bir kitaba ihtiyacın olduğunda raftan getirmen gerekiyor ve masada yer açmak için bir kitabı geri götürmelisin. Hangisini götürürsün? En uzun süredir açmadığını mı? En az açtığını mı? Rastgele birini mi? Yanlış kitabı götürürsen beş dakika sonra onu tekrar getirmek için yürümen gerekir.

Bilgisayarlar da aynı sorunu yaşar: hızlı ama küçük bir hafızaya (önbellek) neyin konulacağına ve yer dolunca neyin atılacağına karar vermeleri gerekir. CacheLab, bu "hangi kitabı geri götüreyim?" stratejilerini **gerçekçi kullanım senaryolarında yarıştıran** bir simülatör.

**Tek cümleyle:** LRU, LFU ve diğer önbellek değiştirme algoritmalarını gerçekçi erişim dizilerinde karşılaştıran bir simülatör.

## Problem

Önbellekler her yerdedir: işlemcide, işletim sisteminde, veritabanlarında, tarayıcıda, CDN'lerde. Hangi değiştirme algoritmasının en iyisi olduğu, verinin nasıl erişildiğine bağlıdır. Ders kitapları LRU'yu öğretir ama gerçek sistemlerde (Redis, CDN'ler) çok daha farklı algoritmalar kullanılır. Hangi algoritmanın hangi erişim deseninde neden iyi olduğu ancak deneyle anlaşılır.

## Ne geliştirilecek?

- Farklı algoritmaları aynı arayüzle çalıştıran **önbellek simülatörü** (kütüphane + CLI)
- Uygulanacak algoritmalar: FIFO, LRU, LFU, Random, CLOCK, ARC, S3-FIFO veya TinyLFU
- Sentetik erişim dizisi üreteci (Zipf dağılımı, tarama desenleri, döngüsel desenler)
- Gerçek erişim kayıtlarını (trace) okuyabilen modül
- İsabet oranı grafiklerini gösteren interaktif sayfa (algoritmanın adım adım ne yaptığını gösteren görselleştirme dahil)

## Araştırma sorusu

> Farklı önbellek değiştirme algoritmaları, farklı erişim desenlerinde (popülerlik dağılımı, tarama, değişen popülerlik) ve farklı önbellek boyutlarında isabet oranı ve işlem maliyeti açısından nasıl karşılaştırılır?

## Deney tasarımı

1. **Erişim dizileri:**
   - Sentetik: Zipf (birkaç popüler öğe çok sık istenir), tek seferlik tarama, döngü, popülerliğin zamanla değiştiği desen
   - Gerçek: açık kaynak önbellek trace'leri (ör. CDN veya depolama kayıtları)
2. **Algoritmalar:** FIFO ve Random — baseline; LRU, LFU, CLOCK; modern: ARC, S3-FIFO.
3. **Değişkenler:** Önbellek boyutu (toplam öğe sayısının %0,1'i ile %10'u arası).
4. İsabet oranı, istek başına işlem süresi ve bellek ek yükü ölçülür.
5. Teorik üst sınır olarak Belady'nin optimal algoritmasını (geleceği bilen algoritma) da hesapla.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| İsabet oranı (hit ratio) | İsteklerin yüzde kaçı önbellekte bulundu? | Simülasyon sayacı |
| Optimale uzaklık | Geleceği bilen algoritmaya ne kadar yaklaştı? | Belady sonucuyla oran |
| İşlem maliyeti | İstek başına ne kadar sürede karar veriyor? | Mikro benchmark |
| Bellek ek yükü | Algoritmanın kendi kayıtları için harcadığı bellek | Bayt / öğe |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Önbellek** (cache) | Sık kullanılan verilerin hızlı erişim için tutulduğu küçük, hızlı hafıza |
| **İsabet / ıska** (hit / miss) | İstenen veri önbellekte var / yok |
| **Değiştirme algoritması** (eviction policy) | Önbellek dolunca hangi verinin atılacağına karar veren kural |
| **LRU** (Least Recently Used) | En uzun süredir kullanılmayanı at |
| **LFU** (Least Frequently Used) | En az sıklıkla kullanılanı at |
| **CLOCK** | LRU'ya benzer ama çok daha ucuz çalışan, saat ibresi mantığıyla dönen algoritma |
| **Zipf dağılımı** | Az sayıda öğenin çok popüler, çoğunun nadiren istendiği dağılım (internetteki gibi) |
| **Trace** | Gerçek bir sistemden kaydedilmiş istek sırası |
| **Belady optimal** | Geleceği bildiği için hep en doğru kararı veren teorik algoritma; gerçekte uygulanamaz |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, önbellek algoritmalarını oku |
| 1–3 | Keşif (K1) | Simülatör iskeleti, FIFO/LRU/LFU, sentetik dizi üreteci |
| 4–5 | Geliştirme | **MVP:** 4 algoritmayı sentetik dizilerde karşılaştıran CLI |
| 6–8 | Geliştirme (K2) | CLOCK, ARC, S3-FIFO; gerçek trace desteği, Belady; ara değerlendirme |
| 9–11 | Tamamlama | Tam deney matrisi (algoritma × desen × boyut) |
| 12–13 | Tamamlama | İnteraktif görselleştirme sayfası, belgeler |
| 14 | Sonuç (K3) | Teknik rapor: "Hangi desen için hangi algoritma?" |

## Başlamadan önce

**Bilmen iyi olur:** Veri yapıları (bağlı liste, hash tablosu), bir programlama dilinde iyi düzeyde kodlama.
**Öğreneceklerin:** İşletim sistemleri ve bellek yönetimi, algoritma analizi, performans ölçümü, simülasyon.
**Önerilen teknolojiler:** Rust, Go veya Python (hız gerekirse Rust/Go), görselleştirme için JavaScript (D3).

## Dikkat!

- Python'da milyonlarca isteği simüle etmek yavaş olabilir. Simülatörün çekirdeğini hızlı bir dilde yaz ya da örneklem kullan.
- LRU'yu O(1) karmaşıklıkla uygulamak için hash tablosu + çift yönlü bağlı liste gerekir; naive uygulama sonuçları çarpıtır.
- Tek bir erişim desenine bakarak "en iyi algoritma budur" deme.

## Projeyi genişletme fikirleri

- Erişim desenine göre algoritmayı otomatik seçen uyarlanabilir önbellek
- Gerçek bir sistemde (ör. Redis veya bir web sunucusu) deneme
- Ders anlatımında kullanılabilecek, adım adım ilerleyen eğitim modu

## Kaynaklar

- Megiddo & Modha (2003) — *ARC: A Self-Tuning, Low Overhead Replacement Cache* (FAST)
- Yang ve ark. (2023) — *FIFO Queues are All You Need for Cache Eviction* (SOSP; S3-FIFO)
- [libCacheSim](https://github.com/1a1a11a/libCacheSim) — önbellek simülasyon kütüphanesi ve trace'ler
- Arpaci-Dusseau — [*Operating Systems: Three Easy Pieces*](https://pages.cs.wisc.edu/~remzi/OSTEP/), bölüm 22
