# 26 · PacketLab

> **Alan:** G. İşletim sistemleri ve ağlar · **Zorluk:** Orta · **Tür:** Deneysel araştırma + test ortamı · **Ekip:** 2 kişi · **MVP:** 4–5 hafta

## Basitçe anlatalım

Bir uygulamayı kampüste, hızlı Wi-Fi'da denediğinde her şey harika çalışıyor. Ama aynı uygulamayı metroda, tünele girip çıkarken ya da köyde zayıf bir mobil bağlantıyla kullanınca butonlar donuyor, sayfa sonsuza kadar yükleniyor, gönderdiğin mesaj iki kez gidiyor.

Geliştiriciler uygulamalarını genelde mükemmel internet bağlantısıyla test eder. PacketLab, **kötü internetin taklidini yapan bir laboratuvar**: bağlantıyı bilerek yavaşlatır, paketleri kaybettirir, bağlantıyı aniden koparır. Böylece uygulamaların kötü koşullarda nasıl davrandığını ölçebiliriz ve hangi tekniklerin onları daha dayanıklı yaptığını görebiliriz.

**Tek cümleyle:** Gecikme, paket kaybı ve bağlantı kopmalarının uygulamalara etkisini kontrollü olarak test eden bir ağ deney ortamı.

## Problem

Gerçek kullanıcıların internet bağlantısı yavaş, kararsız ve kesintilidir. Ancak uygulamalar çoğunlukla hızlı ağlarda geliştirilip test edilir. Kötü ağ koşulları hata ayıklaması en zor hatalara yol açar: zaman aşımları, tekrar gönderilen istekler, takılı kalan arayüzler. Bu koşulları tekrar üretilebilir şekilde oluşturmak zordur.

## Ne geliştirilecek?

- Gecikme, paket kaybı, bant genişliği sınırı ve kopma senaryolarını **tek komutla uygulayan** ağ koşulu aracı
- Gerçek dünyadan alınmış **hazır profiller**: "metro", "kalabalık konser alanı", "3G kırsal"
- Senaryoları kod olarak yazmaya izin veren betik dili ("10. saniyede bağlantıyı 5 saniye kes")
- Örnek uygulamaların bu koşullarda davranışını ölçen **otomatik deney düzeneği**
- Sonuç panosu

## Araştırma sorusu

> Gecikme, paket kaybı ve kısa kesintiler, farklı iletişim yaklaşımlarını (HTTP/1.1, HTTP/2, HTTP/3, WebSocket) ve istemci tarafı teknikleri (yeniden deneme, zaman aşımı ayarı) kullanan uygulamaların kullanıcının hissettiği performansını nasıl etkiler?

## Deney tasarımı

1. **Test uygulamaları:** Aynı işlevi farklı yöntemlerle yapan küçük örnek uygulamalar (ör. bir sohbet uygulaması: uzun yoklama vs. WebSocket; bir dosya listesi: HTTP/1.1 vs. HTTP/2 vs. HTTP/3).
2. **Ağ koşulları:** Gecikme (20, 100, 300, 1000 ms) × paket kaybı (%0, %1, %5, %10) × kopma senaryoları.
3. Her kombinasyonu en az 10 kez çalıştır.
4. Sayfa yükleme süresi, mesaj gecikmesi, başarısız istek oranı ve kullanıcıya görünen hataları ölç.
5. Yeniden deneme ve zaman aşımı ayarlarının etkisini ayrıca karşılaştır.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| İşlem tamamlanma süresi | Kullanıcının işi ne kadar sürede bitti? | Otomatik tarayıcı ölçümü |
| p95 gecikme | En kötü %5'lik durumu dışarıda bırakınca en uzun bekleme | Yüzdelik hesabı |
| Başarısızlık oranı | İsteklerin yüzde kaçı hiç tamamlanamadı? | Sayaç |
| Tekrarlanabilirlik | Aynı senaryo tekrarlandığında sonuçlar ne kadar tutarlı? | Standart sapma |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Paket** | İnternette gönderilen verinin küçük parçaları |
| **Gecikme** (latency) | Bir paketin karşıya ulaşıp cevabın dönmesi için geçen süre |
| **Paket kaybı** | Gönderilen paketlerin bir kısmının yolda kaybolması |
| **Bant genişliği** | Saniyede taşınabilecek en fazla veri miktarı |
| **Jitter** | Gecikmenin sürekli değişmesi, düzensizliği |
| **TCP / UDP / QUIC** | Verinin internette nasıl taşınacağını belirleyen protokoller; QUIC, HTTP/3'ün temelidir |
| **tc / netem** | Linux'ta ağ koşullarını yapay olarak bozan araçlar |
| **Zaman aşımı** (timeout) | Cevap gelmezse ne kadar bekleneceğinin sınırı |
| **Head-of-line blocking** | Öndeki tek bir paket kaybolunca arkadakilerin de beklemek zorunda kalması |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, TCP/QUIC temellerini oku |
| 1–3 | Keşif (K1) | Docker + netem ile ilk deney ortamı, örnek uygulamalar |
| 4–5 | Geliştirme | **MVP:** profil seçip uygulamayı otomatik test eden araç |
| 6–8 | Geliştirme (K2) | Senaryo betikleri, HTTP/3 desteği; ara değerlendirme |
| 9–11 | Tamamlama | Tam deney matrisi, sonuç analizi |
| 12–13 | Tamamlama | Pano, hazır profillerin belgelenmesi, CI entegrasyonu |
| 14 | Sonuç (K3) | Teknik rapor: "Kötü ağda hangi yaklaşım dayanıklı?" |

## Başlamadan önce

**Bilmen iyi olur:** Temel Linux komut satırı, Docker, bir web uygulaması yazmış olmak.
**Öğreneceklerin:** Bilgisayar ağları, protokoller, deney otomasyonu, performans ölçümü.
**Önerilen teknolojiler:** Linux tc/netem, Docker, Toxiproxy, Playwright, Go veya Python, Grafana (isteğe bağlı).

## Dikkat!

- Ağ koşullarını bozan komutları kendi bilgisayarının ana ağ arayüzüne uygularsan internetin kesilir. Her zaman konteyner içinde çalış.
- Tarayıcıların önbelleği ve bağlantı yeniden kullanımı sonuçları etkiler; her denemeden önce temiz başla.
- Sadece yerel ağda değil, mümkünse gerçek bir mobil bağlantıda da kontrol ölçümü al.

## Projeyi genişletme fikirleri

- TechOps projelerinin CI'ında "kötü ağ testi" adımı
- [OfflineForms](01-offlineforms.md) ve [RetryLab](05-retrylab.md) ile birlikte kullanılabilecek ortak test altyapısı
- Türkiye'deki farklı mobil operatörlerden gerçek ağ ölçümleriyle profil oluşturma

## Kaynaklar

- [netem belgeleri](https://man7.org/linux/man-pages/man8/tc-netem.8.html)
- [Toxiproxy](https://github.com/Shopify/toxiproxy)
- Grigorik — [*High Performance Browser Networking*](https://hpbn.co/) (ücretsiz çevrimiçi kitap)
- [Chrome DevTools: Ağ kısıtlama](https://developer.chrome.com/docs/devtools/network)
