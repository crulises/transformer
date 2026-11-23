#!/bin/sh
# Falla si el log de LaTeX contiene errores, referencias/citas indefinidas o labels duplicadas.
log="$1"; fail=0
for pat in '^!' '^[^ ]*:[0-9]+:' 'LaTeX Warning: Reference .* undefined' \
           'LaTeX Warning: Citation .* undefined' 'multiply defined' 'Package biblatex Warning'; do
  if grep -E -q "$pat" "$log"; then echo "CHECK FALLO: $pat"; grep -E "$pat" "$log" | head -10; fail=1; fi
done
[ $fail -eq 0 ] && echo "check OK: sin errores ni referencias indefinidas"
exit $fail
