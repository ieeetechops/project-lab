# 07 · QueueSense

> **Alan:** B. Backend, API ve dağıtık sistemler · **Zorluk:** Orta · **Tür:** Deneysel araştırma (simülasyon) · **Ekip:** 2 kişi · **MVP:** 4–5 hafta

## Basitçe anlatalım

Bir bankada tek gişe var ve sıra uzun. Sırayı nasıl yönetirsin?

- **Gelen sırayla** (ilk gelen ilk işlem görür): adil ama acil işi olan da bekler.
- **Önceliğe göre** (yaşlılar ve acil işler öne): acil işler hızlanır ama sıradan müşteriler sonsuza kadar bekleyebilir.
- **Adil paylaşım** (her şirketten sırayla bir kişi): kimse ezilmez ama bazı işler biraz yavaşlar.

Bilgisayar sistemleri de arka planda binlerce işi (e-posta göndermek, sertifika üretmek, rapor hazırlamak) böyle sıraya koyar. QueueSense, bu sıra yönetimi yöntemlerini **bilgisayarda taklit eden bir oyun alanı**. Hangisinin hangi durumda daha iyi olduğunu ölçeriz.

**Tek cümleyle:** Arka plan iş kuyruklarının sıralama algoritmalarını gecikme ve iş hacmi açısından karşılaştıran bir simülatör.

## Problem

Etkinlik sonrası yüzlerce sertifika üretimi, toplu e-posta gönderimi veya rapor oluşturma gibi işler arka plan kuyruklarında çalışır. Yanlış sıralama stratejisi bazı kullanıcıların saatlerce beklemesine, bazı işlerin hiç işlenmemesine (açlık) yol açar. Geliştiriciler genellikle kütüphanenin varsayılan ayarını kullanır ve alternatifleri hiç ölçmez.

## Ne geliştirilecek?

- Farklı iş yüklerini taklit eden **kuyruk simülatörü**
- FIFO, öncelik, ağırlıklı adil sıralama ve en kısa iş önce algoritmalarının **uygulamaları**
- Sonuçları zaman içinde görselleştiren **web paneli**
- Gerçek bir kuyruk sistemiyle (BullMQ vb.) küçük ölçekli **doğrulama deneyi**

## Araştırma sorusu

> Farklı iş yükü desenlerinde (ani yoğunluk, karışık iş süreleri, tek bir yoğun kullanıcı) FIFO, priority ve fair scheduling algoritmaları ortalama/kuyruk sonu gecikme, throughput ve adalet bakımından nasıl karşılaştırılır?

## Deney tasarımı

1. **İş yükleri:** sabit akış, ani yoğunluk (etkinlik bitişi), "tek bir kullanıcı 1000 iş gönderiyor", karışık kısa/uzun işler.
2. **Algoritmalar:** FIFO (baseline), priority, weighted fair queuing, shortest-job-first.
3. Her kombinasyonu farklı seed'lerle 20 kez simüle et.
4. Simülasyon sonuçlarından en az birini gerçek bir kuyruk sistemiyle doğrula.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Ortalama ve p99 bekleme | İşlerin kuyrukta ne kadar beklediği | Simülasyon kayıtları |
| Throughput | Birim zamanda biten iş | İş/saniye |
| Adalet | Kullanıcılar arasında bekleme ne kadar eşit dağıldı? | Jain adalet indeksi |
| Açlık | Hiç işlenmeyen veya çok geç işlenen iş var mı? | Eşik üstü bekleyen iş sayısı |
| Simülasyon doğruluğu | Simülasyon gerçek sistemle uyuşuyor mu? | Gerçek kuyruk ölçümüyle fark |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Kuyruk** (queue) | İşlenmeyi bekleyen işlerin sırası |
| **Worker** | Kuyruktan iş alıp yapan çalışan program |
| **FIFO** | First In, First Out — ilk gelen ilk çıkar |
| **Priority queue** | Önceliği yüksek işin öne geçtiği kuyruk |
| **Fair scheduling** | Kaynakların kullanıcılar veya gruplar arasında adil paylaştırılması |
| **Açlık** (starvation) | Düşük öncelikli bir işin hiç sıra alamaması |
| **Kesikli olay simülasyonu** | Zamanı olaydan olaya atlayarak sistemi taklit eden simülasyon türü |
| **Poisson süreci** | Olayların rastgele ama belirli bir ortalama hızla geldiği model (bankaya müşteri gelişi gibi) |
| **Jain adalet indeksi** | Kaynak dağılımının ne kadar eşit olduğunu 0–1 arasında ölçen formül |
| **Tail latency** (kuyruk sonu gecikme) | En yavaş %1 veya %5'lik işlerin yaşadığı gecikme |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Gerçek bir kuyruk kullanımı (sertifika üretimi vb.) incele |
| 1–3 | Keşif (K1) | Kuyruk teorisi temelleri, SimPy ile FIFO simülasyonu (baseline) |
| 4–7 | Geliştirme | **MVP:** 4 algoritma + 4 iş yükü + metrikler |
| 8 | Ara değerlendirme (K2) | İlk karşılaştırma grafikleri |
| 9–11 | Tamamlama | Web paneli, gerçek kuyrukla doğrulama |
| 12–13 | Tamamlama | İstatistiksel analiz, belgeler |
| 14 | Sonuç (K3) | Teknik rapor: "hangi durumda hangi algoritma?" rehberi |

## Başlamadan önce

**Bilmen iyi olur:** Python veya JavaScript, temel olasılık.
**Öğreneceklerin:** Kuyruk teorisi, simülasyon, zamanlama algoritmaları, veri görselleştirme.
**Önerilen teknolojiler:** Python + SimPy, pandas, matplotlib; web paneli için React veya Streamlit; doğrulama için BullMQ/Redis.

## Dikkat!

- Simülasyon gerçeğin basitleştirilmiş halidir; varsayımlarını (iş süresi dağılımı vb.) yaz.
- Sadece ortalamaya bakma; kullanıcıyı asıl kızdıran uzun bekleyen azınlıktır (p99).

## Projeyi genişletme fikirleri

- Otomatik yeniden deneme (retry) ve ölü mektup kuyruğu (DLQ) simülasyonu
- Worker sayısının otomatik ayarlanması (autoscaling)

## Kaynaklar

- [SimPy belgeleri](https://simpy.readthedocs.io)
- [BullMQ](https://docs.bullmq.io) — Node.js kuyruk kütüphanesi
- Jain, Chiu, Hawe (1984) — *A Quantitative Measure of Fairness and Discrimination* (adalet indeksi makalesi)
- [OSTEP](https://pages.cs.wisc.edu/~remzi/OSTEP/) — zamanlama bölümleri (ücretsiz kitap)
