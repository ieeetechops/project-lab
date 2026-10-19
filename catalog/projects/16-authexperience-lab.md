# 16 · AuthExperience Lab

> **Alan:** D. Siber güvenlik ve mahremiyet · **Zorluk:** Orta · **Tür:** Kullanıcı araştırması + ürün · **Ekip:** 2 kişi · **MVP:** 5 hafta

## Basitçe anlatalım

Bir binaya girmenin üç yolu var:
- **Şifreli kapı:** Şifreyi ezberlemen gerekiyor; unutursan giremiyorsun, başkası öğrenirse o da girebiliyor.
- **SMS ile gelen kod:** Her seferinde telefonuna yeni bir kod geliyor; güvenli ama beklemek ve yazmak zahmetli.
- **Parmak izi (passkey):** Parmağını koyuyorsun, kapı açılıyor. Hızlı ve güvenli ama herkes nasıl çalıştığını bilmiyor ve telefonunu kaybedersen ne olacağı belirsiz.

Hangisi en iyisi? Bu sadece güvenlik meselesi değil, **insanların gerçekten kolayca kullanıp kullanamadığı** da önemli. AuthExperience Lab, bu giriş yöntemlerini gerçek kullanıcılarla deneyerek ölçen bir laboratuvar.

**Tek cümleyle:** Passkey, parola ve tek kullanımlık kod gibi giriş yöntemlerini kullanılabilirlik ve güvenlik açısından karşılaştıran bir deney ortamı.

## Problem

Parolalar zayıf, tekrar kullanılan ve oltalamaya açık bir yöntemdir. Passkey'ler daha güvenli olarak öneriliyor ancak kullanıcıların bunları ne kadar kolay anladığı, kurduğu ve kurtarabildiği konusunda yerel (Türkçe kullanıcı, öğrenci kitlesi) veriler sınırlıdır. Bir kurum giriş yöntemini seçerken güvenlik ile kolaylık arasında karar vermek zorunda kalır.

## Ne geliştirilecek?

- Aynı küçük uygulamaya **üç farklı giriş yöntemiyle** girilebilen deney ortamı: parola, e-posta ile tek kullanımlık kod (OTP), passkey
- Her adımın süresini ve hatalarını kaydeden **ölçüm katmanı** (kişisel veri tutmadan)
- Kayıt, giriş, cihaz değiştirme ve hesap kurtarma **görev senaryoları**
- Sonuç analiz paneli

## Araştırma sorusu

> Öğrenci kullanıcılar arasında passkey, parola ve e-posta OTP yöntemleri; kayıt ve giriş süresi, hata oranı, algılanan kolaylık ve hesap kurtarma başarısı bakımından nasıl karşılaştırılır?

## Deney tasarımı

1. **Katılımcılar:** 15–30 gönüllü öğrenci (bilgilendirilmiş onam ile).
2. **Desen:** Her katılımcı üç yöntemi de dener; öğrenme etkisini dengelemek için sıralama katılımcılar arasında değiştirilir (counterbalancing).
3. **Görevler:** hesap oluştur, çıkış yap ve tekrar gir, "telefonunu kaybettin" senaryosunda hesabı kurtar.
4. **Ölçümler:** görev süresi, hata ve tamamlanamayan görevler, SUS kullanılabilirlik anketi, kısa görüşme.
5. **Güvenlik analizi:** her yöntemin oltalama, parola tekrar kullanımı ve SIM değiştirme gibi tehditlere karşı durumu (literatüre dayalı tablo).

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Görev süresi | Giriş/kayıt kaç saniye sürdü? | Otomatik zaman kaydı |
| Hata oranı | Kaç denemede başarısız olundu? | Olay kayıtları |
| Tamamlama oranı | Görevi bitirenlerin oranı | Sayım |
| SUS puanı | Algılanan kullanılabilirlik (0–100) | Standart 10 soruluk anket |
| Kurtarma başarısı | Kayıp cihaz senaryosunda hesabı kurtarabildi mi? | Gözlem |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Kimlik doğrulama** | Sistemin "sen gerçekten sen misin?" diye kontrol etmesi |
| **Passkey** | Parola yerine cihazdaki parmak izi, yüz tanıma veya PIN ile giriş yapmayı sağlayan, oltalamaya dayanıklı yöntem |
| **WebAuthn / FIDO2** | Passkey'lerin arkasındaki web standartları |
| **OTP** | One-Time Password — tek kullanımlık kod |
| **MFA** | Çok faktörlü doğrulama; birden fazla kanıt istemek |
| **Oltalama** (phishing) | Sahte bir siteyle kullanıcının bilgilerini çalmak |
| **SUS** | System Usability Scale — 10 soruluk standart kullanılabilirlik anketi |
| **Counterbalancing** | Sıralama etkisini yok etmek için katılımcılara yöntemleri farklı sırayla denetmek |
| **Within-subjects** | Her katılımcının tüm koşulları denediği deney deseni |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | Literatür taraması, etik/onam planı |
| 1–3 | Keşif (K1) | Parola girişi (baseline) + ölçüm katmanı, görev senaryoları |
| 4–8 | Geliştirme (K2) | **MVP:** OTP + passkey, 3 kişilik pilot test; ara değerlendirme |
| 9–11 | Tamamlama | Asıl kullanıcı çalışması (15–30 kişi) |
| 12–13 | Tamamlama | Analiz, güvenlik karşılaştırma tablosu |
| 14 | Sonuç (K3) | Teknik rapor ve IEEE sistemleri için öneri |

## Başlamadan önce

**Bilmen iyi olur:** Web geliştirme (frontend + backend), oturum/cookie kavramı.
**Öğreneceklerin:** Modern kimlik doğrulama standartları, kullanıcı çalışması tasarımı, istatistiksel karşılaştırma.
**Önerilen teknolojiler:** Node.js veya Python, SimpleWebAuthn (veya benzeri), PostgreSQL, React.

## Dikkat!

- Katılımcıların **gerçek şifrelerini** kullanmalarını isteme; deneye özel hesap açtır.
- Kullanıcı çalışması öncesi bilgilendirilmiş onam al; verileri anonim tut.
- 20 kişilik bir çalışmanın sonuçları tüm dünyaya genellenemez; sınırlılıkları yaz.
- Passkey desteği cihaz ve tarayıcıya göre değişir; test cihazlarını raporla.

## Projeyi genişletme fikirleri

- IEEE üyelik sistemine passkey desteği önerisi
- Erişilebilirlik açısından (ekran okuyucu kullanıcıları) giriş yöntemleri

## Kaynaklar

- [passkeys.dev](https://passkeys.dev)
- [W3C WebAuthn](https://www.w3.org/TR/webauthn-3/)
- [SimpleWebAuthn](https://simplewebauthn.dev)
- [System Usability Scale (usability.gov)](https://www.usability.gov/how-to-and-tools/methods/system-usability-scale.html)
- [OWASP Authentication Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Cheat_Sheet.html)
