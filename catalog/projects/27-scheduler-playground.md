# 27 · Scheduler Playground

> **Alan:** G. İşletim sistemleri ve ağlar · **Zorluk:** Başlangıç–Orta · **Tür:** Eğitim aracı + deneysel araştırma · **Ekip:** 2 kişi · **MVP:** 4 hafta

## Basitçe anlatalım

Bir berber dükkânı düşün, tek bir berber var ve sırada beş kişi bekliyor. Biri sadece sakal tıraşı olacak (5 dakika), biri saç ve sakal (40 dakika), biri çocuk (15 dakika). Berber kimi önce alsın? Gelen sırayla mı? En kısa sürecek işi önce mi? Herkese 10'ar dakika ayırıp sırayla mı? Her seçenek birini mutlu, birini mutsuz eder: kısa işleri öne alırsan uzun işi olan saatlerce bekleyebilir.

Bilgisayarındaki işlemci de bu berber gibidir: aynı anda onlarca program çalışmak ister ama işlemci her an sadece birkaçına bakabilir. Kimin ne zaman çalışacağına karar veren kurala **zamanlama algoritması** denir. Scheduler Playground bu algoritmaları **gözünle görebileceğin** bir oyun alanı: işlerin nasıl sıraya girdiğini, kimin ne kadar beklediğini canlı izleyip algoritmaları karşılaştırabilirsin.

**Tek cümleyle:** CPU zamanlama algoritmalarını görselleştiren ve ortalama bekleme süresi, adalet ve tepki süresi bakımından karşılaştıran bir simülatör.

## Problem

