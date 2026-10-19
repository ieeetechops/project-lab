# 01 · OfflineForms

> **Alan:** A. Web teknolojileri · **Zorluk:** Orta · **Tür:** Ürün + deneysel araştırma · **Ekip:** 2 kişi · **MVP:** 4–5 hafta · Kısa liste adayı

## Basitçe anlatalım

Bir etkinlikte kayıt masasındasın ve katılımcıların bilgilerini tablete giriyorsun. Salonun interneti sürekli gidip geliyor. İnternet gittiği anda "Gönder"e basarsan yazdıkların kayboluyor ve herkes baştan yazmak zorunda kalıyor.

OfflineForms, bu formu bir **deftere benzetir**. İnternet yokken yazdıklarını önce tabletin kendi defterine kaydeder. İnternet geri geldiğinde defterdekileri sunucuya sessizce gönderir. Peki iki görevli aynı kişinin bilgisini aynı anda iki farklı tablette değiştirirse ne olur? Hangisi doğru kabul edilir? Projenin araştırma kısmı tam olarak bu: **kopuk çalışan cihazların yazdıklarını sonradan nasıl doğru birleştiririz?**

**Tek cümleyle:** İnternet kesilince bile veri kaybetmeyen, internet gelince akıllıca birleşen web formları.

## Problem

Web formlarının büyük çoğunluğu "çevrimiçi" varsayımıyla yazılır: kullanıcı formu gönderdiği anda sunucuya ulaşılamazsa veri kaybolur ya da kullanıcıya bir hata gösterilir. Etkinlik check-in masaları, saha anketleri, kampüsün zayıf Wi-Fi alanları ve mobil veri sınırı olan kullanıcılar bu durumu sık yaşar. IEEE etkinliklerindeki kayıt ve check-in akışları da bu riski taşır.

## Ne geliştirilecek?

- İnternet bağlantısı olmadan doldurulup kaydedilebilen bir **form bileşeni / küçük kütüphane**
- Veriyi tarayıcıda saklayan ve bağlantı gelince sunucuya gönderen **senkronizasyon katmanı**
- İki cihaz aynı kaydı değiştirdiğinde ne olacağını belirleyen **çakışma çözüm stratejisi**
- Bağlantı kopmalarını otomatik taklit eden bir **deney düzeneği**
- Örnek uygulama: etkinlik check-in formu

## Araştırma sorusu

> Offline-first bir form, klasik çevrimiçi forma göre bağlantı kesintisi altında ne kadar daha az veri kaybeder; farklı çakışma çözüm stratejileri (son yazan kazanır, alan bazlı birleştirme, CRDT) doğruluk ve senkronizasyon süresi bakımından nasıl karşılaştırılır?

## Deney tasarımı

1. **Üç sürüm** hazırla:
   - (A) Klasik çevrimiçi form — *baseline*
   - (B) Offline-first + "son yazan kazanır" (last-write-wins)
   - (C) Offline-first + CRDT tabanlı birleştirme (ör. Automerge)
