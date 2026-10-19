# 45 · NetcodeLab

> **Alan:** L. Oyun teknolojileri · **Zorluk:** İleri · **Tür:** Deneysel araştırma + prototip · **Ekip:** 2–3 kişi · **MVP:** 5–6 hafta

## Basitçe anlatalım

Bir arkadaşınla telefonda taş-kâğıt-makas oynadığını düşün ama sesin ona yarım saniye geç ulaşıyor. Sen "makas" dediğinde o zaten "taş" demiş olabilir. Kim önce söyledi? Çevrim içi oyunlarda da durum aynı: oyuncular farklı şehirlerde, hatta farklı ülkelerde ve her hareketin karşıya ulaşması zaman alıyor. Sen rakibine ateş ettiğinde, ekranında gördüğün rakip aslında bir süre önceki konumunda.

Oyunlar bu gecikmeyi gizlemek için çeşitli teknikler kullanır: senin hareketini beklemeden ekranda göstermek, rakibin nereye gideceğini tahmin etmek, yanlış tahmin edildiyse zamanı geri sarıp düzeltmek. NetcodeLab, bu **gecikme telafisi yöntemlerini** küçük bir çok oyunculu oyunda uygular ve oyuncuların farkı ne kadar hissettiğini ölçer.

**Tek cümleyle:** Çok oyunculu oyunlarda ağ gecikmesini telafi eden yöntemleri (istemci tahmini, ara değerleme, geri sarma) bir prototip oyunda uygulayan ve hem teknik ölçümlerle hem oyuncu deneyimiyle karşılaştıran bir proje.

## Problem

Çevrim içi oyunlarda gecikme oyuncu deneyimini doğrudan etkiler: karakterin geç tepki vermesi, rakiplerin ışınlanır gibi hareket etmesi, vurulduğu görülen rakibin isabet almaması. Farklı netcode yaklaşımlarının farklı türde hataları vardır ve hangisinin hangi oyun türüne uygun olduğu genellikle deneme-yanılmayla belirlenir.

## Ne geliştirilecek?

- 2–4 oyunculu, tarayıcıda çalışan basit bir **aksiyon oyunu** (ör. yukarıdan bakışlı arena)
- Yetkili sunucu mimarisi ile çalışan oyun sunucusu
- Değiştirilebilir netcode modları: doğrudan gönderim, istemci tahmini, ara değerleme, geri sarma
- Yapay gecikme ve paket kaybı ekleyen test modu
- Oyun içi ölçüm: tahmin hataları, düzeltme sayısı, isabet tutarsızlıkları

## Araştırma sorusu

> İstemci tarafı tahmin, varlık ara değerlemesi ve geri sarma (rollback) yöntemleri; farklı gecikme ve paket kaybı düzeylerinde oyuncunun algıladığı tepki gecikmesini, görsel tutarsızlıkları ve oyuncu memnuniyetini nasıl etkiler?

## Deney tasarımı

1. **Modlar:**
   - (A) Oyuncu girdisini sunucuya gönderip cevabı beklemek — baseline
   - (B) İstemci tahmini + sunucu düzeltmesi
   - (C) B + diğer oyuncular için ara değerleme
   - (D) Geri sarma tabanlı netcode
2. **Ağ koşulları:** 20, 80, 150, 250 ms gecikme; %0, %2, %5 paket kaybı.
3. **Teknik ölçümler:** Girdi ile ekranda görünme arası süre, düzeltme sayısı ve büyüklüğü, isabet tutarsızlıkları.
4. **Oyuncu deneyi:** 15–25 gönüllü, her mod ve gecikme kombinasyonunu kısa oturumlarla oynar (sıralama dengelenir); her oturumdan sonra kısa memnuniyet anketi doldurulur.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Algılanan tepki süresi | Tuşa basma ile karakterin hareket etmesi arası süre | Oyun içi ölçüm |
| Düzeltme sayısı | Tahmin yanlış çıktığı için karakterin konumu kaç kez düzeltildi? | Oyun içi sayaç |
| İsabet tutarsızlığı | Oyuncunun isabet ettiğini gördüğü ama sayılmayan atışlar | Kayıt analizi |
| Oyuncu memnuniyeti | Oyun ne kadar akıcı hissettirdi? | 1–7 ölçeği |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Netcode** | Çok oyunculu oyunlarda oyuncular arası senkronizasyonu sağlayan ağ kodu |
| **Gecikme** (ping) | Verinin oyuncudan sunucuya gidip dönmesi için geçen süre |
| **Yetkili sunucu** | Oyunun gerçek durumunun sunucuda tutulduğu, istemcilerin yalnızca girdi gönderdiği mimari |
| **İstemci tahmini** | Sunucunun cevabını beklemeden oyuncunun kendi hareketini hemen ekranda göstermek |
| **Ara değerleme** (interpolation) | Diğer oyuncuları iki bilinen konum arasında yumuşakça hareket ettirmek |
| **Geri sarma** (rollback) | Geç gelen bir girdi fark edilince oyunu o ana geri sarıp yeniden hesaplamak |
| **Tick hızı** | Sunucunun oyun durumunu saniyede kaç kez güncellediği |
| **Deterministik simülasyon** | Aynı girdilerle her bilgisayarda birebir aynı sonucu veren oyun mantığı |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, netcode kaynaklarını oku |
| 1–3 | Keşif (K1) | Oyun mekaniği, yetkili sunucu, baseline mod, yapay gecikme |
| 4–6 | Geliştirme | **MVP:** istemci tahminli, gecikme altında oynanabilir çok oyunculu oyun |
| 7–8 | Geliştirme (K2) | Ara değerleme ve geri sarma modları, ölçüm altyapısı; ara değerlendirme |
| 9–11 | Tamamlama | Teknik ölçümler ve oyuncu deneyi |
| 12–13 | Tamamlama | Analiz, belgeler |
| 14 | Sonuç (K3) | Teknik rapor ve oynanabilir demo |

## Başlamadan önce

**Bilmen iyi olur:** TypeScript veya C#, temel ağ kavramları, oyun döngüsü mantığı.
**Öğreneceklerin:** Dağıtık sistemler, gerçek zamanlı ağ programlama, oyun mimarisi, kullanıcı deneyi.
**Önerilen teknolojiler:** TypeScript + Node.js + WebSocket (veya WebRTC veri kanalları), Phaser veya Canvas; alternatif olarak Godot.

## Dikkat!

- Geri sarma için oyun mantığının deterministik olması gerekir; kayan nokta farkları ve rastgelelik sorun çıkarır.
- Yapay gecikmeyi tutarlı uygula; yerel ağda yapılan testler gerçek interneti tam yansıtmaz.
- Oyuncu deneyinde oyuncuların hangi modda oynadığını bilmemesi sonuçları daha güvenilir yapar.

## Projeyi genişletme fikirleri

- [PacketLab](26-packetlab.md) ile gerçekçi ağ profilleri üzerinde test
- Hile önleme: istemciden gelen hareketlerin sunucuda doğrulanması
- Mobil bağlantılarda deneme

## Kaynaklar

- Gabriel Gambetta — [*Fast-Paced Multiplayer*](https://www.gabrielgambetta.com/client-server-game-architecture.html)
- Glenn Fiedler — [*Networking for Game Programmers*](https://gafferongames.com/)
- Valve — [*Source Multiplayer Networking*](https://developer.valvesoftware.com/wiki/Source_Multiplayer_Networking)
- [GGPO](https://www.ggpo.net/) — geri sarma netcode kütüphanesi
