# Sözlük

Katalogda sık geçen genel terimlerin sade açıklamaları. Projeye özgü terimler her projenin kendi sayfasında açıklanır.

## Proje ve araştırma terimleri

| Terim | Ne demek? | Günlük hayattan örnek |
| --- | --- | --- |
| **Problem** | Birinin gerçekten yaşadığı, çözülmesi gereken bir zorluk | "Form doldururken internet kesilince her şey siliniyor." |
| **Araştırma sorusu** | Projenin cevabını aradığı, ölçülerek cevaplanabilen soru | "A yöntemi B'den daha az veri kaybettiriyor mu?" |
| **Hipotez** | Araştırma sorusuna verdiğin tahmini cevap. Deneyle doğrulanır ya da yanlışlanır | "Bence A yöntemi %50 daha az veri kaybettirir." |
| **Baseline** (temel çizgi) | Karşılaştırma yapacağın en basit veya mevcut çözüm. "Hiçbir şey yapmasak ne olurdu?" | Yeni diyetin işe yarayıp yaramadığını anlamak için önce bugünkü kilonu tartmak |
| **MVP** (Minimum Viable Product) | Fikrin işe yaradığını göstermeye yetecek en küçük, çalışan sürüm | Araba yapmadan önce kaykay yapıp "tekerlek fikri çalışıyor mu?" diye bakmak |
| **Prototip** | Ürünün denenebilir ilk hali; her şeyi yapmaz ama ana fikri gösterir | Ev maketi |
| **Metrik** | Başarıyı sayıyla ölçtüğün şey | Koşu süresi, sınav notu |
| **Deney** | Bir şeyi değiştirip sonucunu ölçtüğün kontrollü test | İki farklı gübreyle iki saksı yetiştirip boylarını karşılaştırmak |
| **Kontrollü deney** | Sadece incelediğin şeyin değiştiği, diğer her şeyin sabit tutulduğu deney | İki saksıya da aynı su, aynı güneş; sadece gübre farklı |
| **Değişken** | Deneyde değişen veya ölçülen şey | Gübre türü (değiştirdiğin), bitki boyu (ölçtüğün) |
| **Benchmark** | Farklı yöntemleri aynı koşullarda yarıştırmak için hazırlanmış standart test | Herkesin aynı pistte koştuğu yarış |
| **Veri kümesi** (dataset) | Deney veya analiz için toplanmış düzenli veri | Bir sınıfın tüm sınav notlarının tablosu |
| **Tekrarlanabilirlik** | Başka birinin aynı adımları izleyip aynı sonucu alabilmesi | Yemek tarifini başkası uygulayınca aynı yemeğin çıkması |
| **Olumsuz sonuç** | Hipotezin doğru çıkmaması. Nedeni açıklanırsa değerli bir sonuçtur | "Yeni gübre işe yaramadı, çünkü toprak zaten yeterince besleyiciydi." |
| **Kullanıcı çalışması** | Gerçek insanlara bir şey kullandırıp davranışlarını ölçmek | Yeni bir menüyü 10 kişiye kullandırıp kaç kişinin aradığını bulduğunu saymak |
| **Bilgilendirilmiş onam** | Kullanıcı çalışmasına katılanların ne yapılacağını bilip kabul etmesi | Ankete başlamadan "verileriniz şöyle kullanılacak, kabul ediyor musunuz?" |

## Ölçüm ve istatistik terimleri