2. **Senaryolar:** Otomatik test aracıyla (Playwright) yüzlerce form gönderimi yap. Bağlantıyı belirli aralıklarla kes: %5, %20, %50 kesinti; 1 sn, 30 sn, 5 dk kesinti süreleri.
3. **Çakışma senaryoları:** İki sanal cihaz aynı kaydın aynı/farklı alanlarını çevrimdışıyken değiştirsin.
4. Her senaryoyu en az 5 kez tekrarla, ortalama ve standart sapmayı raporla.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Veri kaybı oranı | Gönderilen formların yüzde kaçı sunucuya hiç ulaşmadı? | Gönderilen kayıt sayısı − sunucudaki kayıt sayısı |
| Çakışma doğruluğu | Birleştirme sonrası beklenen sonuç ile gerçek sonuç aynı mı? | Önceden yazılmış "doğru cevap" ile karşılaştırma |
| Senkronizasyon süresi | Bağlantı gelince verinin sunucuya ulaşma süresi | Zaman damgaları, p50 / p95 |
| Depolama maliyeti | Tarayıcıda ne kadar yer kaplıyor? | IndexedDB boyutu |
| Kullanıcı deneyimi | Kullanıcı ne olduğunu anlıyor mu? | 5 kişilik kısa kullanılabilirlik testi |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Offline-first** | Uygulamanın önce internetsiz çalışacak şekilde tasarlanması; internet "olursa iyi olur" bir ek |
| **Service Worker** | Tarayıcıda arka planda çalışan küçük bir yardımcı program. Site kapalıyken bile ağ isteklerini yakalayıp saklayabilir |
| **IndexedDB** | Tarayıcının içindeki küçük veritabanı. Sayfayı yenilesen bile veri kalır |
| **Senkronizasyon** | İki yerdeki verinin aynı hale getirilmesi |
| **Çakışma** (conflict) | İki kişinin aynı veriyi birbirinden habersiz farklı şekilde değiştirmesi |
| **Last-write-wins** | "En son kim yazdıysa o geçerli" kuralı. Basit ama diğerinin değişikliği kaybolur |
| **CRDT** | Kopuk çalışan kopyaların, merkezi bir hakem olmadan her zaman aynı sonuca birleşmesini garanti eden özel veri yapıları |
| **Local-first** | Verinin asıl sahibinin kullanıcının cihazı olduğu, sunucunun sadece eşitleme yaptığı yaklaşım |
| **Idempotent gönderim** | Aynı formun iki kez gönderilmesinin iki kayıt oluşturmaması |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, IEEE check-in sürecindeki gerçek sorunları 2–3 kişiyle konuş |
| 1–3 | Keşif (K1) | Service Worker, IndexedDB ve Automerge'ü küçük denemelerle öğren; klasik formu (baseline) yaz ve veri kaybını ölç |
| 4–6 | Geliştirme | **MVP:** offline kaydeden ve bağlantı gelince gönderen form (sürüm B) |
| 7–8 | Geliştirme (K2) | Çakışma senaryoları, sürüm C; ara değerlendirme sunumu |
| 9–11 | Tamamlama | Deney düzeneği (Playwright + ağ kesintisi), tüm senaryoların ölçümü |
| 12–13 | Tamamlama | Kullanılabilirlik testi, belgeler, paketleme |
| 14 | Sonuç (K3) | Teknik rapor, canlı demo: interneti kapatıp form doldurmak |

## Başlamadan önce

**Bilmen iyi olur:** Temel JavaScript/TypeScript, HTML formları, `fetch` ile istek gönderme.
**Öğreneceklerin:** Tarayıcı depolama API'leri, arka plan senkronizasyonu, dağıtık veri tutarlılığı, otomatik uçtan uca test.
**Önerilen teknolojiler:** TypeScript, Service Worker / Workbox, IndexedDB (idb veya Dexie), Automerge veya Yjs, Playwright, basit bir Node.js API.

## Dikkat!

- "Sayfa kapanınca da çalışsın" ile "sayfa açıkken bağlantı kopunca çalışsın" farklı problemlerdir. Kapsamı baştan netleştir.
- Tarayıcılar arka plan senkronizasyonu desteğinde farklılık gösterir; hangi tarayıcıda test ettiğini rapora yaz.
- Kişisel veri tarayıcıda saklanıyorsa ortak kullanılan cihazlarda (kayıt masası tableti) silme politikası tasarla.
- CRDT her problemin cevabı değildir; basit bir form için "son yazan kazanır" yeterliyse bunu göstermek de değerli bir sonuçtur.

## Projeyi genişletme fikirleri

- Dosya/fotoğraf ekli formlar için offline kuyruk
- Çakışma olduğunda kullanıcıya "hangisi doğru?" diye soran arayüz
- IEEE etkinlik check-in sistemine entegrasyon

## Kaynaklar

- [Automerge](https://automerge.org) — local-first uygulamalar için CRDT kütüphanesi
- [Yjs](https://yjs.dev) — alternatif CRDT kütüphanesi
- [MDN: Service Worker API](https://developer.mozilla.org/en-US/docs/Web/API/Service_Worker_API)
- [MDN: IndexedDB API](https://developer.mozilla.org/en-US/docs/Web/API/IndexedDB_API)
- [Local-first software](https://www.inkandswitch.com/local-first/) — Ink & Switch makalesi
- [Playwright](https://playwright.dev) — tarayıcı otomasyonu ve ağ kesintisi taklidi
