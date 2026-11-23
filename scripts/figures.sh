#!/bin/sh
# Compila cada figures/fig_*.tex sola (con el preambulo del documento) y exporta PNG.
out=build/figcheck; mkdir -p "$out"; fail=0
for f in figures/fig_*.tex; do
  n=$(basename "$f" .tex)
  cat > "$out/$n.tex" <<EOF
\documentclass[12pt, a4paper]{article}
\input{preamble}
\pagestyle{empty}
\begin{document}
\input{figures/$n}
\end{document}
EOF
  if TEXINPUTS=".:" pdflatex -interaction=nonstopmode -halt-on-error -output-directory="$out" "$out/$n.tex" >"$out/$n.log" 2>&1; then
    pdftoppm -png -r 110 -singlefile "$out/$n.pdf" "$out/$n"
    echo "ok    $n"
  else
    echo "FALLA $n (ver $out/$n.log)"; fail=1
  fi
done
exit $fail
