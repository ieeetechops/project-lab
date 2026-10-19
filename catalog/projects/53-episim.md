# 53 · EpiSim

> **Alan:** N. Bilimsel hesaplama ve simülasyon · **Zorluk:** Orta · **Tür:** Deneysel araştırma + simülatör · **Ekip:** 2 kişi · **MVP:** 4–5 hafta

## Basitçe anlatalım

Bir sınıfta bir öğrenci grip olduğunu düşün. Ertesi gün yanında oturan iki kişi hastalanıyor, onlar da kendi arkadaşlarına bulaştırıyor. Bir hafta sonra sınıfın yarısı hasta mı olur, yoksa hastalık kendiliğinden söner mi? Bu, kaç kişinin birbiriyle ne kadar temas ettiğine bağlı.

Bilim insanları salgınları iki farklı yolla modeller. Birincisinde insanları "sağlıklı", "hasta", "iyileşmiş" diye üç büyük gruba ayırır ve gruplar arası geçişi formüllerle hesaplar. İkincisinde her kişiyi ayrı ayrı modeller: kim kiminle, nerede, ne zaman karşılaşıyor. EpiSim bu **iki modelleme yaklaşımını** karşılaştırır: basit formüller ne zaman yeterli, ne zaman kişi kişi modellemek gerekiyor?

**Tek cümleyle:** Bulaşıcı hastalık yayılımını diferansiyel denklem tabanlı bölmeli modeller ve ajan tabanlı modellerle simüle eden ve iki yaklaşımın hangi koşullarda farklı sonuçlar verdiğini inceleyen bir proje.

## Problem

Bölmeli modeller (SIR) hızlı ve anlaşılırdır ama herkesin herkesle eşit olasılıkla karşılaştığını varsayar. Gerçekte insanlar sınıflar, evler, iş yerleri gibi kümeler halinde etkileşir. Ajan tabanlı modeller bu yapıyı yakalayabilir ama hesaplama açısından pahalıdır ve çok sayıda varsayım gerektirir. Hangi durumda hangisinin tercih edilmesi gerektiği önemli bir modelleme sorusudur.

## Ne geliştirilecek?

- SIR ve SEIR modellerini çözen **diferansiyel denklem çözücüsü**
- Kişileri, temas ağlarını (ev, okul, iş) ve günlük hareketleri modelleyen **ajan tabanlı simülatör**
- Aşılama, maske, okul kapatma gibi müdahaleleri her iki modelde uygulayabilen senaryo modülü
- Sonuçları karşılaştırmalı grafiklerle gösteren etkileşimli arayüz

## Araştırma sorusu

> Bölmeli diferansiyel denklem modelleri ile ajan tabanlı modeller; temas ağı yapısı (rastgele karışım, kümelenmiş, birkaç çok bağlantılı kişi) değiştikçe salgın büyüklüğü, zirve zamanı ve müdahale etkinliği tahminlerinde ne ölçüde ayrışır?

## Deney tasarımı

1. **Modeller:**
   - (A) SIR diferansiyel denklem modeli — baseline
   - (B) Rastgele karışımlı ajan tabanlı model (SIR ile aynı sonucu vermesi beklenir; doğrulama için)
   - (C) Kümelenmiş temas ağlı ajan tabanlı model
   - (D) Ağır kuyruklu (birkaç kişinin çok fazla teması olan) ağ modeli
2. Tüm modeller aynı temel bulaşma ve iyileşme parametreleriyle kalibre edilir.
3. **Müdahaleler:** Rastgele aşılama, en çok temaslı kişileri aşılama, temas azaltma.
4. Her ajan tabanlı senaryo farklı rastgele tohumlarla 100 kez çalıştırılır; toplam vaka, zirve zamanı ve zirve yüksekliği karşılaştırılır.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Salgın büyüklüğü | Toplamda nüfusun yüzde kaçı hastalandı? | Simülasyon sonucu |
| Zirve zamanı ve yüksekliği | En çok hastanın aynı anda olduğu gün ve sayı | Simülasyon sonucu |
| Müdahale etkisi | Müdahale toplam vakayı ne kadar azalttı? | Karşılaştırma |
| Hesaplama maliyeti | Bir simülasyon ne kadar sürüyor? | Saniye |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **SIR modeli** | Nüfusu Duyarlı (S), Enfekte (I) ve İyileşmiş (R) gruplara ayıran salgın modeli |
| **Diferansiyel denklem** | Bir büyüklüğün zamanla nasıl değiştiğini tanımlayan denklem |
| **R₀** | Bir hastanın tamamen duyarlı bir toplumda ortalama kaç kişiye bulaştırdığı |
| **Ajan tabanlı model** | Her bireyin ayrı ayrı simüle edildiği model |
| **Temas ağı** | Kimin kiminle temas ettiğini gösteren ağ |
| **Kümelenme** | Arkadaşlarının da birbirinin arkadaşı olma eğilimi |
| **Sürü bağışıklığı** | Yeterli sayıda kişi bağışık olduğunda salgının kendiliğinden sönmesi |
| **Stokastik** | Rastgelelik içeren; her çalıştırmada biraz farklı sonuç veren |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, salgın modellemesi temellerini oku |
| 1–3 | Keşif (K1) | SIR/SEIR çözücü, basit ajan tabanlı model, karşılıklı doğrulama |
| 4–5 | Geliştirme | **MVP:** iki modeli aynı parametrelerle çalıştırıp karşılaştıran araç |
| 6–8 | Geliştirme (K2) | Temas ağı türleri, müdahale senaryoları; ara değerlendirme |
| 9–11 | Tamamlama | Tam deney matrisi, duyarlılık analizi |
| 12–13 | Tamamlama | Etkileşimli arayüz, belgeler |
| 14 | Sonuç (K3) | Teknik rapor |

## Başlamadan önce

**Bilmen iyi olur:** Python, temel türev kavramı, temel olasılık.
**Öğreneceklerin:** Matematiksel modelleme, sayısal yöntemler, ağ bilimi, simülasyon, duyarlılık analizi.
**Önerilen teknolojiler:** Python, NumPy, SciPy (`solve_ivp`), NetworkX, Mesa, Plotly veya Streamlit.

## Dikkat!

- Bu bir modelleme çalışmasıdır, sağlık tavsiyesi değildir; sonuçları sunarken bunu açıkça belirt.
- Ajan tabanlı modeller çok sayıda varsayım içerir; her varsayımı belgele ve duyarlılık analizi yap.
- Rastgele tohumları kaydet ve sonuçları tek çalıştırmadan değil, dağılım olarak raporla.

## Projeyi genişletme fikirleri

- Kampüs ölçeğinde ders programı verisine dayalı (anonim) temas ağı
- [ForecastArena](20-forecastarena.md) yöntemleriyle gerçek vaka verisi üzerinde tahmin
- Eğitim amaçlı tarayıcı simülasyonu

## Kaynaklar

- Kermack & McKendrick (1927) — *A contribution to the mathematical theory of epidemics*
- Keeling & Rohani — *Modeling Infectious Diseases in Humans and Animals*
- [EMOD](https://docs.idmod.org/) — ajan tabanlı salgın modelleme platformu belgeleri
- [NetworkX](https://networkx.org/)
