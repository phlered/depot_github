#!/bin/bash

# Script pour obtenir le lien GitHub Pages d'un fichier
# Usage: ./get_github_link.sh nom_du_fichier.pdf

if [ $# -eq 0 ]; then
    echo "Usage: $0 <nom_du_fichier>"
    exit 1
fi

filename="$1"
repo_base="/Users/ph/Dropbox/Philippe/2025-2026/depot_github"
github_base="https://phlered.github.io/depot_github"

# Rechercher le fichier dans le dépôt
file_path=$(find "$repo_base" -name "$filename" -type f | head -n 1)

if [ -z "$file_path" ]; then
    echo "Fichier '$filename' non trouvé dans le dépôt"
    exit 1
fi

# Extraire le chemin relatif
relative_path="${file_path#$repo_base/}"

# Construire l'URL GitHub Pages
github_url="$github_base/$relative_path"

echo "$github_url"
