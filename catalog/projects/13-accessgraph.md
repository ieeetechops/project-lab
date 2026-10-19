# 13 · AccessGraph

> **Alan:** D. Siber güvenlik ve mahremiyet · **Zorluk:** Orta · **Tür:** Ürün + deneysel araştırma · **Ekip:** 2 kişi · **MVP:** 5 hafta · IEEE Hub'a bağlanabilir, bağımsız da geliştirilebilir

## Basitçe anlatalım

Bir okul binası düşün: öğrenciler sınıflara girebilir, öğretmenler öğretmenler odasına da girebilir, müdür her yere girebilir. Bir gün biri yanlışlıkla bir öğrenciye arşiv odasının anahtarını veriyor. Bunu kimse fark etmiyor, çünkü **kimin hangi anahtara sahip olduğunu gösteren bir liste yok**.

Yazılımlarda da kullanıcıların rolleri ve izinleri vardır: "üye", "yönetici", "etkinlik sorumlusu". Kod büyüdükçe bu izinler karmaşıklaşır ve bazen bir üye, sadece yöneticinin görmesi gereken bir sayfaya erişebilir. AccessGraph, **kimin hangi kapıyı açabildiğini bir harita olarak çizer** ve bu kapıları tek tek deneyerek yanlış verilmiş anahtarları bulur.

**Tek cümleyle:** Bir yazılımda kimin hangi kaynağa erişebildiğini görselleştiren ve yanlış yetkilendirmeleri test eden bir araç.

## Problem

Yetkilendirme hataları (Broken Access Control), web uygulamalarındaki en yaygın ve en tehlikeli güvenlik açıkları arasındadır. Roller ve izinler kod içine dağılmış olduğunda kimse "bu kullanıcı neye erişebilir?" sorusuna kesin cevap veremez. Bu hatalar genellikle ancak bir sızıntıdan sonra fark edilir.

## Ne geliştirilecek?

- Uygulamanın rollerini, izinlerini ve uç noktalarını (endpoint) okuyup **erişim grafiği** çıkaran araç
- Grafiği etkileşimli gösteren **web arayüzü** ("Üye rolü → hangi sayfalar?")
- Her rol için her uç noktayı otomatik deneyen **yetkilendirme test üreticisi**
- Beklenen izin politikası ile gerçek davranışı karşılaştıran **fark raporu**

## Araştırma sorusu

> Erişim politikasının açık bir modelden otomatik test edilmesi, elle yazılmış yetkilendirme testlerine kıyasla bilerek eklenmiş yetki hatalarının ne kadarını yakalar?

## Deney tasarımı

1. Rolleri olan örnek bir web uygulaması yaz (üye, sorumlu, yönetici; 20+ uç nokta).
2. Uygulamaya **bilerek 15–20 yetkilendirme hatası** ekle: eksik kontrol, yanlış rol, başkasının kaydına ID değiştirerek erişim (IDOR) vb.
3. Karşılaştır:
   - (A) Elle yazılmış tipik testler — baseline
   - (B) AccessGraph'ın otomatik ürettiği testler
   - (C) Genel amaçlı bir güvenlik tarayıcısı (ör. OWASP ZAP)
4. Her yöntemin bulduğu hataları ve yanlış alarmları say.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Tespit oranı | Eklenen yetki hatalarının yüzde kaçı bulundu? | Recall |
| Yanlış alarm | Hata olmayan yerde kaç uyarı verildi? | Precision |
| Kapsam | Uç nokta × rol kombinasyonlarının yüzde kaçı test edildi? | Sayım |
| Anlaşılırlık | Geliştirici grafiğe bakıp sorunu anlayabiliyor mu? | Kısa kullanıcı testi |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Kimlik doğrulama** (authentication) | "Sen kimsin?" sorusu — giriş yapmak |
| **Yetkilendirme** (authorization) | "Bunu yapmaya iznin var mı?" sorusu |
| **RBAC** | Rol tabanlı erişim kontrolü; izinler kişilere değil rollere verilir |
| **Uç nokta** (endpoint) | API'de belirli bir işi yapan adres (`/api/etkinlikler/5`) |
| **IDOR** | URL'deki numarayı değiştirerek başkasının verisine erişebilme açığı |
| **En az yetki ilkesi** | Herkese sadece işi için gereken en az izni vermek |
| **Erişim politikası** | Kimin neyi yapabileceğini tanımlayan kurallar bütünü |
| **OWASP** | Web güvenliği üzerine açık kaynak kaynaklar üreten vakıf |
| **ASVS** | OWASP'ın uygulama güvenliği doğrulama standardı; kontrol listesi gibi kullanılır |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | OWASP ASVS erişim kontrolü bölümünü oku |
| 1–3 | Keşif (K1) | Örnek uygulama + hata kataloğu, elle yazılmış testler (baseline) |
| 4–8 | Geliştirme (K2) | **MVP:** erişim grafiği çıkarma + görselleştirme; ara değerlendirme |
| 9–11 | Tamamlama | Otomatik test üretici, karşılaştırma deneyi |
| 12–13 | Tamamlama | Fark raporu, belgeler, gerçek bir TechOps uygulamasında deneme (izinle) |
| 14 | Sonuç (K3) | Teknik rapor ve canlı demo |

## Başlamadan önce

**Bilmen iyi olur:** Bir web çerçevesi (Express, FastAPI, Django), giriş/oturum mantığı.
**Öğreneceklerin:** Uygulama güvenliği, erişim kontrol modelleri, otomatik güvenlik testi, graf görselleştirme.
**Önerilen teknolojiler:** Python/FastAPI veya Node.js/Express, pytest veya Jest, Cytoscape.js veya D3 (grafik), OWASP ZAP.

## Dikkat!

- **Sadece kendi uygulamanda veya yazılı izin aldığın sistemlerde test yap.** İzinsiz güvenlik testi suçtur.
- Gerçek bir sistemde açık bulursan herkese açık paylaşma; [güvenlik politikasına](https://github.com/ieeetechops/ieeetechops/blob/main/SECURITY.md) göre bildir.
- Grafiği çıkarmak için uygulamanın yapısına dair varsayımlar yapacaksın; bunları belgele.

## Projeyi genişletme fikirleri

- Firebase Security Rules için erişim grafiği
- Rol değişikliği PR'larında otomatik "yetki farkı" raporu

## Kaynaklar

- [OWASP ASVS](https://owasp.org/www-project-application-security-verification-standard/)
- [OWASP Top 10: Broken Access Control](https://owasp.org/Top10/A01_2021-Broken_Access_Control/)
- [OWASP ZAP](https://www.zaproxy.org)
- [OWASP Authorization Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Authorization_Cheat_Sheet.html)
