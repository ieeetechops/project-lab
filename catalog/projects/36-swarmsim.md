# 36 · SwarmSim

> **Alan:** I. Robotik ve otonom sistemler · **Zorluk:** Orta · **Tür:** Deneysel araştırma + simülatör · **Ekip:** 2 kişi · **MVP:** 4–5 hafta

## Basitçe anlatalım

Bir kuş sürüsünü izlediğinde binlerce kuşun sanki tek bir canlıymış gibi döndüğünü görürsün. Ama sürünün bir lideri yok. Her kuş sadece üç basit kurala uyar: yanındakilere çarpma, onlarla aynı yöne uç, gruptan kopma. Bu basit kurallar bir araya gelince muhteşem bir düzen ortaya çıkar.

Mühendisler bu fikri robotlara uygular: tek bir pahalı robot yerine çok sayıda basit ve ucuz robot, merkezi bir yönetici olmadan birlikte iş yapar. Bir arama-kurtarma bölgesini taramak, tarlayı izlemek ya da depoda yük taşımak gibi. SwarmSim, **robot sürüsü** davranışlarını simüle eden bir ortam. Merak ettiğimiz şey de şu: robot sayısı arttıkça sürü gerçekten daha verimli mi oluyor, yoksa robotlar birbirinin önünü mü kesiyor?

**Tek cümleyle:** Basit kurallarla çalışan robot sürüsü davranışlarını (toplanma, alan tarama, nesne arama) simüle eden ve robot sayısı arttıkça performansın nasıl ölçeklendiğini inceleyen bir simülatör.

## Problem

Sürü robotiği, tek bir robotun arızalanmasının tüm görevi durdurmadığı dayanıklı sistemler vaat eder. Ancak merkezi kontrol olmadan basit kurallardan istenen davranışı elde etmek zordur. Robot sayısı arttıkça iletişim yükü ve sıkışma artar; "daha fazla robot = daha hızlı iş" varsayımı her zaman doğru değildir.

## Ne geliştirilecek?

- Yüzlerce robotu aynı anda çalıştırabilen **2D sürü simülatörü**
- Davranış modülleri: toplanma, dağılma, alan tarama, nesne bulup merkeze taşıma
- Robotların sınırlı algılama mesafesi, gürültülü sensörleri ve arızalanma ihtimali
- Simülasyonu canlı izlemeye ve parametreleri değiştirmeye yarayan arayüz
- Toplu deney çalıştırıp sonuçları kaydeden betikler

## Araştırma sorusu

> Merkezi kontrol olmadan çalışan robot sürülerinde, alan tarama ve nesne toplama görevlerinin tamamlanma süresi robot sayısıyla nasıl ölçeklenir? Robotların bir kısmı arızalandığında sürü performansı ne ölçüde korunur?

## Deney tasarımı

1. **Görevler:** (1) Bir alanın tamamını taramak, (2) alana dağılmış nesneleri bulup merkeze taşımak.
2. **Stratejiler:**
   - (A) Rastgele yürüyüş — baseline
   - (B) Birbirinden uzaklaşma kuralı ile dağılarak tarama
   - (C) İz bırakma (karınca feromonu benzeri) ile koordinasyon
3. **Değişkenler:** Robot sayısı (5, 10, 25, 50, 100, 200), algılama mesafesi, arızalanan robot oranı (%0, %10, %30).
4. Her kombinasyon için 30 tekrar; görev süresi, robot başına verim ve çarpışma sayısı ölçülür.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Görev süresi | Görev ne kadar sürede tamamlandı? | Simülasyon adımı |
| Robot başına verim | Robot sayısı ikiye katlanınca süre yarıya iniyor mu? | Ölçeklenme oranı |
| Dayanıklılık | Robotların bir kısmı arızalanınca performans ne kadar düştü? | Süre karşılaştırması |
| Sıkışma | Robotlar birbirine ne sıklıkla engel oldu? | Çarpışma sayısı |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Sürü robotiği** | Çok sayıda basit robotun lider olmadan birlikte çalışması |
| **Merkezi olmayan kontrol** | Her robotun yalnızca kendi çevresine bakarak karar vermesi |
| **Ortaya çıkan davranış** (emergence) | Basit bireysel kurallardan grup düzeyinde karmaşık davranışın doğması |
| **Boids** | Kuş sürüsü hareketini üç basit kuralla taklit eden klasik model |
| **Stigmerji** | Bireylerin ortama iz bırakıp diğerlerinin bu izden yararlanması (karıncalar) |
| **Ölçeklenebilirlik** | Sistemin büyüdükçe verimini koruyabilmesi |
| **Ajan tabanlı simülasyon** | Her bireyin ayrı ayrı modellendiği simülasyon türü |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, sürü robotiği literatürünü oku |
| 1–3 | Keşif (K1) | Simülatör çekirdeği, robot hareketi, çarpışma, rastgele yürüyüş baseline'ı |
| 4–5 | Geliştirme | **MVP:** alan tarama görevini 3 stratejiyle çalıştıran simülatör |
| 6–8 | Geliştirme (K2) | Nesne toplama görevi, arıza modeli, canlı arayüz; ara değerlendirme |
| 9–11 | Tamamlama | Ölçeklenme ve dayanıklılık deneyleri |
| 12–13 | Tamamlama | Analiz, görselleştirmeler, belgeler |
| 14 | Sonuç (K3) | Teknik rapor ve canlı demo |

## Başlamadan önce

**Bilmen iyi olur:** Python veya JavaScript, temel vektör hesabı.
**Öğreneceklerin:** Çok ajanlı sistemler, simülasyon tasarımı, deney otomasyonu, istatistiksel analiz.
**Önerilen teknolojiler:** Python (NumPy, Mesa veya kendi simülatörün), pygame veya tarayıcıda Canvas; isteğe bağlı ARGoS.

## Dikkat!

- Yüzlerce robotta her robotun diğer herkesi kontrol etmesi çok yavaştır; komşu aramayı ızgara ile hızlandır.
- Simülasyon adımı (zaman çözünürlüğü) sonuçları etkiler; tüm deneylerde sabit tut.
- Gerçek robotlarda iletişim gecikmeleri ve sensör hataları çok daha belirgindir; bu sınırlılığı rapora yaz.

## Projeyi genişletme fikirleri

- Birkaç küçük gerçek robotla (ör. ESP32 tabanlı) doğrulama
- Pekiştirmeli öğrenmeyle sürü kurallarının otomatik bulunması
- Dron sürüleri için 3D sürüm

## Kaynaklar

- Reynolds (1987) — *Flocks, Herds, and Schools: A Distributed Behavioral Model* (Boids)
- Brambilla ve ark. (2013) — *Swarm robotics: a review from the swarm engineering perspective*
- [Mesa](https://mesa.readthedocs.io/) — Python ajan tabanlı modelleme kütüphanesi
- [ARGoS](https://www.argos-sim.info/) — sürü robotiği simülatörü
