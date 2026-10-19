# Project Lab Yönetişim Modeli

Bu belge Project Lab'in kim tarafından, hangi yetkiyle ve hangi kurallarla yönetildiğini tanımlar. TechOps'un genel [yönetişim modeli](https://github.com/ieeetechops/ieeetechops/blob/main/GOVERNANCE.md) geçerlidir; bu belge Project Lab'e özgü kuralları ekler.

## İlkeler

- Projeler kişilere değil programa aittir; her projenin belgelenmiş bir sahibi ve yedeği vardır.
- Kabul kararları yazılı ölçütlere göre verilir, gerekçesi issue üzerinde kayda geçer.
- Değerlendiren kişi, kendi ekibinin projesine puan vermez.
- Başarısız veya durdurulan bir proje de öğrenme çıktısıdır; dürüstçe raporlanır ve arşivlenir.
- Program, öğrenci emeğini ürüne dönüştürmekten önce öğrencinin mühendislik gelişimini gözetir.

## Roller

| Rol | Kim | Sorumluluk |
| --- | --- | --- |
| **Program Lead** | TechOps Lead veya atadığı kişi | Programın yönü, dönem takvimi, kaynak dağılımı, son karar yetkisi |
| **Değerlendirme Kurulu** | Program Lead + en az 2 mentor/kıdemli üye | Öneri kabulü, ara ve final değerlendirmeleri, pivot/durdurma kararları |
| **Mentor** | Deneyimli öğrenci, mezun veya akademisyen | Teknik yönlendirme, haftalık geri bildirim, kalite kontrolü |
| **Proje Sahibi** | Ekipten bir öğrenci | Projenin takvimi, raporlaması, deposu ve devri |
| **Ekip Üyesi** | Stajyer / gönüllü öğrenci | Geliştirme, deney, test ve dokümantasyon |
| **Akademik Danışman** *(opsiyonel)* | Öğretim üyesi | Araştırma projelerinde yöntem ve yayın danışmanlığı |

Bir kişi birden fazla rol üstlenebilir; ancak **aynı projede hem Proje Sahibi hem Kurul değerlendiricisi olamaz.**

## Karar yetkileri

| Karar | Kim önerir | Kim onaylar | Kayıt yeri |
| --- | --- | --- | --- |
| Yeni proje kabulü | Herkes | Değerlendirme Kurulu (çoğunluk) | Öneri issue'su |
| Ekip ve mentor ataması | Program Lead | Program Lead | PROJECTS.md |
| Kapsam değişikliği (küçük) | Proje Sahibi | Mentor | Proje deposu, ADR |
| Pivot (problem/yöntem değişimi) | Proje Sahibi veya Mentor | Değerlendirme Kurulu | Ara değerlendirme issue'su |
| Proje durdurma / arşivleme | Herkes | Değerlendirme Kurulu | Final/kapanış raporu |
| Dış paydaş, veri sağlayıcı veya kurum işbirliği | Proje Sahibi | Program Lead + ilgili yönetim rolü | Proje sözleşmesi |
| Kişisel veri işleme | Proje Sahibi | Program Lead (KVKK kontrol listesiyle) | Proje sözleşmesi |
| Bütçe/ücretli servis kullanımı | Proje Sahibi | Program Lead + Branch Chair | Proje sözleşmesi |
| Bu yönetişim belgelerinde değişiklik | Herkes (PR ile) | Program Lead + 1 Kurul üyesi | Bu depo |

## Değerlendirme Kurulu

- En az **3 kişiden** oluşur; toplantı yeter sayısı 2'dir.
- Öneriler [değerlendirme ölçütlerine](docs/evaluation-rubric.md) göre bağımsız puanlanır, ardından görüşülür.
- Kararlar: **Kabul**, **Koşullu kabul** (belirtilen eksikler giderilince), **Revizyon iste**, **Ret**.
- Ret ve revizyon kararları yazılı gerekçeyle verilir; ekip bir sonraki değerlendirme döneminde tekrar başvurabilir.
- Çıkar çatışması olan üye (aynı ekipte olmak, projeye doğrudan katkı) oylamaya katılmaz ve bunu kayda geçirir.

## Proje sağlığı ve müdahale

Her proje haftalık raporuna göre şu durumlardan birinde izlenir:

| Durum | Anlamı | Ne olur |
| --- | --- | --- |
| 🟢 Yolunda | Plan dahilinde ilerliyor | Normal ritim |
| 🟡 Risk altında | 2 haftadır kilometre taşı kaçıyor veya engel çözülmüyor | Mentor ile kurtarma planı |
| 🔴 Kritik | 4 hafta ilerleme yok, ekip dağıldı veya etik/veri sorunu var | Kurul pivot, kapsam daraltma veya durdurma kararı verir |

## Anlaşmazlıklar

1. Önce ekip içinde ve mentorla çözülür.
2. Çözülemezse Program Lead'e yazılı (issue veya e-posta) iletilir.
3. Program Lead kararı nihaidir; davranış kuralı ihlalleri TechOps [davranış kuralları](https://github.com/ieeetechops/ieeetechops/blob/main/CODE_OF_CONDUCT.md) ve IEEE etik kurallarına göre ele alınır.

## Bu belgenin değiştirilmesi

Değişiklikler pull request ile önerilir, en az 5 gün açık kalır ve Program Lead ile bir Kurul üyesinin onayıyla birleştirilir. Önemli değişiklikler dönem başında duyurulur.
