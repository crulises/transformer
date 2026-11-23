#!/bin/sh
# Ejecuta todas las verificaciones numericas del documento (solo requiere python3).
set -e
cd "$(dirname "$0")"
for f in atencion hopfield positional_encoding parametros gpt3; do
  echo "== $f"; python3 -I "$f.py"; echo
done
