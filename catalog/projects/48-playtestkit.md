# 48 · PlaytestKit

> **Alan:** L. Oyun teknolojileri · **Zorluk:** Orta · **Tür:** Ürün + kullanıcı araştırması · **Ekip:** 2 kişi · **MVP:** 4–5 hafta

## Basitçe anlatalım

Bir oyun yaptın ve arkadaşlarına oynattın. "Güzelmiş" dediler. Ama gerçekte ne oldu? Belki herkes aynı yerde takıldı ama söylemekten çekindi. Belki bir bölümü kimse bulamadı. Belki oyunun en çok emek verdiğin kısmını herkes atladı.

Oyun stüdyoları bunu anlamak için iki yol kullanır: Birincisi oyuncuyu izleyip not almak. İkincisi oyunun içine, oyuncunun nerede öldüğünü, nerede durduğunu, ne kadar sürede ilerlediğini kaydeden sayaçlar koymak. PlaytestKit, küçük oyun ekipleri için bu **kayıt ve analiz aracını** geliştirir ve şu soruyu araştırır: izleyerek bulduğumuz sorunlarla verilerden bulduğumuz sorunlar aynı mı?

**Tek cümleyle:** Bağımsız oyun geliştiricileri için oyun içi davranış kaydı ve ısı haritası analizi yapan bir araç geliştiren ve gözlem tabanlı testlerle veri tabanlı analizin bulduğu sorunları karşılaştıran bir proje.

## Problem

Küçük ekipler ve öğrenci oyun projeleri genellikle sistematik oyun testi yapmaz; geri bildirim sözlü yorumlarla sınırlı kalır. Büyük stüdyoların kullandığı analiz araçları pahalı veya karmaşıktır. Hangi sorunların yalnızca gözlemle, hangilerinin yalnızca veriyle bulunabildiği de belirsizdir.

## Ne geliştirilecek?

- Unity ve Godot (veya web oyunları) için oyun içi olayları kaydeden **hafif kayıt kütüphanesi**
- Oyuncu konumlarını, ölüm noktalarını ve takılma alanlarını harita üzerinde gösteren **ısı haritası aracı**
- Bölüm bazında tamamlanma süresi ve bırakma oranlarını gösteren pano
- Gözlemci notlarını zaman damgasıyla oyun kaydına bağlayan not alma aracı
- Kişisel veri toplamayan, anonim kayıt yapısı

## Araştırma sorusu

> Oyun testlerinde gözlem ve sesli düşünme yöntemiyle bulunan tasarım sorunları ile oyun içi telemetri analiziyle bulunan sorunlar ne ölçüde örtüşür? Hangi sorun türleri yalnızca bir yöntemle tespit edilebilir?

## Deney tasarımı

1. **Oyunlar:** Kolun veya öğrencilerin geliştirdiği 2–3 küçük oyun (ya da açık kaynak oyunlar).
2. **Test oturumları:** 15–25 gönüllü; her oturum hem gözlemciyle izlenir hem telemetriyle kaydedilir. Onam alınır, kişisel veri toplanmaz.
3. **Analiz:**
   - (A) Yalnızca gözlem notları ve oyuncu yorumları — baseline
   - (B) Yalnızca telemetri ve ısı haritaları
   - (C) İkisinin birleşimi
4. Her yöntemle bulunan sorunlar listelenir, oyunun geliştiricisi tarafından önem derecesine göre puanlanır ve kategorilere ayrılır.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Bulunan sorun sayısı | Her yöntem kaç farklı sorun buldu? | Sorun listesi |
| Örtüşme oranı | İki yöntemin ortak bulduğu sorunların oranı | Karşılaştırma |
| Önemli sorunları bulma | Geliştiricinin "kritik" dediği sorunların kaçı bulundu? | Önem puanları |
| Analiz süresi | Sorunları bulmak için harcanan ekip zamanı | Saat |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Oyun testi** (playtest) | Oyunu gerçek oyunculara oynatıp nasıl karşılandığını gözlemleme |
| **Telemetri** | Oyunun içinden otomatik olarak toplanan kullanım verileri |
| **Isı haritası** | Bir olayın haritanın neresinde ne sıklıkla olduğunu renklerle gösteren görsel |
| **Sesli düşünme** (think-aloud) | Oyuncunun oynarken aklından geçenleri yüksek sesle söylediği test yöntemi |
| **Bırakma oranı** | Oyuncuların yüzde kaçının belirli bir noktada oyunu bıraktığı |
| **Olay** (event) | Kaydedilen tek bir oyun anı (öldü, bölümü bitirdi, eşya aldı) |
| **Anonim kayıt** | Verinin hiçbir oyuncuyla ilişkilendirilemeyecek şekilde tutulması |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, test edilecek oyunları seç |
| 1–3 | Keşif (K1) | Kayıt kütüphanesi, olay şeması, ilk oyuna entegrasyon |
| 4–5 | Geliştirme | **MVP:** olay kaydı ve ısı haritası üreten araç |
| 6–8 | Geliştirme (K2) | Pano, gözlemci not aracı, pilot test; ara değerlendirme |
| 9–11 | Tamamlama | Test oturumları ve karşılaştırmalı analiz |
| 12–13 | Tamamlama | Aracın paketlenmesi, entegrasyon kılavuzu |
| 14 | Sonuç (K3) | Teknik rapor ve açık kaynak araç |

## Başlamadan önce

**Bilmen iyi olur:** Unity (C#), Godot (GDScript) veya web oyunu geliştirme; temel web geliştirme.
**Öğreneceklerin:** Oyun kullanıcı araştırması, veri toplama tasarımı, veri görselleştirme, araç geliştirme.
**Önerilen teknolojiler:** C# veya GDScript (kayıt kütüphanesi), Python veya TypeScript (analiz), D3.js veya Plotly (ısı haritası), SQLite.

## Dikkat!

- Oyunculardan isim, e-posta veya cihaz kimliği toplama; rastgele oturum kimliği yeterlidir.
- Çok fazla olay kaydetmek analizi zorlaştırır; neyi neden kaydettiğini baştan belirle.
- Gözlemci ile analist farklı kişiler olursa karşılaştırma daha tarafsız olur.

## Projeyi genişletme fikirleri

- Kolun düzenlediği oyun geliştirme etkinliklerinde (game jam) kullanılması
- [AdaptivePuzzle](31-adaptivepuzzle.md) ve [ProceduralWorld](30-proceduralworld.md) projelerinin test altyapısı
- Oturum kayıtlarını tekrar oynatabilen izleme modu

## Kaynaklar

- Drachen, Seif El-Nasr & Canossa — *Game Analytics: Maximizing the Value of Player Data*
- Fullerton — *Game Design Workshop* (oyun testi bölümleri)
- [Unity Analytics belgeleri](https://docs.unity.com/ugs/manual/analytics/manual/overview)
- Nielsen Norman Group — [*Thinking Aloud*](https://www.nngroup.com/articles/thinking-aloud-the-1-usability-tool/)
