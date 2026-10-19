# 31 · AdaptivePuzzle

> **Alan:** H. Grafik ve yaratıcı yazılım · **Zorluk:** Orta · **Tür:** Yaratıcı mühendislik + kullanıcı araştırması · **Ekip:** 2 kişi · **MVP:** 4–5 hafta

## Basitçe anlatalım

İyi bir öğretmen sınıfa bakar: öğrenciler sıkılmış görünüyorsa biraz daha zor sorular sorar, kafaları karışmışsa bir adım geri gider. Kötü bir öğretmen ise herkese aynı hızda, aynı zorlukta anlatır; bazıları sıkılır, bazıları kaybolur.

Oyunlar da öyledir. Çok kolay bir oyun sıkıcıdır, çok zor bir oyun sinir bozucudur. En keyifli an, oyunun tam senin seviyende olduğu andır. AdaptivePuzzle, oyuncunun nasıl oynadığını izleyip **bulmacaların zorluğunu kendi kendine ayarlayan** bir oyun. Asıl soru şu: bu ayarlama gerçekten oyunu daha keyifli yapıyor mu, yoksa herkese aynı zorluk mu daha iyi?

**Tek cümleyle:** Oyuncunun performansına göre bulmaca zorluğunu ayarlayan ve sabit zorlukla uyarlanabilir zorluğu oyuncu deneyimi açısından karşılaştıran bir oyun.

## Problem

Dinamik zorluk ayarlama (DDA) oyunlarda ve eğitim yazılımlarında giderek yaygınlaşıyor ama her oyuncuda işe yaramıyor: bazı oyuncular "oyun bana acıyor" hissine kapılıp motivasyonunu kaybedebiliyor. Hangi ayarlama yönteminin, hangi oyuncu tipi için ne kadar fayda sağladığı açık bir araştırma konusu. Ayrıca zorluk ayarlamak için önce "bu bulmaca ne kadar zor?" sorusuna cevap verebilmek gerekiyor; bu da başlı başına bir problem.

## Ne geliştirilecek?

- Tarayıcıda oynanan bir **bulmaca oyunu** (ör. kayan blok bulmacası, Sokoban benzeri veya mantık bulmacası)
- Bulmacaları otomatik üreten ve **zorluğunu ölçen** üreteç (çözüm için gereken en az hamle, dallanma sayısı)
- Oyuncunun süresini, hamle sayısını, ipucu kullanımını izleyen **oyuncu modeli**
- Farklı zorluk ayarlama stratejileri ve deney modu
- Anonim oyun verilerini kaydeden altyapı

## Araştırma sorusu

> Oyuncunun performansına göre zorluğu ayarlayan yöntemler, sabit artan zorluğa kıyasla oyuncuların oyunda kalma süresini, başarı oranını ve algılanan keyfi nasıl etkiler?

## Deney tasarımı

1. **Zorluk ölçümü:** Önce üretecin zorluk tahmininin doğru olup olmadığını pilot oyuncularla doğrula (tahmin edilen zorluk ile gerçek çözme süresi uyuşuyor mu?).
2. **Koşullar:**
   - (A) Sabit, önceden belirlenmiş artan zorluk — baseline
   - (B) Kural tabanlı ayarlama: 2 başarı = zorlaşır, 2 başarısızlık = kolaylaşır
   - (C) Hedef başarı oranını (~%70) koruyan model tabanlı ayarlama (ör. Elo benzeri puanlama)
3. **Katılımcılar:** 30–60 gönüllü, rastgele koşullara atanır; her biri 15–20 dakika oynar.
4. Oynama süresi, çözülen bulmaca sayısı, bırakma noktası kaydedilir; sonunda kısa bir oyuncu deneyimi anketi doldurulur.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Oyunda kalma süresi | Oyuncu kendi isteğiyle ne kadar oynadı? | Otomatik kayıt |
| Başarı oranı | Bulmacaların yüzde kaçı çözüldü? | Otomatik kayıt |
| Akış ve keyif | Oyuncu oyunu ne kadar sürükleyici buldu? | Kısa oyuncu deneyimi anketi |
| Zorluk tahmini doğruluğu | Üretecin "zor" dediği bulmacalar gerçekten daha uzun mu sürdü? | Korelasyon |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **DDA** (Dinamik Zorluk Ayarlama) | Oyunun zorluğunu oyuncunun performansına göre otomatik değiştirmesi |
| **Akış** (flow) | Görev ile beceri dengede olduğunda yaşanan, zamanın nasıl geçtiğini unutturan odaklanma hali |
| **Oyuncu modeli** | Oyuncunun becerisini tahmin eden basit hesap |
| **Elo puanı** | Satrançta kullanılan, kazanma/kaybetmeye göre güncellenen beceri puanı; burada oyuncu ve bulmaca birbirine karşı "oynar" |
| **Durum uzayı araması** | Bulmacanın tüm olası hamlelerini deneyerek en kısa çözümü bulmak (BFS, A*) |
| **Dallanma faktörü** | Her adımda kaç farklı hamle yapılabildiği; yüksekse bulmaca genelde daha zordur |
| **Bırakma noktası** | Oyuncunun oyunu bıraktığı an |
| **Gruplar arası tasarım** | Her katılımcının yalnızca bir koşulu deneyimlediği deney düzeni |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, bulmaca türünü seç, DDA literatürünü oku |
| 1–3 | Keşif (K1) | Oyun mekaniği, bulmaca çözücü ve üreteç, zorluk ölçütü |
| 4–5 | Geliştirme | **MVP:** sabit zorlukta oynanabilir oyun + veri kaydı |
| 6–8 | Geliştirme (K2) | Zorluk tahmininin pilot doğrulaması, ayarlama stratejileri; ara değerlendirme |
| 9–11 | Tamamlama | Ana kullanıcı deneyi |
| 12–13 | Tamamlama | Analiz, oyun cilası |
| 14 | Sonuç (K3) | Teknik rapor ve oynanabilir demo |

## Başlamadan önce

**Bilmen iyi olur:** JavaScript/TypeScript, temel arama algoritmaları (BFS).
**Öğreneceklerin:** Oyun tasarımı, arama algoritmaları, kullanıcı modelleme, kullanıcı deneyi ve istatistik.
**Önerilen teknolojiler:** TypeScript + Phaser veya saf Canvas, Firebase veya basit bir backend (veri kaydı), Python (analiz).

## Dikkat!

- Zorluk ayarlamanın işe yaraması için önce "zorluk" ölçütünün doğru olması gerekir; bu adımı atlama.
- Oyuncuların yalnızca ekip arkadaşlarından oluşması sonuçları çarpıtır; farklı bölümlerden katılımcı bul.
- Oyuncu verilerini anonim tut, onam al ve neyin kaydedildiğini oyunun başında açıkça söyle.

## Projeyi genişletme fikirleri

- Aynı yaklaşımı eğitim yazılımında kullanma (ör. programlama alıştırmaları)
- [ProceduralWorld](30-proceduralworld.md) haritalarında uyarlanabilir zorluk
- Oyuncu tipine göre (keşifçi, rekabetçi) farklı ayarlama stratejileri

## Kaynaklar

- Hunicke (2005) — *The Case for Dynamic Difficulty Adjustment in Games* (ACE)
- Csikszentmihalyi — *Flow: The Psychology of Optimal Experience*
- [Red Blob Games: A* ve yol bulma](https://www.redblobgames.com/pathfinding/a-star/introduction.html)
- [Phaser](https://phaser.io/)
