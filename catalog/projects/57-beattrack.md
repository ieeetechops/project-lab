# 57 · BeatTrack

> **Alan:** O. Ses, müzik ve dijital sanat teknolojileri · **Zorluk:** Orta · **Tür:** Deneysel araştırma + prototip · **Ekip:** 2 kişi · **MVP:** 4–5 hafta

## Basitçe anlatalım

Bir şarkı çaldığında ayağının kendiliğinden ritme uyduğunu fark etmişsindir. Bunu yapmak senin için çok kolay, hiç düşünmeden yaparsın. Ama bir bilgisayara "bu şarkının vuruşları nerede?" diye sorduğunda iş zorlaşır. Bilgisayar sadece hava basıncındaki dalgalanmaları görür; davulu, basları, şarkıcıyı ayırt etmesi gerekir.

Müzik uygulamaları, DJ yazılımları, ritim oyunları ve egzersiz uygulamaları bu bilgiyi kullanır. BeatTrack, bir müzik kaydında **tempoyu ve vuruşların yerini** bulan bir sistem geliştirir. Klasik sinyal işleme yöntemleri ile makine öğrenmesi yöntemlerini karşılaştırır ve özellikle Türk müziğindeki aksak usuller (9/8, 7/8 gibi) gibi zor durumlarda hangi yöntemin daha başarılı olduğunu inceler.

**Tek cümleyle:** Müzik kayıtlarında tempo ve vuruş tespiti yapan bir sistem geliştiren ve klasik sinyal işleme ile makine öğrenmesi yöntemlerini farklı müzik türlerinde (aksak usuller dahil) karşılaştıran bir proje.

## Problem

Vuruş tespiti müzik bilgi erişiminin temel problemlerindendir. Mevcut yöntemler çoğunlukla Batı popüler müziğinde, 4/4 ölçüde ve sabit tempoda değerlendirilmiştir. Tempo değişen kayıtlarda, belirgin davul içermeyen müzikte ve aksak usullerde başarı belirgin şekilde düşebilir.

## Ne geliştirilecek?

- Ses dosyasından **tempo (BPM) ve vuruş zamanlarını** çıkaran Python kütüphanesi
- Klasik yöntem: başlangıç (onset) tespiti + otokorelasyon + dinamik programlama ile vuruş takibi
- Hazır makine öğrenmesi tabanlı vuruş takip modelleriyle karşılaştırma altyapısı
- Vuruşları dalga formu üzerinde gösteren ve tıklama sesiyle dinlenebilen **web arayüzü**
- Türk müziği örnekleri içeren, vuruşları elle işaretlenmiş küçük bir değerlendirme kümesi

## Araştırma sorusu

> Klasik sinyal işleme tabanlı ve makine öğrenmesi tabanlı vuruş takip yöntemleri; farklı müzik türlerinde, değişken tempolu kayıtlarda ve aksak usullerde vuruş tespit doğruluğu açısından nasıl karşılaştırılır?

## Deney tasarımı

1. **Veri:** Açık vuruş veri kümelerinden (ör. GTZAN Beat, Ballroom) örnekler ve ekip tarafından vuruşları elle işaretlenmiş, telifsiz veya lisansı uygun Türk müziği kayıtları.
2. **Yöntemler:**
   - (A) Basit enerji tabanlı başlangıç tespiti + sabit tempo varsayımı — baseline
   - (B) Spektral akı + dinamik programlamalı vuruş takibi (Ellis yöntemi)
   - (C) Hazır sinir ağı tabanlı vuruş takip modeli (ör. madmom)
3. **Ayrımlar:** Müzik türü, tempo değişimi var/yok, ölçü türü (4/4, 3/4, aksak).
4. F-ölçüsü, tempo doğruluğu ve işlem süresi hesaplanır.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Vuruş F-ölçüsü | Bulunan vuruşlar gerçek vuruşlarla ne kadar örtüşüyor? | ±70 ms tolerans ile eşleştirme |
| Tempo doğruluğu | Bulunan tempo gerçek tempoya yakın mı? | %4 tolerans |
| Tür bazında başarı | Hangi müzik türünde hangi yöntem iyi? | Alt küme analizi |
| İşlem süresi | Bir dakikalık şarkıyı işlemek ne kadar sürüyor? | Saniye |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Tempo / BPM** | Müziğin hızı; dakikadaki vuruş sayısı |
| **Vuruş** (beat) | Müzikte ayakla tempo tutulan düzenli darbeler |
| **Başlangıç** (onset) | Bir notanın veya vurmalı sesin başladığı an |
| **Spektrogram** | Sesin zaman içindeki frekans içeriğini gösteren görsel |
| **Otokorelasyon** | Bir sinyalin kendisinin kaydırılmış haliyle benzerliği; tekrar eden düzeni bulmaya yarar |
| **Dinamik programlama** | Büyük bir problemi küçük parçalara bölüp en iyi çözümü adım adım kuran yöntem |
| **Aksak usul** | Türk müziğinde 2'li ve 3'lü vuruş gruplarının birleşmesiyle oluşan düzensiz ölçüler (9/8, 7/8) |
| **F-ölçüsü** | Precision ve recall'u tek sayıda birleştiren başarı ölçüsü |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, veri kümelerinin lisanslarını kontrol et |
| 1–3 | Keşif (K1) | Ses işleme temelleri, başlangıç tespiti, baseline |
| 4–5 | Geliştirme | **MVP:** tempo ve vuruş bulan kütüphane + dinleme arayüzü |
| 6–8 | Geliştirme (K2) | Dinamik programlamalı takip, ML modeliyle karşılaştırma; ara değerlendirme |
| 9–11 | Tamamlama | Türk müziği örneklerinin işaretlenmesi, karşılaştırma deneyi |
| 12–13 | Tamamlama | Analiz, belgeler |
| 14 | Sonuç (K3) | Teknik rapor ve demo |

## Başlamadan önce

**Bilmen iyi olur:** Python, temel matematik; müzik bilgisi (ritim, ölçü) faydalı.
**Öğreneceklerin:** Sayısal sinyal işleme, müzik bilgi erişimi, değerlendirme metodolojisi.
**Önerilen teknolojiler:** Python, librosa, madmom, mir_eval, Web Audio API veya wavesurfer.js (arayüz).

## Dikkat!

- Telif hakkı olan müzikleri veri kümesi olarak yayımlama; yalnızca işaretlemeleri ve kaynak bilgisini paylaş.
- Vuruşları elle işaretlemek zaman alır ve kişiden kişiye farklılık gösterebilir; iki kişinin işaretlemesini karşılaştır.
- Tempo yarıya veya iki katına kayması sık görülen bir hatadır; bunu ayrıca raporla.

## Projeyi genişletme fikirleri

- Usul tanıma (şarkının hangi usulde olduğunu bulma)
- [AdaptivePuzzle](31-adaptivepuzzle.md) veya bir ritim oyununda otomatik bölüm üretimi
- Canlı mikrofon girişinde gerçek zamanlı vuruş takibi

## Kaynaklar

- Müller — *Fundamentals of Music Processing*
- Ellis (2007) — *Beat Tracking by Dynamic Programming*
- [librosa](https://librosa.org/) ve [madmom](https://github.com/CPJKU/madmom)
- [mir_eval](https://github.com/craffel/mir_eval)
