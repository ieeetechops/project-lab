# 28 · DeltaSync

> **Alan:** G. İşletim sistemleri ve ağlar · **Zorluk:** Orta–İleri · **Tür:** Ürün (kütüphane/CLI) + deneysel araştırma · **Ekip:** 2 kişi · **MVP:** 5–6 hafta

## Basitçe anlatalım

200 sayfalık bir kitabı bir arkadaşınla paylaşıyorsun. Bir sayfada tek bir cümleyi düzelttin. Arkadaşına kitabın tamamını yeniden fotokopi çekip gönderir misin? Yoksa "45. sayfanın 3. paragrafını şöyle değiştir" diye küçük bir not mu yollarsın? Tabii ki not.

Ama bilgisayarlar çoğu zaman tüm kitabı yeniden gönderir: 200 MB'lık bir dosyanın sadece 2 MB'ı değiştiyse bile 200 MB'ın tamamı yeniden yüklenir. DeltaSync, dosyanın **sadece değişen kısmını** bulup gönderen bir senkronizasyon aracı. İşin zor tarafı şu: dosyanın neresinin değiştiğini, iki tarafın da dosyanın tamamını birbirine göndermeden nasıl anlayacağız?

**Tek cümleyle:** Büyük dosyalar değiştiğinde yalnızca değişen kısımları aktarmayı deneyen ve tam dosya yükleme ile farklı blok tabanlı aktarım yöntemlerini karşılaştıran bir senkronizasyon aracı.

## Problem

Yedekleme, bulut senkronizasyonu, oyun güncellemeleri ve yazılım dağıtımı; hepsi büyük dosyaları tekrar tekrar aktarır. Değişen kısmı bulmak için dosyayı parçalara ayırmak gerekir ama nasıl ayıracağın kritik: sabit boyutlu parçalar kullanırsan dosyanın başına tek bir bayt eklemek tüm parçaları kaydırır ve hepsi "değişmiş" görünür. İçerik tabanlı parçalama bu sorunu çözer ama kendi maliyetleri vardır.

## Ne geliştirilecek?

- Dosyayı farklı yöntemlerle parçalara ayıran **parçalama kütüphanesi**
- İki taraf arasında yalnızca eksik parçaları aktaran **senkronizasyon protokolü** ve CLI aracı
- Parçaların özetini (hash) karşılaştıran ve tekrarlı parçaları bir kez saklayan depolama katmanı
- Farklı dosya türlerinde ve değişiklik desenlerinde otomatik çalışan **benchmark düzeneği**

## Araştırma sorusu

> Tam dosya aktarımı, sabit boyutlu bloklar, rsync tarzı kayan özet ve içerik tanımlı parçalama (CDC) yöntemleri; farklı dosya türlerinde ve değişiklik desenlerinde aktarılan veri miktarı, işlem süresi ve bellek kullanımı açısından nasıl karşılaştırılır?

## Deney tasarımı

1. **Dosya türleri:** Metin/kaynak kod, veritabanı dosyası, sanal makine diski, sıkıştırılmış arşiv (zip), video.
2. **Değişiklik desenleri:** Ortaya ekleme, başa ekleme, rastgele küçük değişiklikler, büyük bir bölümün silinmesi, gerçek ardışık sürümler (ör. bir açık kaynak projenin iki sürümünün arşivi).
3. **Yöntemler:**
   - (A) Tam dosya aktarımı — baseline
   - (B) Sabit boyutlu bloklar
   - (C) rsync algoritması (kayan özet)
   - (D) İçerik tanımlı parçalama (FastCDC), farklı ortalama parça boyutlarıyla
