#!/bin/bash
# Cambia el dominio en todas las URLs absolutas de la web.
# Uso:  ./cambiar-dominio.sh tottorigava.com
# (por defecto pasa de tottorigava.es a tottorigava.com)
set -euo pipefail
NUEVO="${1:-tottorigava.com}"
ACTUAL="${2:-tottorigava.es}"
cd "$(dirname "$0")"
echo "Cambiando $ACTUAL -> $NUEVO"
sed -i "s|https://$ACTUAL|https://$NUEVO|g" index.html carta.html menu.html avisolegal.html robots.txt sitemap.xml
echo "Hecho. Comprobación:"
grep -ho "https://[a-z.]*tottorigava[a-z.]*" index.html carta.html menu.html avisolegal.html robots.txt sitemap.xml | sort | uniq -c
echo
echo "Recuerda: revisa también el dominio que aparece en el texto del aviso legal."