İşletim sistemleri dersinde zamanlama algoritmaları genelde kâğıt üzerinde Gantt şemalarıyla öğretilir. Öğrenciler küçük örnekleri elle çözer ama algoritmaların büyük ölçekte, farklı iş yüklerinde nasıl davrandığını göremez. Mevcut görselleştiriciler ya çok basit ya da güncel algoritmaları (Linux'un kullandığı) içermiyor.

## Ne geliştirilecek?

- Tarayıcıda çalışan, işlerin işlemciye nasıl atandığını **canlı Gantt şemasıyla** gösteren simülatör
- Algoritmalar: FCFS, SJF, SRTF, Round Robin, Priority, MLFQ ve Linux'taki CFS'nin basitleştirilmiş hali
- İş yükü üreteci: kısa etkileşimli işler, uzun hesaplama işleri, karışık
- Aynı iş yükünde algoritmaları **yan yana yarıştıran** karşılaştırma modu
- Ders kitabı alıştırmalarını otomatik kontrol eden "kendini sına" modu

## Araştırma sorusu

> Farklı iş yükü bileşimlerinde (etkileşimli/hesaplama ağırlıklı oranı) zamanlama algoritmaları ortalama bekleme süresi, tepki süresi ve adalet arasında nasıl bir denge kurar? Round Robin'de zaman diliminin seçimi bu dengeyi nasıl değiştirir?

## Deney tasarımı

1. **İş yükleri:** Etkileşimli işlerin oranı %10, %50, %90 olan sentetik yükler; işlerin süreleri farklı dağılımlardan (sabit, üstel, ağır kuyruklu).
2. **Algoritmalar:** FCFS — baseline; SJF, SRTF, Round Robin (farklı zaman dilimleriyle), MLFQ, basitleştirilmiş CFS.
3. Her kombinasyonu birçok rastgele tohumla tekrar et.
4. Ortalama ve en kötü bekleme süresi, tepki süresi, adalet endeksi ve bağlam değiştirme sayısını ölç.
5. **Eğitim boyutu (isteğe bağlı):** Bir grup öğrenci kâğıtla, bir grup simülatörle çalışsın; kısa bir sınavda anlama farkını ölç.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Ortalama bekleme süresi | İşler sırada ortalama ne kadar bekledi? | Simülasyon |
| Tepki süresi | İşin ilk kez çalışmaya başlaması ne kadar sürdü? | Simülasyon |
| Adalet (Jain endeksi) | İşlemci zamanı işler arasında ne kadar eşit dağıldı? (1 = tam eşit) | Formül |
| Bağlam değiştirme sayısı | İşler arasında kaç kez geçiş yapıldı? (her geçişin maliyeti var) | Sayaç |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Süreç** (process) | Çalışan bir program |
| **Zamanlayıcı** (scheduler) | Hangi sürecin ne zaman işlemciyi kullanacağına karar veren işletim sistemi parçası |
| **FCFS** | İlk gelen ilk çalışır |
| **SJF / SRTF** | En kısa işi önce çalıştır / kalan süresi en kısa olanı önce çalıştır |
| **Round Robin** | Herkese sırayla eşit küçük süre ver |
| **Zaman dilimi** (time quantum) | Round Robin'de her sürece verilen süre |
| **MLFQ** | Davranışına göre süreçleri öncelik kuyrukları arasında taşıyan çok seviyeli algoritma |
| **CFS** | Linux'un yıllarca kullandığı, herkese "adil pay" vermeye çalışan zamanlayıcı |
| **Bağlam değiştirme** | İşlemcinin bir süreçten diğerine geçmesi; küçük ama gerçek bir maliyeti var |
| **Açlık** (starvation) | Bir sürecin hiç sıra gelmeden sonsuza kadar beklemesi |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, OSTEP zamanlama bölümlerini oku |
| 1–3 | Keşif (K1) | Simülasyon çekirdeği, FCFS/SJF/RR, birim testleri (ders kitabı örnekleriyle) |
| 4 | Geliştirme | **MVP:** canlı Gantt şemalı web simülatörü |
| 5–8 | Geliştirme (K2) | MLFQ, CFS, karşılaştırma modu; ara değerlendirme |
| 9–11 | Tamamlama | Deney matrisi, (isteğe bağlı) eğitim deneyi |
| 12–13 | Tamamlama | "Kendini sına" modu, belgeler, hocalarla paylaşım |
| 14 | Sonuç (K3) | Teknik rapor ve yayındaki simülatör |

## Başlamadan önce

**Bilmen iyi olur:** JavaScript/TypeScript, temel veri yapıları (kuyruk, öncelik kuyruğu).
**Öğreneceklerin:** İşletim sistemleri, simülasyon, algoritma karşılaştırması, etkileşimli görselleştirme.
**Önerilen teknolojiler:** TypeScript, React veya Svelte, D3 veya Canvas, Vitest.

## Dikkat!

- Simülasyon çekirdeğini arayüzden ayrı yaz; böylece hem test etmesi hem de deney yapması kolaylaşır.
- Ders kitabındaki küçük örnekleri birim testi olarak kullan; simülatörün doğru hesapladığından emin olmanın en iyi yolu bu.
- CFS'nin gerçek hali çok karmaşık; "basitleştirilmiş" olduğunu açıkça belirt.

## Projeyi genişletme fikirleri

- Çok çekirdekli işlemci desteği ve çekirdekler arası yük dengeleme
- Bellek yönetimi ve sayfa değiştirme simülatörü ([CacheLab](25-cachelab.md) ile birleşebilir)
- Üniversitedeki işletim sistemleri dersinde kullanılmak üzere hocalarla iş birliği

## Kaynaklar

- Arpaci-Dusseau — [*Operating Systems: Three Easy Pieces*](https://pages.cs.wisc.edu/~remzi/OSTEP/), bölüm 7–9
- Silberschatz, Galvin & Gagne — *Operating System Concepts*, bölüm 5
- [Linux CFS belgeleri](https://docs.kernel.org/scheduler/sched-design-CFS.html)
- Jain, Chiu & Hawe (1984) — *A Quantitative Measure of Fairness*
