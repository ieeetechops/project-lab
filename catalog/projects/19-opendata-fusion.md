# 19 · OpenData Fusion

> **Alan:** E. Veri mühendisliği ve yapay zekâ · **Zorluk:** Orta · **Tür:** Ürün + deneysel araştırma · **Ekip:** 2–3 kişi · **MVP:** 5–6 hafta

## Basitçe anlatalım

Üç farklı arkadaşından sınıfın telefon listesini istedin. Biri isimleri "Ayşe Yılmaz" diye yazmış, biri "YILMAZ, Ayşe", biri sadece "Ayşe Y." Birinin listesinde Ayşe'nin numarası eski, birinde yeni. Bir öğrenci iki listede var, birinde yok. Şimdi bu üç listeden **tek, doğru bir liste** çıkarman gerekiyor.

Açık veriler de böyledir: belediye, bakanlık ve özel kurumlar aynı şeyleri (duraklar, okullar, eczaneler) farklı formatlarda, farklı isimlerle ve bazen çelişkili bilgilerle yayımlar. OpenData Fusion bu verileri **ortak bir şemada birleştiren** bir sistem. Asıl soru şu: "Bu iki kayıt aynı yeri mi anlatıyor?" kararını en iyi hangi yöntem verir?

**Tek cümleyle:** Farklı açık veri kaynaklarını ortak bir şemada birleştiren ve tekrarlı/çelişkili kayıtları eşleştirme yöntemlerini karşılaştıran bir sistem.

## Problem

Şehircilik, ulaşım, eğitim ve sağlık gibi alanlarda veri birden çok kurum tarafından yayımlanır. Bu kaynakları birleştirmeden bütünlüklü bir analiz yapılamaz. Ama birleştirmek zordur: aynı okul bir kaynakta "Atatürk Anadolu Lisesi", diğerinde "Atatürk AL" olarak geçer; koordinatlar birkaç metre farklıdır; bir kaynak kapanmış bir eczaneyi hâlâ listeler.

## Ne geliştirilecek?

- Farklı formatlardaki (CSV, JSON, GeoJSON, API) verileri okuyan **veri toplayıcılar**
- Verileri **ortak bir şemaya** dönüştüren eşleme katmanı
- "Bu iki kayıt aynı mı?" kararını veren **kayıt eşleştirme modülü**
- Çelişkileri çözme kuralları (hangi kaynağa ne zaman güvenilir?)
- Birleşmiş veriyi haritada gösteren basit arayüz

## Araştırma sorusu

> Farklı kaynaklardaki aynı varlıkları eşleştirmede birebir eşleşme, metin benzerliği ve konum + metin birleşik yöntemleri hangi doğrulukla çalışır?

## Deney tasarımı

1. **Alan seç:** ör. İzmir'deki eczaneler, okullar veya toplu taşıma durakları. En az 2–3 farklı kaynaktan veri topla.
2. **Doğru cevap:** 200–300 kayıt çiftini elle "aynı / farklı" olarak etiketle.
3. **Yöntemler:**
   - (A) İsim birebir aynıysa eşleştir — baseline
   - (B) İsim normalizasyonu + metin benzerliği (Levenshtein, Jaro-Winkler)
   - (C) Metin benzerliği + coğrafi mesafe
   - (D) Küçük bir sınıflandırıcı (ör. lojistik regresyon) ile özellikleri birleştirme
4. Precision, recall ve F1 ölç; hataları kategorilere ayır.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Eşleştirme precision | "Aynı" dediği çiftlerin kaçı gerçekten aynı? | Elle etiketle karşılaştırma |
| Eşleştirme recall | Gerçekten aynı olan çiftlerin kaçını buldu? | Elle etiketle karşılaştırma |
| F1 skoru | Precision ve recall'un dengeli ortalaması | Formül |
| Kapsam | Birleşmiş veri, tek kaynağa göre kaç kayıt daha fazla bilgi içeriyor? | Sayım |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Açık veri** | Herkesin ücretsiz kullanabileceği şekilde yayımlanmış veri |
| **Şema** | Verinin hangi alanlardan oluştuğunu ve türlerini tanımlayan yapı |
| **Kayıt eşleştirme** (entity resolution) | Farklı kaynaklardaki aynı gerçek varlığa ait kayıtları bulma |
| **Normalizasyon** | Verileri karşılaştırılabilir hale getirmek (büyük/küçük harf, kısaltmalar) |
| **Levenshtein mesafesi** | Bir kelimeyi diğerine çevirmek için kaç harf değiştirmek gerektiği |
| **GeoJSON** | Coğrafi verileri (nokta, çizgi, alan) saklamak için kullanılan JSON formatı |
| **ETL** | Veriyi çekme (Extract), dönüştürme (Transform) ve yükleme (Load) süreci |
| **F1 skoru** | Precision ile recall'un dengesini tek sayıda gösteren ölçü |
| **Blocking** | Her kaydı herkesle karşılaştırmak yerine önce olası adayları gruplamak |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, alanı ve veri kaynaklarını seç |
| 1–3 | Keşif (K1) | Kaynakları indir, ortak şemayı tasarla, eşleşme çiftlerini etiketlemeye başla |
| 4–6 | Geliştirme | **MVP:** iki kaynağı ortak şemaya çevirip birebir eşleşmeyle birleştiren hat |
| 7–8 | Geliştirme (K2) | Benzerlik ve konum tabanlı eşleştirme; ara değerlendirme |
| 9–11 | Tamamlama | Karşılaştırma deneyi, çelişki çözme kuralları, üçüncü kaynak |
| 12–13 | Tamamlama | Harita arayüzü, birleşik verinin yayımlanması, belgeler |
| 14 | Sonuç (K3) | Teknik rapor ve birleşik açık veri kümesi |

## Başlamadan önce

**Bilmen iyi olur:** Python, temel SQL, JSON ve CSV ile çalışmış olmak.
**Öğreneceklerin:** Veri mühendisliği, ETL, kayıt eşleştirme, coğrafi veri, değerlendirme metrikleri.
**Önerilen teknolojiler:** Python, pandas, GeoPandas, RapidFuzz, PostgreSQL + PostGIS (isteğe bağlı), Leaflet (harita).

## Dikkat!

- Her kaynağın kullanım lisansını kontrol et ve birleşik veriyi yayımlarken bunlara uy.
- Türkçe karakterler (ı, İ, ş, ğ) normalizasyonda sorun çıkarır; büyük/küçük harf dönüşümünü dikkatle yap.
- Her kaydı herkesle karşılaştırmak çok yavaştır (n²). Blocking kullan.

## Projeyi genişletme fikirleri

- Verileri düzenli aralıklarla otomatik güncelleyen veri hattı
- [DataDoctor](17-datadoctor.md) ile birleşik verinin kalitesini ölçme
- Belediyelerle paylaşılabilecek "veri tutarsızlığı raporu"

## Kaynaklar

- [data.gov.tr](https://data.gov.tr/) ve [İzmir Büyükşehir açık veri portalı](https://acikveri.bizizmir.com/)
- [OpenStreetMap](https://www.openstreetmap.org/) — açık harita verisi
- [RapidFuzz](https://github.com/rapidfuzz/RapidFuzz) — hızlı metin benzerliği
- Christen (2012) — *Data Matching* (Springer)