| Terim | Ne demek? | Günlük hayattan örnek |
| --- | --- | --- |
| **Ortalama** | Değerlerin toplamının sayısına bölümü | 5 sınavın ortalaması |
| **Medyan** | Değerleri sıraladığında ortada kalan değer; uç değerlerden etkilenmez | Sınıfın ortadaki öğrencisinin notu |
| **Standart sapma** | Değerlerin ortalamadan ne kadar dağıldığı | Herkes 70 almışsa sapma sıfır; kimi 30 kimi 100 almışsa büyük |
| **Persentil / p95** | Değerlerin %95'inin altında kaldığı değer. "En kötü %5 hariç en yavaş" | 100 otobüsten 95'i 12 dakikadan kısa sürede geldiyse p95 = 12 dk |
| **Gecikme** (latency) | Bir işin başlamasıyla bitmesi arasında geçen süre | Sipariş verip yemeğin gelmesi arasındaki süre |
| **Throughput** (iş hacmi) | Birim zamanda tamamlanan iş sayısı | Bir kasiyerin saatte kaç müşteriye baktığı |
| **Precision** (kesinlik) | "Hatalı" dediklerinin gerçekten kaçı hatalı? | Alarm 10 kez çaldı, 8'inde gerçekten yangın vardı → %80 |
| **Recall** (duyarlılık) | Gerçek hataların kaçını yakalayabildin? | 10 yangın oldu, alarm 6'sında çaldı → %60 |
| **F1 skoru** | Precision ve recall'u tek sayıda birleştiren ölçü | İkisinin dengeli ortalaması |
| **Yanlış alarm** (false positive) | Sorun yokken "sorun var" demek | Duman yokken çalan yangın alarmı |
| **Kaçırma** (false negative) | Sorun varken fark etmemek | Yangın varken çalmayan alarm |
| **Accuracy** (doğruluk) | Tüm tahminlerin yüzde kaçı doğru? Dengesiz verilerde yanıltıcıdır | 100 kişiden 1'i hasta; herkese "sağlıklı" dersen %99 doğruluk ama hastayı kaçırdın |
| **İstatistiksel anlamlılık** | Gözlenen farkın tesadüf olma ihtimalinin düşük olması | Bir zarı 3 kez atıp hep 6 gelmesi tesadüf olabilir; 100 kez hep 6 geliyorsa zar hileli |
| **Seed** (tohum) | Rastgele üretimi tekrar edilebilir yapan başlangıç sayısı | Aynı seed ile karıştırılan desteden her seferinde aynı sıra çıkar |

## Yazılım ve süreç terimleri

| Terim | Ne demek? | Günlük hayattan örnek |
| --- | --- | --- |
| **Repository / depo** | Projenin kodunun ve geçmişinin tutulduğu yer | Bir projenin tüm dosyalarının ve değişiklik geçmişinin olduğu klasör |
| **Commit** | Kod değişikliklerinin kaydedilmiş bir anlık görüntüsü | Oyunda "kaydet" demek |
| **Pull request (PR)** | Yaptığın değişikliğin incelenip ana koda eklenmesi için açtığın istek | Ödevini öğretmene teslim edip onay beklemek |
| **Kod incelemesi** (code review) | Başka birinin kodunu okuyup hata ve iyileştirme araması | Yazını bir arkadaşına okutmak |
| **CI** (Sürekli Entegrasyon) | Her değişiklikte testlerin otomatik çalıştırılması | Her ödev tesliminde otomatik yazım denetimi |
| **Test** | Kodun beklendiği gibi çalıştığını otomatik kontrol eden küçük program | Hesap makinesine 2+2 yazıp 4 çıktığını kontrol etmek |
| **CLI** (komut satırı aracı) | Terminalden komut yazarak kullanılan program | `git status` gibi |
| **API** | Programların birbiriyle konuşmasını sağlayan kurallar | Restoranda garson: sen siparişi verirsin, mutfakla o konuşur |
| **Frontend / Backend** | Kullanıcının gördüğü kısım / arka planda çalışan sunucu kısmı | Restoranın salonu / mutfağı |
| **Açık kaynak** | Kodu herkesin görebildiği, kullanabildiği ve katkı verebildiği yazılım | Herkesin okuyup üzerine ekleme yapabildiği tarif defteri |
| **Lisans** | Kodun nasıl kullanılabileceğini belirleyen hukuki metin | "Bu tarifi kullanabilirsin ama kaynağı belirt" |
| **ADR** (Mimari Karar Kaydı) | Önemli bir teknik kararın neden alındığını yazan kısa belge | "Neden bu okulu seçtim" notu |
| **Simülatör** | Gerçek sistemi bilgisayarda taklit eden program | Uçuş simülatörü |