4. Aktarılan bayt, toplam süre (hesaplama + aktarım), CPU ve bellek ölçülür; ağ hızı da değiştirilir (yavaş ağda hesaplama maliyeti daha az önemlidir).

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Aktarılan veri oranı | Gönderilen veri / dosya boyutu | Bayt sayacı |
| Toplam senkronizasyon süresi | Hesaplama + aktarım toplamı | Saniye |
| İşlem hızı | Saniyede kaç MB parçalanıp özetlenebildi? | MB/s |
| Tekilleştirme oranı | Tekrarlı parçalardan ne kadar yer kazanıldı? | Depolanan / ham boyut |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Delta** | İki sürüm arasındaki fark |
| **Senkronizasyon** | İki yerdeki verinin aynı hale getirilmesi |
| **Hash** (özet) | Bir veri parçasının parmak izi gibi kısa özeti; veri değişirse özet de değişir |
| **Blok / parça** (chunk) | Dosyanın bölündüğü küçük parçalar |
| **Kayan özet** (rolling hash) | Pencere bir bayt kaydığında baştan hesaplamadan hızlıca güncellenebilen özet |
| **İçerik tanımlı parçalama** (CDC) | Parça sınırlarını sabit konumlara değil içeriğe göre belirleme; böylece ekleme yapınca sınırlar kaymaz |
| **Tekilleştirme** (deduplication) | Aynı parçayı birden fazla kez saklamamak |
| **rsync** | Yalnızca farkları aktaran klasik ve yaygın senkronizasyon aracı |
| **Merkle ağacı** | Çok sayıda özeti hiyerarşik olarak birleştirip hızlı karşılaştırmayı sağlayan yapı |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, rsync ve FastCDC makalelerini oku |
| 1–3 | Keşif (K1) | Sabit blok ve tam aktarım baseline'ı, test dosyası kümesi, değişiklik üreteci |
| 4–6 | Geliştirme | **MVP:** iki klasörü sabit bloklarla senkronize eden CLI |
| 7–8 | Geliştirme (K2) | rsync tarzı ve CDC yöntemleri; ara değerlendirme |
| 9–11 | Tamamlama | Tam deney matrisi, ağ hızı değişkeni |
| 12–13 | Tamamlama | Kütüphanenin paketlenmesi, belgeler |
| 14 | Sonuç (K3) | Teknik rapor: "Hangi dosyada hangi parçalama yöntemi?" |

## Başlamadan önce

**Bilmen iyi olur:** Bir sistem dilinde (Go, Rust veya C++) ya da iyi düzeyde Python, dosya işlemleri, temel ağ programlama.
**Öğreneceklerin:** Dağıtık sistemler, hash fonksiyonları, sistem programlama, performans ölçümü.
**Önerilen teknolojiler:** Rust veya Go, BLAKE3 veya xxHash, gRPC veya basit TCP protokolü.

## Dikkat!

- Sıkıştırılmış ve şifrelenmiş dosyalarda küçük bir değişiklik tüm dosyayı değiştirir; bu yöntemlerin hiçbiri orada işe yaramaz. Bu bir hata değil, raporlanacak bir bulgu.
- Özet çakışmalarını (iki farklı parçanın aynı özete sahip olması) göz ardı etme; güçlü bir hash kullan.
- Ölçüm yaparken işletim sisteminin dosya önbelleği sonuçları etkiler; her denemeden önce koşulları eşitle.

## Projeyi genişletme fikirleri

- TechOps'un kendi yedekleme veya dosya paylaşım aracı
- Tarayıcıda çalışan sürüm ([Browser ImageLab](03-browser-imagelab.md) gibi WebAssembly ile)
- Sürüm geçmişi tutan, Git benzeri basit bir dosya deposu

## Kaynaklar

- Tridgell & Mackerras (1996) — *The rsync algorithm*
- Xia ve ark. (2016) — *FastCDC: a Fast and Efficient Content-Defined Chunking Approach* (USENIX ATC)
- [restic](https://restic.net/) ve [Borg](https://www.borgbackup.org/) — CDC kullanan açık kaynak yedekleme araçları
- [BLAKE3](https://github.com/BLAKE3-team/BLAKE3)
