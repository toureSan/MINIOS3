#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

# On récupère ce qui a été entré en argument
dossier=${1:-undefined}

while [ ! -d $dossier ]
do
    # Tant que le dossier entré n'existe pas, en demande en boucle
    echo -n "Dossier inexistant. Essayez encore: "
    read dossier
done

# On créé si besoin le dossier de destination
mkdir -p /tmp/backups/

# On créé l'archive qu'on place dans /tmp/backups
date=$(date '+%d-%m-%Y')
tar cfzP /tmp/backups/backup-$date.tar.gz $dossier

echo "Le dossier $dossier a été backupé dans /tmp/backups/backup-$date.tar.gz"

echo "Toad"

