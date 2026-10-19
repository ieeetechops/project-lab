# 54 · TrafficFlow

> **Alan:** N. Bilimsel hesaplama ve simülasyon · **Zorluk:** Orta · **Tür:** Deneysel araştırma + simülasyon · **Ekip:** 2 kişi · **MVP:** 5 hafta

## Basitçe anlatalım

Bir kavşakta kırmızı ışıkta beklerken karşı yönde tek bir araba bile olmadığını fark ettin mi? Trafik ışıkları çoğu zaman sabit sürelerle çalışır: 40 saniye yeşil, 40 saniye kırmızı. O saatte yolda kimse olsa da olmasa da.

Akıllı trafik ışıkları ise yoldaki araç sayısını algılayıp yeşil süresini ona göre ayarlar. Ama bunun gerçekten fark yaratıp yaratmadığını bir şehrin gerçek kavşaklarında denemek mümkün değil. TrafficFlow, gerçek bir kavşağın **bilgisayar simülasyonunu** kurar ve farklı trafik ışığı stratejilerini binlerce sanal araçla dener: bekleme süresi ne kadar kısalıyor, kuyruk ne kadar azalıyor?

**Tek cümleyle:** İzmir'den seçilen gerçek bir kavşak veya yol koridorunu mikroskobik trafik simülatöründe modelleyen ve sabit süreli ile trafiğe uyarlanabilir sinyal kontrol stratejilerini karşılaştıran bir proje.

## Problem

Kentsel trafik sıkışıklığı zaman kaybı, yakıt tüketimi ve hava kirliliğine yol açar. Sinyal sürelerinin trafiğe göre ayarlanması etkili bir çözüm olabilir ancak etkisi kavşağın geometrisine, trafik yoğunluğuna ve yaya akışına bağlıdır. Değişiklikleri gerçek dünyada denemek pahalı ve risklidir; simülasyon bu kararlar için güvenli bir test ortamı sağlar.

## Ne geliştirilecek?

- OpenStreetMap verisinden üretilmiş, seçilen kavşağın veya koridorun **simülasyon modeli**
- Sayım verisine veya saha gözlemine dayalı **trafik talebi** (saatlik araç sayıları, dönüş oranları)
- Değiştirilebilir sinyal kontrol stratejileri
- Simülasyonu otomatik çalıştırıp sonuçları toplayan betikler
- Kuyruk uzunluklarını ve bekleme sürelerini gösteren görselleştirme

## Araştırma sorusu

> Seçilen bir kavşakta sabit süreli sinyal planı, araç algılamalı uyarlanabilir kontrol ve basit bir kuyruk tabanlı kontrol stratejisi; farklı trafik yoğunluklarında ortalama bekleme süresi, kuyruk uzunluğu ve durma sayısı açısından nasıl karşılaştırılır?

## Deney tasarımı

1. **Model:** Kavşak OpenStreetMap'ten alınıp düzeltilir. Trafik talebi, ekip tarafından yapılan kısa saha sayımlarıyla (ör. sabah ve akşam 15'er dakika) veya açık veriyle belirlenir.
2. **Stratejiler:**
   - (A) Sabit süreli sinyal planı — baseline
   - (B) Araç algılamalı (gap-based) uyarlanabilir kontrol
   - (C) En uzun kuyruğa öncelik veren kontrol
   - İsteğe bağlı: (D) pekiştirmeli öğrenme ile eğitilmiş kontrol
3. **Senaryolar:** Düşük, orta, yoğun ve aşırı yoğun trafik; yaya geçişleri dahil.
4. Her senaryo farklı rastgele tohumlarla 20 kez çalıştırılır; ortalama bekleme, kuyruk uzunluğu, durma sayısı ve tahmini emisyon ölçülür.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Ortalama bekleme süresi | Bir araç kavşakta ortalama ne kadar bekliyor? | Saniye (simülasyon) |
| Kuyruk uzunluğu | Kavşak kollarında en uzun araç kuyruğu | Araç sayısı |
| Durma sayısı | Araçlar ortalama kaç kez durdu? | Simülasyon |
| Tahmini emisyon | Toplam CO₂ salımı | SUMO emisyon modeli |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Mikroskobik simülasyon** | Her aracın ayrı ayrı hareket ettiği trafik simülasyonu |
| **SUMO** | Yaygın kullanılan açık kaynak trafik simülatörü |
| **Sinyal fazı** | Kavşakta belirli yönlerin aynı anda yeşil yandığı dilim |
| **Devre süresi** (cycle) | Tüm fazların bir kez tamamlanması için geçen süre |
| **Uyarlanabilir kontrol** | Işık sürelerinin anlık trafiğe göre değişmesi |
| **Trafik talebi** | Belirli bir sürede hangi yönden kaç aracın geldiği |
| **Kalibrasyon** | Simülasyonun gerçek gözlemlere benzer sonuç verecek şekilde ayarlanması |
| **TraCI** | SUMO'yu Python'dan çalışırken kontrol etmeye yarayan arayüz |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, kavşağı seç, saha sayım planı |
| 1–3 | Keşif (K1) | SUMO modeli, saha sayımı, sabit süreli baseline |
| 4–5 | Geliştirme | **MVP:** kalibre edilmiş kavşak modeli ve sabit süreli plan sonuçları |
| 6–8 | Geliştirme (K2) | Uyarlanabilir stratejiler (TraCI); ara değerlendirme |
| 9–11 | Tamamlama | Tüm senaryolarda deneyler |
| 12–13 | Tamamlama | Görselleştirme, belgeler |
| 14 | Sonuç (K3) | Teknik rapor |

## Başlamadan önce

**Bilmen iyi olur:** Python, temel istatistik.
**Öğreneceklerin:** Trafik mühendisliği temelleri, simülasyon modelleme, kalibrasyon, deney tasarımı.
**Önerilen teknolojiler:** SUMO, TraCI (Python), OpenStreetMap, pandas, matplotlib.

## Dikkat!

- Saha sayımı yaparken trafik güvenliğine dikkat et; yola çıkma, güvenli bir noktadan say.
- Simülasyon sonuçları modelin varsayımları kadar doğrudur; kalibrasyonu ve sınırlılıkları rapora yaz.
- Sonuçları belediyeye öneri olarak sunacaksan bunun bir öğrenci çalışması olduğunu ve doğrulama gerektirdiğini belirt.

## Projeyi genişletme fikirleri

- Birden fazla kavşağın birbirine bağlı kontrolü (yeşil dalga)
- Toplu taşıma önceliği veren sinyal kontrolü
- [OpenData Fusion](19-opendata-fusion.md) ile açık trafik verisinin kullanılması

## Kaynaklar

- [SUMO belgeleri](https://sumo.dlr.de/docs/)
- Treiber & Kesting — *Traffic Flow Dynamics*
- [OpenStreetMap](https://www.openstreetmap.org/)
- [İzmir Büyükşehir Belediyesi Açık Veri Portalı](https://acikveri.bizizmir.com/)
