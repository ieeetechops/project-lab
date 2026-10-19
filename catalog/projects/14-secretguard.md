# 14 · SecretGuard

> **Alan:** D. Siber güvenlik ve mahremiyet · **Zorluk:** Orta · **Tür:** Ürün + deneysel araştırma · **Ekip:** 2 kişi · **MVP:** 4–5 hafta

## Basitçe anlatalım

Evinin anahtarını yanlışlıkla bir fotoğrafa çekip sosyal medyada paylaştığını düşün. Biri fotoğrafa bakıp anahtarın kopyasını çıkarabilir. Fotoğrafı silsen bile birileri çoktan kaydetmiş olabilir.

Yazılımcılar da kodlarında bazen **şifreleri ve gizli anahtarları** yanlışlıkla bırakıp GitHub'a yüklüyor. Bu anahtarlarla başkaları senin adına sunucu kiralayıp faturayı sana kesebiliyor veya veritabanındaki her şeyi okuyabiliyor. SecretGuard, kod yüklenmeden önce **"dur, burada bir şifre var!"** diyen bir bekçi. Zor kısım şu: her uzun ve rastgele görünen metin şifre değildir. Bekçi çok hassas olursa sürekli boş yere alarm verir, gevşek olursa gerçek şifreleri kaçırır. Bu dengeyi ölçeceğiz.

**Tek cümleyle:** Git commit'lerinde unutulan şifre ve API anahtarlarını bulan bir tarayıcı ve farklı tespit yöntemlerinin yanlış alarm oranlarının ölçülmesi.

## Problem

API anahtarları, veritabanı şifreleri ve tokenlar sıklıkla yanlışlıkla depolara commit edilir. Sonradan silinse bile Git geçmişinde kalırlar. Mevcut tarayıcılar ya çok fazla yanlış alarm verir (geliştiriciler uyarıları görmezden gelmeye başlar) ya da özel formatlı sırları kaçırır.

## Ne geliştirilecek?

- Commit öncesi çalışan (**pre-commit hook**) ve CI'da çalışan tarayıcı
- Üç tespit yöntemi: **kalıp eşleme** (regex), **entropi** analizi, **bağlam** analizi (değişken adı, dosya türü)
- Git geçmişini tarayan mod
- Bulunan sırrı nasıl iptal edeceğini anlatan **rehber çıktısı**

## Araştırma sorusu

> Kalıp tabanlı, entropi tabanlı ve bağlam destekli sır tespit yöntemleri; farklı sır türlerinde tespit oranı ve yanlış alarm oranı bakımından nasıl karşılaştırılır?

## Deney tasarımı

1. **Etiketli veri kümesi oluştur:** gerçek görünümlü ama **sahte** sırlar (AWS, GitHub, Firebase anahtarı formatında) ve sır olmayan ama sır gibi görünen metinler (hash'ler, UUID'ler, base64 resimler, test verileri).
2. Bunları farklı bağlamlarda (kod, yapılandırma, `.env`, test dosyası, belge) açık kaynak benzeri depolara yerleştir.
3. Karşılaştır: gitleaks / TruffleHog (baseline), kendi kalıp, entropi ve bağlam yöntemlerin, birleşik yöntem.
4. Her yöntemin eşik değerlerini değiştirerek precision–recall eğrisi çiz.

## Başarı ölçütleri

| Metrik | Ne demek? | Nasıl ölçülür? |
| --- | --- | --- |
| Recall | Yerleştirilen sırların yüzde kaçı bulundu? | Etiketli veri kümesi |
| Precision | Uyarıların yüzde kaçı gerçek sırdı? | Etiketli veri kümesi |
| Yanlış alarm / 1000 satır | Geliştiriciyi ne kadar rahatsız ediyor? | Sayım |
| Tarama süresi | Pre-commit'te ne kadar bekletiyor? | Milisaniye |

## Teknik terimler

| Terim | Basit açıklama |
| --- | --- |
| **Sır** (secret) | Şifre, API anahtarı, token gibi gizli kalması gereken bilgi |
| **API anahtarı** | Bir servisi kullanmak için verilen gizli kimlik kodu |
| **Token** | Belirli bir süre geçerli olan erişim jetonu |
| **Regex** | Metinde belirli kalıpları aramak için kullanılan desen dili |
| **Entropi** | Bir metnin ne kadar rastgele olduğunun ölçüsü; rastgele görünen metinler sır olabilir |
| **Pre-commit hook** | Commit yapılmadan hemen önce otomatik çalışan kontrol betiği |
| **Git geçmişi** | Deponun tüm eski sürümleri; silinen dosyalar da burada kalır |
| **Anahtar rotasyonu** | Sızan bir anahtarı iptal edip yenisini oluşturmak |
| **.env dosyası** | Sırların tutulduğu, depoya yüklenmemesi gereken ortam değişkenleri dosyası |

## 14 haftalık plan

| Hafta | Aşama | Yapılacaklar |
| --- | --- | --- |
| 0 | Öneri (K0) | gitleaks ve TruffleHog'u dene |
| 1–3 | Keşif (K1) | Etiketli sahte veri kümesi, mevcut araçlarla baseline |
| 4–7 | Geliştirme | **MVP:** kalıp + entropi tarayıcı, pre-commit hook |
| 8 | Ara değerlendirme (K2) | İlk precision/recall sonuçları |
| 9–11 | Tamamlama | Bağlam analizi, eşik deneyleri, geçmiş taraması |
| 12–13 | Tamamlama | CI entegrasyonu, iptal rehberi, belgeler |
| 14 | Sonuç (K3) | Teknik rapor |

## Başlamadan önce

**Bilmen iyi olur:** Python veya Go, Git, regex temelleri.
**Öğreneceklerin:** Güvenli geliştirme pratikleri, sınıflandırma metrikleri, Git iç yapısı, geliştirici aracı tasarımı.
**Önerilen teknolojiler:** Python veya Go, pre-commit framework, GitHub Actions.

## Dikkat!

- **Veri kümesinde asla gerçek sır kullanma.** Formatı taklit eden sahte değerler üret.
- Başkalarının herkese açık depolarında gerçek sır bulursan kötüye kullanma, yayınlama; sahibine sorumlu şekilde bildir.
- Sırrı depodan silmek yetmez; anahtar mutlaka iptal edilmelidir. Aracın bunu kullanıcıya söylemeli.

## Projeyi genişletme fikirleri

- Jupyter notebook çıktılarında sır taraması
- TechOps depolarında zorunlu pre-commit kontrolü

## Kaynaklar

- [gitleaks](https://github.com/gitleaks/gitleaks)
- [TruffleHog](https://github.com/trufflesecurity/trufflehog)
- [detect-secrets](https://github.com/Yelp/detect-secrets)
- [GitHub: Secret scanning](https://docs.github.com/en/code-security/secret-scanning)
- [pre-commit](https://pre-commit.com)
