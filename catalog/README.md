# Project Lab Proje Kataloğu

> **15 mühendislik alanı · 60 proje · her biri tek başına okunup anlaşılabilecek şekilde yazıldı.**

Bu katalog, Project Lab'e katılan stajyerlerin "ne yapabilirim?" sorusuna cevap bulması için hazırlandı. Her proje sayfası, daha önce o konuda hiç çalışmamış birinin bile okuyup projeyi anlayabileceği şekilde yazıldı.

TechOps'un proje üretimini tek bir teknolojiye, IEEE Hub'a veya mevcut ekip yöneticilerinin uzmanlıklarına bağlamıyoruz. Amacımız öğrencilere farklı mühendislik disiplinlerini deneyebilecekleri, araştırma yapabilecekleri ve gerçek ürün çıkarabilecekleri bir ortam sağlamak.

---

## Bir proje sayfası nasıl okunur?

Her sayfa aynı sırayla ilerler. Sadece ilk iki bölümü okuyarak projenin ne olduğunu anlayabilirsin; geri kalanı projeyi seçersen işine yarar.

| Bölüm | Ne anlatır? |
| --- | --- |
| **Basitçe anlatalım** | Hiç teknik terim kullanmadan, günlük hayattan bir benzetmeyle proje |
| **Problem** | Gerçek hayatta ne sorun var, kim yaşıyor? |
| **Ne geliştirilecek?** | Ortaya çıkacak ürün veya araç |
| **Araştırma sorusu** | Projenin cevaplamaya çalıştığı soru |
| **Deney tasarımı** | Soruyu nasıl test edeceğiz? |
| **Başarı ölçütleri** | Neyi, nasıl ölçeceğiz? |
| **Teknik terimler** | Sayfada geçen her teknik kelimenin sade açıklaması |
| **14 haftalık plan** | Haftalara bölünmüş yol haritası |
| **Başlamadan önce** | Bilmen gerekenler ve öğreneceklerin |
| **Dikkat!** | Sık yapılan hatalar ve tuzaklar |
| **Kaynaklar** | Okuma ve araç önerileri |

Sayfalarda geçen genel terimler (baseline, MVP, precision, p95 vb.) için [Sözlük](glossary.md) sayfasına bak.

---

## Tüm projeler

### A. Web teknolojileri ve tarayıcı mühendisliği
Frontend geliştirmeyi yalnızca React bileşenleri yazmaktan çıkarıp tarayıcı davranışlarını araştırmaya dönüştüren projeler.

| # | Proje | Kısaca | Zorluk |
| --- | --- | --- | --- |
| 01 | [OfflineForms](projects/01-offlineforms.md) | İnternet kesilince veri kaybetmeyen formlar | Orta |
| 02 | [WebPerf Clinic](projects/02-webperf-clinic.md) | Siteyi yavaşlatan kaynakları bulan analiz aracı | Başlangıç–Orta |
| 03 | [Browser ImageLab](projects/03-browser-imagelab.md) | Tamamen tarayıcıda çalışan görüntü sıkıştırma | Orta |
| 04 | [GreenWeb Lab](projects/04-greenweb-lab.md) | Az kaynak tüketen web arayüzleri | Orta |

### B. Backend, API ve dağıtık sistemler
Görsel açıdan basit olabilecek fakat ciddi mühendislik problemlerini çözmeye çalışan projeler.

| # | Proje | Kısaca | Zorluk |
| --- | --- | --- | --- |
| 05 | [RetryLab](projects/05-retrylab.md) | Tekrar gönderilen isteklerde çift kayıt oluşmasını önleme | Orta |
| 06 | [API Contract Guard](projects/06-api-contract-guard.md) | API güncellemesi istemcileri bozar mı? | Orta |
| 07 | [QueueSense](projects/07-queuesense.md) | Kuyruk algoritmalarını karşılaştıran simülatör | Orta |
| 08 | [FairRate](projects/08-fairrate.md) | Adil istek sınırlama kütüphanesi | Orta–İleri |

### C. Yazılım mühendisliği ve geliştirici araçları
Stajyerlerin diğer geliştiricilere fayda sağlayan araçlar ürettiği projeler.

| # | Proje | Kısaca | Zorluk |
| --- | --- | --- | --- |
| 09 | [FlakyTest Detective](projects/09-flakytest-detective.md) | Bazen geçip bazen kalan testleri bulma | Orta |
| 10 | [ChangeImpact](projects/10-changeimpact.md) | Bir değişiklik neyi etkiler? | Orta–İleri |
| 11 | [SchemaSafe](projects/11-schemasafe.md) | Veritabanı değişikliklerini güvenle prova etme | Orta |
| 12 | [MutationLab](projects/12-mutationlab.md) | Testler gerçekten hata yakalıyor mu? | Orta–İleri |

