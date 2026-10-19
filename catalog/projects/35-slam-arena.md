# 35 · SLAM Arena

> **Alan:** I. Robotik ve otonom sistemler · **Zorluk:** İleri · **Tür:** Deneysel araştırma · **Ekip:** 2–3 kişi · **MVP:** 5–6 hafta

## Basitçe anlatalım

Gözleri bağlı olarak hiç bilmediğin bir eve bırakıldığını düşün. Eline bir el feneri veriliyor ve evin haritasını çıkarman isteniyor. Bir yandan yürüyüp duvarlara bakarak harita çizersin, bir yandan da "şu an haritanın neresindeyim?" diye düşünürsün. Ama sorun şu: nerede olduğunu bilmek için haritaya, haritayı çizmek için nerede olduğunu bilmeye ihtiyacın var. Küçük hatalar birikir ve bir süre sonra aynı odaya döndüğünde haritada iki ayrı oda çizmiş olursun.

Robot süpürgeler, depo robotları ve otonom araçlar bu problemi her gün çözer. Bu probleme **SLAM** denir. SLAM Arena, açık kaynak SLAM yöntemlerini aynı ortamlarda çalıştırıp hangisinin daha doğru harita çıkardığını ve robotun konumunu ne kadar iyi takip ettiğini ölçer.

**Tek cümleyle:** 2D lidar kullanan açık kaynak SLAM yöntemlerini simülasyon ve hazır veri kümeleri üzerinde harita doğruluğu, konum hatası ve hesaplama yükü açısından karşılaştıran bir araştırma projesi.

## Problem

SLAM, mobil robotların bilinmeyen ortamlarda çalışabilmesinin temelidir. ROS ekosisteminde birden fazla hazır SLAM paketi bulunur ama hangisinin hangi ortamda (uzun koridor, geniş salon, tekrarlayan yapılar) daha iyi çalıştığı, ayarlarının sonucu nasıl etkilediği ve ne kadar hesaplama gücü gerektirdiği konusunda öğrenciler için anlaşılır karşılaştırmalar azdır.

## Ne geliştirilecek?

- Gazebo'da farklı türde test ortamları: ofis, uzun koridor, geniş salon, tekrarlayan raflı depo
- Aynı robot ve sensör ayarlarıyla farklı SLAM paketlerini otomatik çalıştıran **deney düzeneği**
- Üretilen haritayı gerçek haritayla karşılaştıran ve konum hatasını hesaplayan **değerlendirme araçları**
- Sonuçları özetleyen rapor ve grafikler

## Araştırma sorusu

> 2D lidar tabanlı SLAM yöntemleri (ör. slam_toolbox, Cartographer, GMapping), farklı ortam türlerinde harita doğruluğu, konum takip hatası ve işlemci kullanımı açısından nasıl karşılaştırılır? Sensör gürültüsü arttıkça bu sıralama değişir mi?

## Deney tasarımı

1. **Ortamlar:** Gazebo'da 4 ortam; ayrıca karşılaştırma için açık bir gerçek dünya lidar veri kümesi.
2. **Yöntemler:** Sadece tekerlek odometrisiyle harita çıkarma — baseline; slam_toolbox, Cartographer ve GMapping (ROS 2 desteği durumuna göre).
3. Robot her ortamda aynı rotayı izler (kayıtlı rota dosyası ile); her deney 5 kez tekrarlanır.
4. Lidar gürültüsü ve odometri hatası kademeli olarak artırılır.
5. Konum hatası (gerçek konum simülasyondan bilinir), harita benzerliği, işlemci ve bellek kullanımı ölçülür.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Mutlak konum hatası (ATE) | Robotun tahmini konumu gerçek konumdan ne kadar uzak? | Simülasyondaki gerçek konumla karşılaştırma |
| Harita doğruluğu | Çıkarılan harita gerçek haritaya ne kadar benziyor? | Izgara karşılaştırması |
| İşlemci kullanımı | Yöntem ne kadar hesaplama gücü harcıyor? | CPU yüzdesi |
| Döngü kapatma başarısı | Aynı yere dönüldüğünde harita düzeltilebildi mi? | Gözlem + metrik |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **SLAM** | Eşzamanlı konum belirleme ve haritalama |
| **Lidar** | Lazer ışınlarıyla çevredeki nesnelere olan uzaklığı ölçen sensör |
| **Odometri** | Tekerleklerin dönüşünden robotun ne kadar yol aldığını tahmin etme |
| **Kayma** (drift) | Küçük ölçüm hatalarının zamanla birikerek büyümesi |
| **Döngü kapatma** (loop closure) | Robotun daha önce geldiği bir yeri tanıyıp birikmiş hatayı düzeltmesi |
| **Çizge tabanlı SLAM** | Robotun konumlarını ve aralarındaki ilişkileri bir ağ olarak tutup birlikte düzelten yöntem |
| **Parçacık filtresi** | Robotun olası konumlarını birçok tahminle temsil edip zamanla güncelleyen yöntem |
| **ATE** | Tahmin edilen rota ile gerçek rota arasındaki ortalama fark |
| **rosbag** | ROS'ta sensör verilerini kaydedip sonradan tekrar oynatmaya yarayan dosya |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, SLAM temellerini oku, ROS 2 kurulumu |
| 1–3 | Keşif (K1) | Gazebo ortamları, robot modeli, odometri baseline'ı, ilk SLAM paketi |
| 4–6 | Geliştirme | **MVP:** bir ortamda iki SLAM yöntemini çalıştırıp konum hatasını hesaplayan düzenek |
| 7–8 | Geliştirme (K2) | Tüm yöntemler ve ortamlar, otomatik deney betikleri; ara değerlendirme |
| 9–11 | Tamamlama | Gürültü deneyleri, gerçek veri kümesiyle karşılaştırma |
| 12–13 | Tamamlama | Analiz, kurulum ve kullanım belgeleri |
| 14 | Sonuç (K3) | Teknik rapor ve tekrar üretilebilir deney paketi |

## Başlamadan önce

**Bilmen iyi olur:** Linux, Python veya C++, temel olasılık ve lineer cebir.
**Öğreneceklerin:** ROS 2, robot simülasyonu, sensör füzyonu, olasılıksal robotik, deney otomasyonu.
**Önerilen teknolojiler:** ROS 2 (Humble veya Jazzy), Gazebo, slam_toolbox, Cartographer, evo (konum hatası değerlendirme aracı).

## Dikkat!

- ROS 2 ve Gazebo sürümlerinin uyumunu baştan kontrol et; uyumsuz sürümler çok zaman kaybettirir.
- Bazı SLAM paketlerinin ROS 2 desteği sınırlı olabilir; seçimini kurulumla doğruladıktan sonra kesinleştir.
- Simülasyon sonuçları gerçek dünyayı tam yansıtmaz; gerçek veri kümesi karşılaştırmasını atlama.

## Projeyi genişletme fikirleri

- Kamera tabanlı (görsel) SLAM ile karşılaştırma
- Gerçek bir robot (ör. TurtleBot) ile kampüste harita çıkarma
- [PathBench](33-pathbench.md) ile birleşerek haritalama + yol planlama

## Kaynaklar

- Thrun, Burgard & Fox — *Probabilistic Robotics*
- [slam_toolbox](https://github.com/SteveMacenski/slam_toolbox)
- [evo](https://github.com/MichaelGrupp/evo) — rota değerlendirme aracı
- [Nav2 belgeleri](https://docs.nav2.org/)
