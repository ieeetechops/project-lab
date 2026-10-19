# 47 · PhysicsBench

> **Alan:** L. Oyun teknolojileri · **Zorluk:** Orta · **Tür:** Deneysel araştırma + simülatör · **Ekip:** 2 kişi · **MVP:** 4–5 hafta

## Basitçe anlatalım

Bir oyunda zıplayan bir topu düşün. Bilgisayar topun hareketini sürekli değil, saniyede 60 kez küçük adımlarla hesaplar: "şu an buradaydı, şu hızla gidiyordu, o halde bir sonraki karede şurada olur." Bu adımlar küçük hatalar içerir. Basit bir hesaplama yöntemi kullanırsan, top her zıplayışında biraz daha yükseğe çıkmaya başlayabilir; sanki hiç yoktan enerji kazanıyormuş gibi. Bir süre sonra oyundaki köprü titremeye, yığılmış kutular kendiliğinden dağılmaya başlar.

PhysicsBench, oyun fiziğinde kullanılan **hesaplama yöntemlerini** karşılaştırır: hangisi daha doğru, hangisi daha hızlı, hangisi karmaşık sahnelerde kararlı kalıyor?

**Tek cümleyle:** Oyun fiziği motorlarında kullanılan sayısal entegrasyon ve çarpışma çözme yöntemlerini doğruluk, kararlılık ve performans açısından karşılaştıran bir simülatör ve deney paketi.

## Problem

Oyunlar ve etkileşimli simülasyonlar fizik hesaplarını sabit ve kısıtlı bir zaman bütçesi içinde yapmak zorundadır. Basit yöntemler hızlıdır ama enerji kazanma, titreme ve nesnelerin birbirinin içinden geçmesi gibi sorunlara yol açar. Daha doğru yöntemler ise daha fazla hesaplama gerektirir. Bu dengeyi görsel ve sayısal olarak gösteren erişilebilir karşılaştırmalar azdır.

## Ne geliştirilecek?

- Tarayıcıda çalışan **2D fizik motoru**: rijit cisimler, yaylar, çarpışma algılama ve çözme
- Değiştirilebilir entegrasyon yöntemleri: açık Euler, yarı örtük Euler, Verlet, RK4
- Standart test sahneleri: sarkaç, yay-kütle sistemi, kutu yığını, ip/köprü, hızlı hareket eden mermi
- Enerji, konum hatası ve kararlılığı gerçek zamanlı grafikle gösteren panel
- Hazır motorlarla (ör. Box2D, Rapier) karşılaştırma modu

## Araştırma sorusu

> Açık Euler, yarı örtük Euler, Verlet ve RK4 yöntemleri; farklı zaman adımlarında ve farklı türde sahnelerde enerji korunumu, kararlılık ve adım başına hesaplama süresi açısından nasıl karşılaştırılır?

## Deney tasarımı

1. **Sahneler:** Analitik çözümü bilinen sahneler (sarkaç, yay-kütle) ve karmaşık sahneler (50 kutuluk yığın, 100 eklemli ip).
2. **Yöntemler:** Açık Euler — baseline; yarı örtük Euler, Verlet, RK4.
3. **Zaman adımı:** 1/30, 1/60, 1/120, 1/240 saniye.
4. Analitik sahnelerde konum hatası ve enerji sapması; karmaşık sahnelerde kararlılık (yığın kaç saniye ayakta kalıyor, ip patlıyor mu) ve adım başına süre ölçülür.
5. Hızlı hareket eden nesnelerde "içinden geçme" (tunneling) oranı sürekli çarpışma algılamayla karşılaştırılır.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Konum hatası | Simülasyon gerçek (analitik) çözümden ne kadar sapıyor? | Ortalama hata |
| Enerji sapması | Sistem zamanla enerji kazanıyor ya da kaybediyor mu? | Toplam enerji değişimi |
| Kararlılık | Karmaşık sahne bozulmadan ne kadar dayanıyor? | Saniye |
| Performans | Bir fizik adımı ne kadar sürüyor? | Milisaniye |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Fizik motoru** | Oyundaki nesnelerin hareketini ve çarpışmalarını hesaplayan yazılım |
| **Sayısal entegrasyon** | Hız ve ivmeden bir sonraki konumu küçük adımlarla hesaplama |
| **Zaman adımı** | Her fizik hesabı arasında geçen süre |
| **Euler yöntemi** | En basit entegrasyon yöntemi; hızlı ama hatalı |
| **Verlet** | Konumları önceki konumlardan hesaplayan, enerjiyi iyi koruyan yöntem |
| **RK4** | Her adımda dört ara hesap yapan, daha doğru ama daha pahalı yöntem |
| **Rijit cisim** | Şekli değişmeyen katı nesne |
| **Tunneling** | Hızlı nesnenin bir adımda duvarın bir yanından diğer yanına geçip çarpışmanın kaçırılması |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, fizik simülasyonu temellerini oku |
| 1–3 | Keşif (K1) | Parçacık ve yay simülasyonu, Euler baseline'ı, analitik sahneler |
| 4–5 | Geliştirme | **MVP:** dört entegrasyon yöntemini canlı karşılaştıran simülatör |
| 6–8 | Geliştirme (K2) | Rijit cisimler, çarpışma çözme, karmaşık sahneler; ara değerlendirme |
| 9–11 | Tamamlama | Tam deney matrisi, hazır motorlarla karşılaştırma |
| 12–13 | Tamamlama | Analiz, etkileşimli eğitim sayfası |
| 14 | Sonuç (K3) | Teknik rapor ve demo |

## Başlamadan önce

**Bilmen iyi olur:** Lise fiziği (hız, ivme, kuvvet), temel vektör hesabı, JavaScript veya C++.
**Öğreneceklerin:** Sayısal yöntemler, fizik simülasyonu, oyun motoru mimarisi, performans ölçümü.
**Önerilen teknolojiler:** TypeScript + Canvas veya C++ + SDL; karşılaştırma için Box2D veya Rapier.

## Dikkat!

- Fizik adımını ekran yenileme hızından ayır (sabit zaman adımı); yoksa sonuçlar bilgisayara göre değişir.
- Karşılaştırmayı adil yap: tüm yöntemlere aynı çarpışma çözme kodunu kullan.
- Rijit cisim çarpışmaları zor bir konudur; önce parçacık ve yaylarla başla.

## Projeyi genişletme fikirleri

- [VisualCompute](32-visualcompute.md) ile GPU üzerinde binlerce parçacık
- Yumuşak cisimler ve kumaş simülasyonu
- Fizik dersi için etkileşimli deney sayfaları

## Kaynaklar

- Glenn Fiedler — [*Integration Basics* ve *Fix Your Timestep!*](https://gafferongames.com/categories/game-physics/)
- Ericson — *Real-Time Collision Detection*
- Erin Catto — [Box2D yayınları](https://box2d.org/publications/)
- [Rapier](https://rapier.rs/)
