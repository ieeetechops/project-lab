# 49 · MiniLang

> **Alan:** M. Programlama dilleri ve derleyici araçları · **Zorluk:** Orta · **Tür:** Ürün + deneysel araştırma · **Ekip:** 2 kişi · **MVP:** 5 hafta

## Basitçe anlatalım

Bir yemek tarifini düşün: "Suyu kaynat, makarnayı ekle, 8 dakika bekle." Sen bu cümleleri okuyup anlıyor ve uyguluyorsun. Bilgisayar da bir programı okurken benzer bir iş yapar: önce cümleleri kelimelere ayırır, sonra cümlenin yapısını anlar, en son da söyleneni uygular.

Peki bilgisayar bunu nasıl yapıyor? Bunu anlamanın en iyi yolu **kendi küçük programlama dilini yazmak**. MiniLang, değişkenleri, koşulları, döngüleri ve fonksiyonları olan küçük, Türkçe anahtar kelimeli bir programlama dili ve onu çalıştıran yorumlayıcıdır. Ayrıca bir soruyu araştırır: programı satır satır okuyarak çalıştırmak mı daha hızlı, yoksa önce daha basit komutlara çevirip öyle çalıştırmak mı?

**Tek cümleyle:** Eğitim amaçlı küçük bir programlama dili ve yorumlayıcısı geliştiren, ağaç üzerinden yorumlama ile bytecode sanal makinesi yaklaşımlarını performans ve uygulama karmaşıklığı açısından karşılaştıran bir proje.

## Problem

Programlama dilleri ve derleyiciler bilgisayar mühendisliğinin temel konularındandır ama soyut kalır; öğrenciler kullandıkları dillerin içeride nasıl çalıştığını çoğunlukla görmez. Ayrıca yorumlayıcı tasarımındaki temel tercihlerin (ağaç yorumlama, bytecode, optimizasyonlar) performansa etkisi genellikle sayılarla gösterilmez.

## Ne geliştirilecek?

- Değişken, koşul, döngü, fonksiyon, dizi ve sözlük içeren küçük bir dil (Türkçe veya İngilizce anahtar kelimelerle)
- **Sözcük çözümleyici** (lexer), **ayrıştırıcı** (parser) ve anlaşılır hata mesajları
- Ağaç üzerinden yorumlayan **yorumlayıcı**
- Programı bytecode'a çeviren **derleyici** ve bunu çalıştıran **sanal makine**
- Tarayıcıda çalışan deneme ortamı (playground)
- Performans karşılaştırması için benchmark programları

## Araştırma sorusu

> Aynı dil için ağaç üzerinden yorumlama ile bytecode sanal makinesi yaklaşımları, farklı türdeki programlarda (döngü yoğun, fonksiyon çağrısı yoğun, veri yapısı yoğun) çalışma süresi ve bellek kullanımı açısından nasıl karşılaştırılır? Basit optimizasyonlar bu farkı ne kadar değiştirir?

## Deney tasarımı

1. **Benchmark programları:** Fibonacci (özyineleme), asal sayı eleği (döngü), sıralama algoritmaları, sözlük yoğun işlemler, metin işleme.
2. **Uygulamalar:**
   - (A) Ağaç üzerinden yorumlama — baseline
   - (B) Bytecode derleyici + yığın tabanlı sanal makine
   - (C) B + basit optimizasyonlar (sabit katlama, yerel değişken erişiminin hızlandırılması)
3. Her program farklı girdi boyutlarında 10'ar kez çalıştırılır.
4. Çalışma süresi, bellek kullanımı ve uygulamanın kod satırı sayısı (karmaşıklık göstergesi) karşılaştırılır. Referans olarak aynı programların Python sürümleri de ölçülür.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Çalışma süresi | Program ne kadar sürede bitti? | Milisaniye |
| Hızlanma | Bytecode sürüm ağaç yorumlamaya göre kaç kat hızlı? | Süre oranı |
| Bellek kullanımı | Çalışma sırasında en yüksek bellek | MB |
| Doğruluk | Tüm test programları doğru sonuç veriyor mu? | Test takımı |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Yorumlayıcı** | Programı doğrudan okuyup çalıştıran yazılım |
| **Derleyici** | Programı başka, genellikle daha düşük seviyeli bir dile çeviren yazılım |
| **Sözcük çözümleyici** (lexer) | Kaynak kodu anlamlı parçalara (kelime, sayı, sembol) ayıran aşama |
| **Ayrıştırıcı** (parser) | Parçaların dilbilgisi kurallarına uygun yapısını çıkaran aşama |
| **Soyut sözdizimi ağacı** (AST) | Programın yapısını ağaç şeklinde gösteren veri yapısı |
| **Bytecode** | Sanal makinenin anlayacağı basit, düşük seviyeli komutlar |
| **Sanal makine** | Bytecode'u çalıştıran yazılımsal "işlemci" |
| **Sabit katlama** | `2 + 3` gibi ifadeleri program çalışmadan önce `5` olarak hesaplama |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Brief'i doldur, dilin özelliklerini ve sözdizimini belirle |
| 1–3 | Keşif (K1) | Lexer, parser, temel ifadeler |
| 4–5 | Geliştirme | **MVP:** fonksiyon ve döngüleri çalıştıran ağaç yorumlayıcı + test takımı |
| 6–8 | Geliştirme (K2) | Bytecode derleyici ve sanal makine; ara değerlendirme |
| 9–11 | Tamamlama | Optimizasyonlar, benchmark deneyleri |
| 12–13 | Tamamlama | Tarayıcı deneme ortamı, dil kılavuzu |
| 14 | Sonuç (K3) | Teknik rapor ve canlı demo |

## Başlamadan önce

**Bilmen iyi olur:** Bir programlama dilinde iyi düzeyde kodlama, özyineleme, ağaç veri yapısı.
**Öğreneceklerin:** Derleyici tasarımı, dil tasarımı, sanal makineler, performans analizi.
**Önerilen teknolojiler:** TypeScript (tarayıcıda çalışması için), Rust veya Go; test için Vitest veya ilgili dilin test aracı.

## Dikkat!

- Dili küçük tut. Sınıflar, modüller, hata yakalama gibi özellikleri sona bırak.
- Yorumlayıcının doğruluğunu test takımıyla güvenceye al; her yeni özellik için test yaz.
- Performans karşılaştırmasında iki uygulamanın aynı dil özelliklerini desteklediğinden emin ol.

## Projeyi genişletme fikirleri

- [FriendlyErrors](50-friendlyerrors.md) ile yeni başlayanlara uygun hata mesajları
- Programlamaya giriş dersleri için Türkçe eğitim dili
- Çöp toplayıcı (garbage collector) eklenmesi ve karşılaştırılması

## Kaynaklar

- Robert Nystrom — [*Crafting Interpreters*](https://craftinginterpreters.com/) (ücretsiz çevrimiçi kitap)
- Thorsten Ball — *Writing an Interpreter in Go*
- Aho, Lam, Sethi & Ullman — *Compilers: Principles, Techniques, and Tools*
- [Lezer](https://lezer.codemirror.net/) — tarayıcıda sözdizimi renklendirme için