### D. Siber güvenlik ve mahremiyet mühendisliği
Yalnızca saldırı araçları değil, geliştiricilerin güvenli uygulamalar oluşturmasına yardımcı olan araçlar.

| # | Proje | Kısaca | Zorluk |
| --- | --- | --- | --- |
| 13 | [AccessGraph](projects/13-accessgraph.md) | Kim neye erişebiliyor? Haritası ve testi | Orta |
| 14 | [SecretGuard](projects/14-secretguard.md) | Kodda unutulan şifreleri bulma | Orta |
| 15 | [PrivacyMetrics](projects/15-privacymetrics.md) | Kişileri izlemeden istatistik üretme | Orta–İleri |
| 16 | [AuthExperience Lab](projects/16-authexperience-lab.md) | Passkey, parola ve kod ile girişi karşılaştırma | Orta |

### E. Veri mühendisliği ve uygulamalı yapay zekâ
Yapay zekâ bir amaç değil, uygun olduğu durumlarda kullanılan bir yöntem.

| # | Proje | Kısaca | Zorluk |
| --- | --- | --- | --- |
| 17 | [DataDoctor](projects/17-datadoctor.md) | Veri kümelerindeki hatalı kayıtları bulma | Başlangıç–Orta |
| 18 | [SourceCheck](projects/18-sourcecheck.md) | Yapay zekâ cevaplarını kaynaklarla doğrulama | İleri |
| 19 | [OpenData Fusion](projects/19-opendata-fusion.md) | Farklı açık verileri tek şemada birleştirme | Orta |
| 20 | [ForecastArena](projects/20-forecastarena.md) | Tahmin algoritmalarının adil yarışı | Orta |

### F. İnsan-bilgisayar etkileşimi (HCI) ve erişilebilirlik
Kullanıcı deneyimini bilimsel olarak inceleyen, gerçek kullanıcılarla test yapılabilen projeler.

| # | Proje | Kısaca | Zorluk |
| --- | --- | --- | --- |
| 21 | [AccessJourney](projects/21-accessjourney.md) | Otomatik erişilebilirlik testleri neyi kaçırıyor? | Orta |
| 22 | [PlainSpeak](projects/22-plainspeak.md) | Karmaşık metinleri anlaşılır yapma deneyleri | Başlangıç–Orta |
| 23 | [KeyboardFirst](projects/23-keyboardfirst.md) | Tamamen klavyeyle kullanılabilen bileşenler | Orta |
| 24 | [AccessibleViz](projects/24-accessibleviz.md) | Herkesin okuyabildiği grafikler | Orta |

### G. İşletim sistemleri, ağlar ve bilgisayar altyapısı
Web uygulamalarının dışında kalan, bilgisayar mühendisliğinin temel alanları.

| # | Proje | Kısaca | Zorluk |
| --- | --- | --- | --- |
| 25 | [CacheLab](projects/25-cachelab.md) | Önbellek algoritmalarının yarışı | Orta |
| 26 | [PacketLab](projects/26-packetlab.md) | Kötü internet bağlantısı uygulamaları nasıl etkiler? | Orta |
| 27 | [Scheduler Playground](projects/27-scheduler-playground.md) | İşlemci sıralama algoritmalarını görselleştirme | Başlangıç–Orta |
| 28 | [DeltaSync](projects/28-deltasync.md) | Dosyanın sadece değişen kısmını gönderme | Orta–İleri |

### H. Bilgisayar grafikleri, yaratıcı yazılım ve etkileşimli sistemler
Her proje bir yönetim paneli veya API olmak zorunda değil.

| # | Proje | Kısaca | Zorluk |
| --- | --- | --- | --- |
| 29 | [Generative Canvas](projects/29-generative-canvas.md) | Matematikten sanat üreten uygulama | Başlangıç–Orta |
| 30 | [ProceduralWorld](projects/30-proceduralworld.md) | Tek bir sayıdan oyun haritası üretme | Orta |
| 31 | [AdaptivePuzzle](projects/31-adaptivepuzzle.md) | Oyuncuya göre zorlaşan bulmaca | Orta |
| 32 | [VisualCompute](projects/32-visualcompute.md) | Tarayıcıda GPU ile hesaplama laboratuvarı | İleri |

### I. Robotik ve otonom sistemler
Simülasyon ve düşük maliyetli donanımla yürütülebilen robotik projeleri.

