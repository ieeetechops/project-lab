# 22 · PlainSpeak

> **Alan:** F. HCI ve erişilebilirlik · **Zorluk:** Başlangıç–Orta · **Tür:** Kullanıcı araştırması + tasarım deneyi · **Ekip:** 2 kişi · **MVP:** 4 hafta

## Basitçe anlatalım

Bir resmi formda şu cümleyi okuduğunu düşün: "Başvuru sahibinin ikametgâh adresine ilişkin beyanının, nüfus kayıt sisteminde mevcut bilgilerle mütabakatının sağlanması gerekmektedir." İki kez okudun ve hâlâ ne yapman gerektiğini bilmiyorsun. Aynı şeyi şöyle de söyleyebilirdik: "Yazdığın adres, e-Devlet'teki adresinle aynı olmalı."

Karmaşık metinler insanları yanlış form doldurmaya, yardım masasını aramaya ya da işi tamamen bırakmaya iter. PlainSpeak, metinleri **sadeleştirmenin gerçekten işe yarayıp yaramadığını** ölçen bir deney projesi. "Bence daha anlaşılır" yerine sayıyla konuşuyoruz: insanlar sade metinle daha az hata yapıyor mu, işi daha hızlı bitiriyor mu?

**Tek cümleyle:** Karmaşık form ve açıklamaları daha anlaşılır hale getiren tasarım deneyleri yapan ve metin değişikliklerinin anlama ve hata oranına etkisini ölçen bir araştırma projesi.

## Problem

Üniversite yönetmelikleri, kayıt formları, burs başvuruları ve gizlilik metinleri genellikle ağır bir resmi dille yazılır. Bu, özellikle uluslararası öğrenciler, ilk kez başvuru yapanlar ve okuma güçlüğü yaşayanlar için bir engeldir. Ancak "sade dil daha iyi" iddiası çoğu zaman ölçülmeden kabul edilir; hangi değişikliğin ne kadar fark yarattığı bilinmez.

## Ne geliştirilecek?

- Aynı formun **farklı metin sürümlerini** gösterebilen deney platformu (web)
- Katılımcının form doldurma süresini, hatalarını ve geri dönüşlerini kaydeden ölçüm altyapısı
- Metni sadeleştirme için ekip içi **yazım kılavuzu** (Türkçe sade dil ilkeleri)
- Sonuçları özetleyen analiz not defteri

## Araştırma sorusu

> Form ve açıklama metinlerini sadeleştirmek (kısa cümle, günlük kelime, örnek ekleme), kullanıcıların formu doğru doldurma oranını ve tamamlama süresini ne ölçüde değiştirir?

## Deney tasarımı

1. **Materyal:** Gerçek bir üniversite veya IEEE formu seç (ör. etkinlik başvurusu, burs formu).
2. **Üç sürüm hazırla:**
   - (A) Orijinal metin — baseline
   - (B) Sadeleştirilmiş metin (kısa cümleler, günlük kelimeler)
   - (C) Sadeleştirilmiş metin + her alana örnek
3. **Katılımcılar:** 30–60 gönüllü öğrenci. Her katılımcı rastgele bir sürüm görür (gruplar arası tasarım).
4. Katılımcıya bir senaryo ver ("şu bilgilerle başvuru yap"), formu doldurmasını iste; hataları, süreyi ve sonunda 3 soruluk anlama testini kaydet.
5. Bilgilendirilmiş onam al, kişisel veri toplama; sadece anonim ölçümler.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Hata oranı | Formda yanlış veya eksik doldurulan alan sayısı | Doğru cevapla karşılaştırma |
| Tamamlama süresi | Formun bitirilmesi ne kadar sürdü? | Saniye (otomatik kayıt) |
| Anlama puanı | Metni gerçekten anladı mı? | Formdan sonra 3 soruluk test |
| Algılanan zorluk | Katılımcı ne kadar zor buldu? | 1–7 arası ölçek |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Sade dil** (plain language) | Okuyucunun bir kez okuyup anlayabileceği, gereksiz karmaşıklıktan arınmış yazım |
| **Okunabilirlik formülü** | Cümle ve kelime uzunluğuna bakarak metnin zorluğunu tahmin eden hesap (Türkçe için Ateşman formülü) |
| **A/B testi** | İki farklı sürümü farklı kişilere gösterip sonuçları karşılaştırma |
| **Gruplar arası tasarım** | Her katılımcının yalnızca bir sürümü gördüğü deney düzeni |
| **Rastgele atama** | Katılımcıların sürümlere şansa göre dağıtılması; böylece gruplar adil olur |
| **Bilgilendirilmiş onam** | Katılımcının ne yapılacağını bilip deneye gönüllü katılmayı kabul etmesi |
| **İstatistiksel anlamlılık** | Gözlenen farkın şans eseri çıkmış olma ihtimalinin düşük olması |
| **Likert ölçeği** | "Hiç katılmıyorum"dan "tamamen katılıyorum"a kadar giden derecelendirme |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, formu seç, sade dil literatürünü oku |
| 1–3 | Keşif (K1) | Üç metin sürümünü yaz, deney platformunu tasarla, onam metnini hazırla |
| 4 | Geliştirme | **MVP:** üç sürümü rastgele gösterip süre ve hataları kaydeden platform |
| 5–8 | Geliştirme (K2) | 5 kişilik pilot test, düzeltmeler; ara değerlendirme |
| 9–11 | Tamamlama | Ana deney (30–60 katılımcı), veri toplama |
| 12–13 | Tamamlama | İstatistiksel analiz, sade dil kılavuzunun son hali |
| 14 | Sonuç (K3) | Teknik rapor ve sadeleştirilmiş form önerisi |

## Başlamadan önce

**Bilmen iyi olur:** Temel web geliştirme (HTML formları), Türkçe yazıma ilgi.
**Öğreneceklerin:** Kullanıcı araştırması, deney tasarımı, araştırma etiği, temel istatistik, UX yazımı.
**Önerilen teknolojiler:** HTML/React, basit bir backend veya Firebase, Python veya R (analiz), Google Forms yerine kendi platformun.

## Dikkat!

- Katılımcı sayısı az olursa farklar şans eseri çıkabilir; sonuçlarını buna göre temkinli yaz.
- Ekip arkadaşlarını katılımcı yapma; formu zaten biliyorlar.
- Pilot test atlanmamalı: ilk 5 kişide platformun hatalarını ve belirsiz soruları yakalarsın.
- Onam metni de sade dille yazılmalı. Bu projede en çok bu çelişki göze batar.

## Projeyi genişletme fikirleri

- Sadeleştirilmiş formun gerçekten IEEE veya üniversite tarafından kullanılması ve gerçek hata oranlarının izlenmesi
- Yapay zekâyla sadeleştirilmiş metin sürümünün de deneye eklenmesi
- Uluslararası öğrencilerle (anadili Türkçe olmayan) ayrı bir deney

## Kaynaklar

- [plainlanguage.gov](https://www.plainlanguage.gov/guidelines/) — sade dil ilkeleri
- [W3C WAI: Cognitive Accessibility](https://www.w3.org/WAI/cognitive/)
- Ateşman (1997) — *Türkçede Okunabilirliğin Ölçülmesi*
- Lazar, Feng & Hochheiser — *Research Methods in Human-Computer Interaction*
