# Configuracion de latexmk: biber (no bibtex), salida en build/.
$pdf_mode = 1;
$out_dir = 'build';
$pdflatex = 'pdflatex -interaction=nonstopmode -file-line-error %O %S';
$bibtex_use = 2;   # corre biber cuando hace falta y limpia el .bbl en -C
$max_repeat = 5;