| # | Proje | Kısaca | Zorluk |
| --- | --- | --- | --- |
| 33 | [PathBench](projects/33-pathbench.md) | Robot yol planlama algoritmalarının karşılaştırması | Orta |
| 34 | [LineFollower Lab](projects/34-linefollower-lab.md) | Çizgi izleyen robotta kontrol yöntemleri | Başlangıç–Orta |
| 35 | [SLAM Arena](projects/35-slam-arena.md) | Haritalama ve konum belirleme yöntemlerinin karşılaştırması | İleri |
| 36 | [SwarmSim](projects/36-swarmsim.md) | Robot sürüsü davranışlarının simülasyonu | Orta |

### J. Gömülü sistemler ve nesnelerin interneti
Sensörler, mikrodenetleyiciler ve kablosuz cihazlar üzerine projeler.

| # | Proje | Kısaca | Zorluk |
| --- | --- | --- | --- |
| 37 | [LowPower Node](projects/37-lowpower-node.md) | Pille çalışan sensörlerde enerji tasarrufu | Orta |
| 38 | [CampusAir](projects/38-campusair.md) | Düşük maliyetli hava kalitesi sensör ağı ve kalibrasyonu | Orta |
| 39 | [TinyML Bench](projects/39-tinyml-bench.md) | Mikrodenetleyicide çalışan yapay zekâ modelleri | İleri |
| 40 | [OTASafe](projects/40-otasafe.md) | Kesintiye dayanıklı kablosuz yazılım güncellemesi | Orta–İleri |

### K. Bilgisayarlı görü
Görüntülerden bilgi çıkaran ve bunu ölçülebilir şekilde değerlendiren projeler.

| # | Proje | Kısaca | Zorluk |
| --- | --- | --- | --- |
| 41 | [DocScan](projects/41-docscan.md) | Telefon fotoğrafından belge tarama | Başlangıç–Orta |
| 42 | [OccupancySense](projects/42-occupancysense.md) | Kimseyi tanımadan doluluk ölçümü | Orta |
| 43 | [RobustVision](projects/43-robustvision.md) | Görüntü modellerinin bozulmalara dayanıklılığı | Orta |
| 44 | [SignSpell](projects/44-signspell.md) | Türk İşaret Dili parmak alfabesi tanıma | Orta–İleri |

### L. Oyun teknolojileri
Oyun geliştirmenin ağ, yapay zekâ, fizik ve oyuncu deneyimi boyutları.

| # | Proje | Kısaca | Zorluk |
| --- | --- | --- | --- |
| 45 | [NetcodeLab](projects/45-netcodelab.md) | Çok oyunculu oyunlarda gecikme telafisi | İleri |
| 46 | [GameAI Arena](projects/46-gameai-arena.md) | Oyun yapay zekâsı yöntemlerinin karşılaştırması | Orta |
| 47 | [PhysicsBench](projects/47-physicsbench.md) | Oyun fiziğinde hesaplama yöntemleri | Orta |
| 48 | [PlaytestKit](projects/48-playtestkit.md) | Oyun testi için kayıt ve analiz aracı | Orta |

### M. Programlama dilleri ve derleyici araçları
Programlama dillerinin ve geliştirici araçlarının iç yapısına yönelik projeler.

| # | Proje | Kısaca | Zorluk |
| --- | --- | --- | --- |
| 49 | [MiniLang](projects/49-minilang.md) | Eğitim amaçlı programlama dili ve yorumlayıcı | Orta |
| 50 | [FriendlyErrors](projects/50-friendlyerrors.md) | Yeni başlayanlar için anlaşılır hata mesajları | Başlangıç–Orta |
| 51 | [RegexLab](projects/51-regexlab.md) | Düzenli ifade motorları ve ReDoS tespiti | Orta |
| 52 | [CloneSpotter](projects/52-clonespotter.md) | Kod tekrarı ve benzerlik tespiti | Orta |

### N. Bilimsel hesaplama ve simülasyon
Sayısal yöntemler ve simülasyon ile gerçek dünya sistemlerini modelleyen projeler.

| # | Proje | Kısaca | Zorluk |
| --- | --- | --- | --- |
| 53 | [EpiSim](projects/53-episim.md) | Salgın yayılımında iki modelleme yaklaşımı | Orta |
| 54 | [TrafficFlow](projects/54-trafficflow.md) | Kavşak simülasyonunda sinyal stratejileri | Orta |
| 55 | [ParallelBench](projects/55-parallelbench.md) | Bilimsel hesaplamada paralelleştirme yöntemleri | Orta–İleri |
| 56 | [HeatSolver](projects/56-heatsolver.md) | Isı denkleminin sayısal çözümü | Orta |

### O. Ses, müzik ve dijital sanat teknolojileri
Ses işleme, müzik bilgi erişimi ve fiziksel dijital sanat üretimi.

