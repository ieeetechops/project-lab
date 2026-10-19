#!/usr/bin/env bash
# Project Lab etiketlerini oluşturur/günceller. Kullanım: ./scripts/setup-labels.sh [owner/repo]
set -euo pipefail

repo="${1:-ieeetechops/project-lab}"

label() {
  gh label create "$1" --repo "$repo" --color "$2" --description "$3" --force
}

label "öneri"               "00629B" "Yeni proje önerisi"
label "değerlendirme"       "5319E7" "Kapı değerlendirmesi (K1/K2/K3)"
label "aşama:değerlendirme" "FBCA04" "Kurul incelemesi bekliyor"
label "aşama:kabul"         "2E7D32" "Kabul edildi; sözleşme bekleniyor"
label "aşama:revizyon"      "F9A825" "Revizyon istendi"
label "aşama:ret"           "B60205" "Reddedildi"
label "yönetişim"           "0E8A16" "Yönetişim kuralı değişikliği"
