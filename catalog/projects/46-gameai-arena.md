# 46 · GameAI Arena

> **Alan:** L. Oyun teknolojileri · **Zorluk:** Orta · **Tür:** Deneysel araştırma + prototip · **Ekip:** 2 kişi · **MVP:** 4–5 hafta

## Basitçe anlatalım

Bir oyunda rakip karakterlerin nasıl davrandığını hiç düşündün mü? Bazıları hep aynı yoldan yürür ve onları kolayca atlatırsın. Bazıları seni gördüğünde saklanır, arkadaşlarını çağırır, canı azalınca kaçar. Bu davranışlar bir **oyun yapay zekâsı** tarafından yönetilir.

Oyun yapay zekâsını yazmanın farklı yolları var: bir akış şeması gibi "şu olursa bunu yap" kuralları; her seçeneğe puan verip en yüksek puanlıyı seçmek; ya da olası hamleleri ileriye doğru deneyip en iyisini aramak. GameAI Arena, aynı oyunda bu yöntemlerle yazılmış karakterleri **birbirine karşı yarıştırır** ve oyuncuların hangisini daha zeki, daha eğlenceli bulduğunu ölçer. Çünkü en güçlü yapay zekâ her zaman en eğlenceli olan değildir.

**Tek cümleyle:** Davranış ağaçları, fayda tabanlı yapay zekâ ve Monte Carlo ağaç araması gibi oyun yapay zekâsı yöntemlerini aynı oyunda yarıştıran ve hem kazanma oranı hem de oyuncu algısı açısından karşılaştıran bir proje.

## Problem

Oyun yapay zekâsı tasarımında amaç çoğu zaman en güçlü değil, en inandırıcı ve eğlenceli rakibi yapmaktır. Farklı yöntemlerin geliştirme maliyeti, hesaplama yükü ve davranış çeşitliliği farklıdır. Hangi yöntemin hangi tür oyunda tercih edilmesi gerektiği genellikle deneyimle belirlenir; sistemli karşılaştırmalar azdır.

## Ne geliştirilecek?

- Basit, sıra tabanlı veya gerçek zamanlı bir **strateji/arena oyunu**
- Aynı arayüzü kullanan farklı yapay zekâ ajanları: sonlu durum makinesi, davranış ağacı, fayda tabanlı yapay zekâ, Monte Carlo ağaç araması
- Ajanları binlerce kez birbirine karşı oynatan **turnuva sistemi**
- İnsan oyuncuların yapay zekâlara karşı oynayabileceği arayüz
- Ajanların karar sürecini görselleştiren hata ayıklama modu

## Araştırma sorusu

> Farklı oyun yapay zekâsı yöntemleri; kazanma oranı, karar başına hesaplama süresi, davranış çeşitliliği ve insan oyuncuların algıladığı zekâ ve eğlence açısından nasıl karşılaştırılır? En güçlü ajan, en eğlenceli bulunan ajan mıdır?

## Deney tasarımı

1. **Ajanlar:**
   - (A) Rastgele hamle yapan ajan — baseline
   - (B) Sonlu durum makinesi
   - (C) Davranış ağacı
   - (D) Fayda tabanlı yapay zekâ
   - (E) Monte Carlo ağaç araması (farklı düşünme süreleriyle)
2. **Ajan turnuvası:** Her ajan çifti en az 500 maç yapar; kazanma oranı ve Elo puanı hesaplanır.
3. **Oyuncu deneyi:** 20–30 gönüllü, isimleri gizlenmiş ajanlara karşı oynar (sıralama dengelenir); her maçtan sonra "zeki", "insana benzer", "eğlenceli" ölçekleri doldurulur.
4. **Davranış çeşitliliği:** Benzer durumlarda ajanların farklı seçimler yapma oranı ölçülür.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Kazanma oranı / Elo | Ajan ne kadar güçlü? | Turnuva sonuçları |
| Karar süresi | Ajan bir hamleye ne kadar sürede karar veriyor? | Milisaniye |
| Algılanan zekâ ve eğlence | Oyuncular ajanı nasıl değerlendirdi? | 1–7 ölçekleri |
| Davranış çeşitliliği | Ajan ne kadar öngörülemez? | Benzer durumlarda farklı hamle oranı |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Ajan** | Oyunda kendi kararlarını veren yapay zekâ karakteri |
| **Sonlu durum makinesi** | Karakterin "devriye", "takip", "kaçış" gibi durumlar arasında kurallarla geçtiği yapı |
| **Davranış ağacı** | Kararları ağaç şeklinde, öncelik sırasıyla düzenleyen ve oyun endüstrisinde yaygın kullanılan yapı |
| **Fayda tabanlı yapay zekâ** | Her olası eylemi puanlayıp en yüksek puanlıyı seçen yöntem |
| **Monte Carlo ağaç araması** (MCTS) | Olası hamleleri rastgele oyunlarla deneyerek en umut verici hamleyi bulan arama yöntemi |
| **Elo puanı** | Kazanma ve kaybetmeye göre güncellenen güç puanı |
| **Gruplar içi tasarım** | Her katılımcının tüm koşulları denediği deney düzeni |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, oyun kurallarını belirle |
| 1–3 | Keşif (K1) | Oyun motoru, rastgele ve durum makinesi ajanları, turnuva sistemi |
| 4–5 | Geliştirme | **MVP:** üç ajanın birbirine karşı oynadığı turnuva + insan oyuncu modu |
| 6–8 | Geliştirme (K2) | Fayda tabanlı ve MCTS ajanları, görselleştirme; ara değerlendirme |
| 9–11 | Tamamlama | Turnuva ve oyuncu deneyleri |
| 12–13 | Tamamlama | Analiz, ajan yazma kılavuzu |
| 14 | Sonuç (K3) | Teknik rapor ve demo |

## Başlamadan önce

**Bilmen iyi olur:** Bir programlama dilinde iyi düzeyde kodlama, temel ağaç ve arama algoritmaları.
**Öğreneceklerin:** Oyun yapay zekâsı, arama algoritmaları, yazılım mimarisi, oyuncu deneyi tasarımı.
**Önerilen teknolojiler:** TypeScript veya Python (oyun mantığı), Phaser veya pygame; alternatif olarak Unity veya Godot.

## Dikkat!

- Oyun kurallarını basit tut; karmaşık bir oyun geliştirmek projenin tüm zamanını alabilir.
- MCTS'nin gücü düşünme süresine bağlıdır; karşılaştırmada süreyi sabitle.
- Oyuncuların hangi ajana karşı oynadığını bilmemesi gerekir; ajan isimlerini gizle.

## Projeyi genişletme fikirleri

- Öğrencilerin kendi ajanlarını PR ile gönderdiği açık turnuva
- [AdaptivePuzzle](31-adaptivepuzzle.md) gibi oyuncuya göre zorluk ayarlayan yapay zekâ
- Pekiştirmeli öğrenme ile eğitilmiş ajan

## Kaynaklar

- Yannakakis & Togelius — [*Artificial Intelligence and Games*](https://gameaibook.org/) (ücretsiz)
- Millington — *AI for Games*
- Browne ve ark. (2012) — *A Survey of Monte Carlo Tree Search Methods*
- [Game AI Pro](http://www.gameaipro.com/) (ücretsiz bölümler)