| # | Proje | Kısaca | Zorluk |
| --- | --- | --- | --- |
| 57 | [BeatTrack](projects/57-beattrack.md) | Müzikte tempo ve vuruş tespiti | Orta |
| 58 | [NoiseClean](projects/58-noiseclean.md) | Konuşma kayıtlarında gürültü azaltma | Orta |
| 59 | [SonicCanvas](projects/59-soniccanvas.md) | Sesi canlı görsele dönüştüren sanat uygulaması | Başlangıç–Orta |
| 60 | [PlotterPath](projects/60-plotterpath.md) | Kalemli çizici için çizim yolu optimizasyonu | Orta |

---

## Hangilerini değerlendirmeliyiz?

Sadece en teknolojik görünen projeleri seçmiyoruz. Projeleri dört amaca göre dengeli açıyoruz:

| Amaç | Güçlü adaylar | Neden? |
| --- | --- | --- |
| **Gerçek ürün geliştirme** | OfflineForms, API Contract Guard, SchemaSafe | Kullanılabilir açık kaynak araçlar üretilebilir |
| **Deneysel araştırma** | FlakyTest Detective, CacheLab, DeltaSync | Sayısal olarak karşılaştırılabilecek yöntemler var |
| **Kullanıcı odaklı araştırma** | AccessJourney, PlainSpeak, AccessibleViz | Kullanıcı deneyleri ve ölçümler yapılabilir |
| **Yaratıcı mühendislik** | ProceduralWorld, AdaptivePuzzle, VisualCompute | Algoritma, grafik ve etkileşim tasarımını birleştirir |

### İlk stajyer dönemi için aday kısa liste

| Proje | Alan | Neden? | MVP |
| --- | --- | --- | --- |
| [**OfflineForms**](projects/01-offlineforms.md) | Web Engineering | Hem IEEE'de kullanılabilir hem de gerçek bir senkronizasyon problemi içerir. | 4–5 hafta · 2 öğrenci |
| [**FlakyTest Detective**](projects/09-flakytest-detective.md) | Software Engineering Research | Açık kaynak araç olarak yayımlanabilir; araştırma yöntemi ve istatistiksel değerlendirme öğretir. | 5–6 hafta · 2 öğrenci |
| [**AccessibleViz**](projects/24-accessibleviz.md) | HCI Research | Gerçek insanlarla test yapılabilen, farklı disiplinleri bir araya getiren bir araştırma. | 4–6 hafta · 2 öğrenci |
| [**ProceduralWorld**](projects/30-proceduralworld.md) | Creative Computing | IEEE'den tamamen bağımsız; algoritma bilgisi geliştirir, demosu eğlencelidir. | 4–6 hafta · 2 öğrenci |

> Bu liste bir öneridir; dönemin projeleri Değerlendirme Kurulu kararıyla kesinleşir.

Bu dört proje birbirinin kopyası değil: birinde web ve senkronizasyon, diğerinde yazılım testleri, üçüncüsünde kullanıcı araştırması, dördüncüsünde bilgisayar grafikleri ve algoritmalar var.

> **MVP süresi ile dönem süresi farkı:** MVP (en küçük çalışan sürüm) 4–6 haftada çıkar. Dönemin kalan haftaları deney, ölçüm, iyileştirme ve teknik rapor içindir. Bkz. [yaşam döngüsü](../docs/lifecycle.md).

---

## Katalog nasıl işler?

Projeleri doğrudan stajyerlerin önüne koyup "birini seçin" demiyoruz.

1. **Oku.** Katalogdan ilgini çeken 2–3 projenin sayfasını oku. Önce "Basitçe anlatalım" bölümleriyle başla.
2. **Brief'i doldur.** Seçtiğin proje için [Project Brief şablonunu](../templates/project-brief.md) ekibinle doldur. Katalogdaki sayfa başlangıç noktasıdır; problemi kendi bağlamına göre daraltabilir veya değiştirebilirsin.
3. **Öner.** Brief'i [proje önerisi](https://github.com/ieeetechops/project-lab/issues/new?template=project-proposal.yml) olarak aç.
4. **Değerlendirme.** Kurul öneriyi [ölçütlere](../docs/evaluation-rubric.md) göre değerlendirir (K0).

### Her ekipten asgari beklenti

- Çalışan bir prototip
- Ölçülebilir bir deney
- Kod incelemesinden geçmiş bir depo
- Teknik rapor

Araştırma tarafında **başarılı sonuç bulamamak da geçerli bir çıktıdır.** Önemli olan nedenini gösterebilmek.

---

## Katalog büyümeye açık

Katalog nihai bir liste değildir. Veri görselleştirme alanındaki projeler hazırlanmaktadır; ilerleyen dönemlerde biyomedikal mühendislik, enerji sistemleri ve kuantum hesaplama gibi alanların da eklenmesi planlanmaktadır.

Yeni bir katalog projesi önermek için [proje sayfası şablonunu](projects/_template.md) kopyalayıp PR aç.
