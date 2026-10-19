# Proje Deposu Standartları

Her Project Lab projesinin kendi GitHub deposu olur. Bu belge, bir deponun "Project Lab projesi" sayılması için gereken asgari standardı tanımlar.

## Adlandırma ve konum

- Depolar `ieeetechops` hesabı altında açılır.
- Ad biçimi: `lab-<kısa-ad>` — örn. `lab-digital-archive`, `lab-doc-intel`, `lab-circuit-lint`.
- Depo açıklaması tek cümlelik problem tanımıdır.
- Konu etiketleri (topics): `ieee-project-lab` + proje türü (`research`, `product`, `open-source`).

## Zorunlu dosyalar

```text
lab-<kısa-ad>/
├── README.md              # templates/project-readme.md'den türetilir
├── LICENSE                # bkz. ip-and-licensing.md
├── CHANGELOG.md
├── CONTRIBUTING.md        # kısa; TechOps rehberine bağlanabilir
├── docs/
│   ├── charter.md         # imzalanmış proje sözleşmesi
│   ├── problem.md         # problem, paydaşlar, kapsam dışı
│   ├── related-work.md    # mevcut çözümler ve farkımız
│   ├── evaluation.md      # metrikler, baseline, sonuç tabloları
│   ├── adr/               # mimari / yöntem kararları
│   └── reports/           # haftalık, ara ve final raporlar
├── tests/
└── .github/workflows/     # en az bir CI iş akışı
```

## Kalite asgarisi

| Alan | Gereklilik |
| --- | --- |
| **Kurulum** | README'deki adımlarla temiz bir makinede 15 dakikada çalıştırılabilir |
| **Test** | Çekirdek mantık için otomatik testler; CI her PR'da çalışır |
| **Kod incelemesi** | `main` dalı korumalıdır; her değişiklik en az bir ekip üyesi veya mentor tarafından incelenir |
| **Sürümleme** | Ara ve final değerlendirmelerinde etiketli release (`v0.1.0`, `v1.0.0`) |
| **Gizli bilgiler** | Anahtarlar `.env` / GitHub Secrets ile tutulur, depoya asla girmez |
| **Bağımlılıklar** | Sürüm sabitlenmiş (`requirements.txt`, `package-lock.json` vb.) |
| **Belge** | Kararlar ADR olarak yazılır; README güncel tutulur |

## Proje türüne göre ek gereklilikler

### Ürün / sistem projeleri
- Kullanıcı senaryoları ve kabul kriterleri
- Dağıtım (deploy) ve geri alma belgesi
- Kişisel veri varsa veri akış şeması ve saklama süresi

### Araştırma / ML projeleri
- [Araştırma dürüstlüğü kurallarına](research-integrity.md) uyum
- Veri kartı (kaynak, lisans, bölünme, bilinen önyargılar)
- Model kartı (amaç, metrikler, sınırlılıklar)
- Sonuçları yeniden üreten tek komut veya not defteri

### Açık kaynak araç projeleri
- Paket yöneticisinde yayın planı (PyPI, npm vb.)
- Dış katkıcılar için issue şablonları ve `good first issue` etiketleri
- Semantik sürümleme ve API değişiklik politikası

## Devir

Proje Bakım veya Arşiv durumuna geçmeden önce:
- Tüm erişimler kişisel hesaplardan kurumsal hesaplara taşınır.
- `docs/handover.md` yazılır: mimari özet, açık işler, bilinen hatalar, iletişim.
- Arşivlenecek depo GitHub'da *Archived* olarak işaretlenir.
