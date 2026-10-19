# 33 · PathBench

> **Alan:** I. Robotik ve otonom sistemler · **Zorluk:** Orta · **Tür:** Deneysel araştırma + simülatör · **Ekip:** 2 kişi · **MVP:** 4–5 hafta

## Basitçe anlatalım

Bir alışveriş merkezinde bir mağazadan diğerine gitmek istiyorsun. Arada duvarlar, merdivenler, kalabalık var. Kimi insan haritaya bakıp en kısa yolu hesaplar, kimi rastgele koridorlara girip "buradan geçilebiliyor mu?" diye dener, kimi de önce birkaç işaret noktası belirleyip bunları birleştirir. Hepsi sonunda varır ama biri daha hızlı karar verir, biri daha kısa yol bulur.

Robotlar da bir yerden bir yere giderken aynı soruyu çözer: engellere çarpmadan, mümkün olduğunca kısa ve güvenli bir yol. PathBench, robot **yol planlama** algoritmalarını aynı haritalarda, aynı kurallarla yarıştıran bir test ortamı. Hangi algoritma dar koridorlarda iyi, hangisi geniş ve dağınık alanlarda?

**Tek cümleyle:** Robot yol planlama algoritmalarını (A*, RRT, PRM ve türevleri) farklı ortam türlerinde yol kalitesi, hesaplama süresi ve başarı oranı açısından karşılaştıran bir test ortamı.

## Problem

Yol planlama, mobil robotlardan robot kollarına, otonom araçlardan depo robotlarına kadar her otonom sistemin temel problemidir. Literatürde onlarca algoritma vardır ve her biri farklı ortamlarda farklı davranır. Öğrenciler genellikle tek bir algoritmayı tek bir haritada dener; farklı ortam türlerinde sistematik bir karşılaştırma nadiren yapılır.

## Ne geliştirilecek?

- 2D harita üzerinde çalışan **yol planlama kütüphanesi**: A*, Dijkstra, RRT, RRT*, PRM
- Farklı türde haritalar üreten **harita üreteci**: dar koridorlu, labirent, dağınık engelli, açık alan
- Bulunan yolu yumuşatan ve robotun takip edebileceği hale getiren modül
- Algoritmaların arama sürecini adım adım gösteren **görselleştirme**
- İsteğe bağlı: ROS 2 + Gazebo simülasyonunda gerçek robot modeliyle doğrulama

## Araştırma sorusu

> Izgara tabanlı (A*) ve örnekleme tabanlı (RRT, PRM) yol planlama algoritmaları, farklı engel yoğunluğu ve dar geçit içeren ortamlarda yol uzunluğu, hesaplama süresi ve başarı oranı açısından nasıl karşılaştırılır?

## Deney tasarımı

1. **Haritalar:** 4 ortam türünden her biri için 50'şer rastgele harita, farklı boyutlarda (100×100 – 1000×1000).
2. **Algoritmalar:** Dijkstra — baseline; A*, RRT, RRT*, PRM.
3. Her harita için rastgele başlangıç ve hedef noktaları; örnekleme tabanlı yöntemler için her denemeyi farklı rastgele tohumla 10 kez tekrarla.
4. Yol uzunluğu (en kısa yola oranı), planlama süresi, bellek kullanımı ve başarı oranı ölç.
5. Seçilen birkaç senaryoyu Gazebo'da robot modeliyle çalıştırıp yolun takip edilebilirliğini kontrol et.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Yol kalitesi | Bulunan yol en kısa yoldan ne kadar uzun? | Dijkstra sonucuna oran |
| Planlama süresi | Yol ne kadar sürede bulundu? | Milisaniye |
| Başarı oranı | Yol var olduğu hâlde bulunabildi mi? | Başarılı deneme yüzdesi |
| Yol düzgünlüğü | Yolda kaç keskin dönüş var? | Toplam açı değişimi |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Yol planlama** | Robotun başlangıçtan hedefe engellere çarpmadan nasıl gideceğini hesaplama |
| **Izgara haritası** (occupancy grid) | Ortamı küçük karelere bölüp her karenin dolu mu boş mu olduğunu tutan harita |
| **A*** | Hedefe olan tahmini uzaklığı kullanarak aramayı hedefe yönlendiren en kısa yol algoritması |
| **Sezgisel fonksiyon** (heuristic) | Hedefe ne kadar kaldığını tahmin eden hesap |
| **RRT** | Rastgele noktalara doğru dallanan bir ağaç büyüterek yol arayan algoritma |
| **PRM** | Haritaya rastgele noktalar serpip bunları birbirine bağlayarak yol ağı kuran algoritma |
| **Dar geçit problemi** | Örnekleme tabanlı yöntemlerin dar koridorlardan geçen yolu bulmakta zorlanması |
| **ROS 2** | Robot yazılımı geliştirmek için yaygın kullanılan açık kaynak çatı |
| **Gazebo** | Robotların fiziksel ortamda nasıl davranacağını taklit eden simülatör |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, yol planlama algoritmalarını oku |
| 1–3 | Keşif (K1) | Harita altyapısı, Dijkstra ve A*, harita üreteci |
| 4–5 | Geliştirme | **MVP:** 3 algoritmayı aynı haritalarda karşılaştıran CLI + görselleştirme |
| 6–8 | Geliştirme (K2) | RRT*, PRM, yol yumuşatma; ara değerlendirme |
| 9–11 | Tamamlama | Tam deney matrisi, sonuç analizi |
| 12–13 | Tamamlama | Gazebo doğrulaması, belgeler |
| 14 | Sonuç (K3) | Teknik rapor: "Hangi ortamda hangi algoritma?" |

## Başlamadan önce

**Bilmen iyi olur:** Python veya C++, veri yapıları (öncelik kuyruğu, çizge), temel geometri.
**Öğreneceklerin:** Robotik algoritmalar, arama algoritmaları, simülasyon, ROS 2 temelleri, deney tasarımı.
**Önerilen teknolojiler:** Python (NumPy, matplotlib), isteğe bağlı C++; ROS 2 Humble/Jazzy ve Gazebo.

## Dikkat!

- Örnekleme tabanlı algoritmalar rastgeledir; tek bir denemeye bakarak sonuç çıkarma, tekrarlı ölçüm yap.
- Izgara çözünürlüğü sonuçları doğrudan etkiler; tüm algoritmalar için aynı çözünürlüğü kullan.
- ROS 2 kurulumu zaman alabilir; simülasyonu projenin sonuna ek doğrulama olarak bırak.

## Projeyi genişletme fikirleri

- Hareketli engeller içeren dinamik ortamlar
- 3D yol planlama (dron)
- Gerçek bir küçük mobil robotta deneme

## Kaynaklar

- LaValle — [*Planning Algorithms*](https://lavalle.pl/planning/) (ücretsiz çevrimiçi kitap)
- Karaman & Frazzoli (2011) — *Sampling-based algorithms for optimal motion planning* (RRT*)
- [PythonRobotics](https://github.com/AtsushiSakai/PythonRobotics)
- [ROS 2 belgeleri](https://docs.ros.org/)
