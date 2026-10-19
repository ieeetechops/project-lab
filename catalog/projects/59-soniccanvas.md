# 59 · SonicCanvas

> **Alan:** O. Ses, müzik ve dijital sanat teknolojileri · **Zorluk:** Başlangıç–Orta · **Tür:** Yaratıcı mühendislik + kullanıcı araştırması · **Ekip:** 2–3 kişi · **MVP:** 4 hafta

## Basitçe anlatalım

Bir konserde sahnenin arkasındaki ekranda müziğe göre dans eden renkler ve şekiller görmüşsündür. Bas sesi geldiğinde ekran titrer, şarkıcının sesi yükseldiğinde renkler parlar. Ama bu eşleştirmeler nasıl seçiliyor? Kalın sesler büyük şekiller mi olmalı, küçük şekiller mi? Hızlı ritim kırmızı mı olmalı, mavi mi?

İlginç olan şu: insanların çoğu bu konuda benzer sezgilere sahip. Kalın sesleri büyük ve koyu, ince sesleri küçük ve parlak şekillerle ilişkilendirme eğilimindeyiz. SonicCanvas, **sesi canlı görsele dönüştüren** etkileşimli bir sanat uygulaması geliştirir ve farklı ses-görsel eşleştirmelerinden hangilerinin izleyicilere daha "doğru" ve etkileyici geldiğini ölçer.

**Tek cümleyle:** Müzik veya mikrofon girişini gerçek zamanlı görsellere dönüştüren etkileşimli bir dijital sanat uygulaması geliştiren ve farklı ses-görsel eşleştirme stratejilerinin izleyici algısına etkisini inceleyen bir proje.

## Problem

Müzik görselleştirme konserlerde, sergilerde, eğitimde ve işitme engelli bireylerin müziği deneyimlemesinde kullanılır. Ancak hangi ses özelliğinin hangi görsel özelliğe eşleneceği genellikle sanatçının sezgisine bırakılır. Ses-görsel eşleştirmelerinin izleyiciler tarafından nasıl algılandığına dair ölçümler bu tasarım kararlarını destekleyebilir.

## Ne geliştirilecek?

- Tarayıcıda çalışan, müzik dosyası veya mikrofon girişi alan **gerçek zamanlı görselleştirici**
- Ses analiz modülü: ses şiddeti, frekans dağılımı, ses rengi parlaklığı, vuruşlar
- Değiştirilebilir eşleştirme stratejileri (frekans → yükseklik, şiddet → boyut, parlaklık → renk vb.)
- Sergilerde kullanılabilecek tam ekran mod ve kaydedilebilir ayar profilleri
- Eşleştirmeleri kör olarak karşılaştıran izleyici değerlendirme sayfası

## Araştırma sorusu

> Ses özelliklerinin görsel özelliklere farklı eşleştirilme biçimleri (sezgisel uyumlu, ters, rastgele), izleyicilerin ses ile görsel arasında algıladığı uyumu ve deneyimden aldıkları beğeniyi nasıl etkiler?

## Deney tasarımı

1. **Eşleştirme stratejileri:**
   - (A) Rastgele eşleştirme — baseline
   - (B) Sezgisel uyumlu eşleştirme (kalın ses → büyük/koyu, ince ses → küçük/parlak)
   - (C) Ters eşleştirme
   - (D) Ekibin sanatsal olarak tasarladığı karma eşleştirme
2. **Materyal:** Farklı türlerden 4–6 kısa, lisansı uygun müzik parçası.
3. **Katılımcılar:** 20–40 gönüllü; her katılımcı aynı müziği farklı eşleştirmelerle izler (sıralama dengelenir) ve "ses ile görüntü ne kadar uyumlu?", "ne kadar beğendin?" sorularını puanlar.
4. İsteğe bağlı: hangi görselin hangi müziğe ait olduğunu sessiz izleyerek tahmin etme görevi.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Algılanan uyum | İzleyici ses ile görüntüyü ne kadar uyumlu buldu? | 1–7 ölçeği |
| Beğeni | İzleyici deneyimi ne kadar beğendi? | 1–7 ölçeği |
| Eşleştirme doğruluğu | Sessiz izlenen görselin hangi müziğe ait olduğu tahmin edilebildi mi? | Doğru tahmin oranı |
| Akıcılık | Görselleştirme takılmadan çalışıyor mu? | FPS |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Müzik görselleştirme** | Müziğin özelliklerini canlı görsellere dönüştürme |
| **FFT** | Sesi frekans bileşenlerine ayıran hızlı hesaplama yöntemi |
| **Spektral merkez** | Sesin "parlaklığını" gösteren ölçü; ince sesler yüksek değer verir |
| **RMS** | Sesin ortalama şiddetinin ölçüsü |
| **Çapraz duyusal eşleşme** | İnsanların farklı duyular arasında kurduğu ortak çağrışımlar (kalın ses ↔ büyük nesne) |
| **Web Audio API** | Tarayıcıda ses analizi ve işleme yapmayı sağlayan arayüz |
| **Shader** | Ekran kartında çalışan, görselleri hızlıca çizen küçük program |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, çapraz duyusal eşleşme literatürünü oku |
| 1–3 | Keşif (K1) | Ses analiz modülü, ilk görselleştirme |
| 4 | Geliştirme | **MVP:** mikrofon/müzik girişiyle çalışan görselleştirici |
| 5–8 | Geliştirme (K2) | Eşleştirme stratejileri, sergi modu, değerlendirme sayfası; ara değerlendirme |
| 9–11 | Tamamlama | İzleyici deneyi |
| 12–13 | Tamamlama | Analiz, görsel cilalama |
| 14 | Sonuç (K3) | Teknik rapor ve **kol etkinliğinde canlı gösterim** |

## Başlamadan önce

**Bilmen iyi olur:** JavaScript, temel grafik çizme; müzik veya görsel sanatlara ilgi.
**Öğreneceklerin:** Ses analizi, gerçek zamanlı grafik, yaratıcı kodlama, kullanıcı deneyi tasarımı.
**Önerilen teknolojiler:** TypeScript, Web Audio API, Meyda (ses özellikleri), p5.js veya three.js, GLSL shader'lar.

## Dikkat!

- Hızlı yanıp sönen görseller ışığa duyarlı epilepsisi olan kişiler için tehlikelidir; saniyede 3'ten fazla parlak yanıp sönmeden kaçın ve uyarı ekle.
- Etkinliklerde kullanılacak müziklerin lisans durumunu kontrol et.
- Beğeni kişisel bir ölçüdür; sonuçları evrensel kural gibi değil, bu katılımcı grubunun eğilimi olarak yaz.

## Projeyi genişletme fikirleri

- [BeatTrack](57-beattrack.md) ile vuruşa kilitlenen görseller
- İşitme engelli bireylerle birlikte tasarlanan müzik deneyimi
- [Generative Canvas](29-generative-canvas.md) algoritmalarının sesle kontrol edilmesi

## Kaynaklar

- Spence (2011) — *Crossmodal correspondences: A tutorial review*
- [Web Audio API (MDN)](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API)
- [Meyda](https://meyda.js.org/)
- [W3C WCAG 2.2 — 2.3.1 Üç Yanıp Sönme](https://www.w3.org/WAI/WCAG22/Understanding/three-flashes-or-below-threshold)
