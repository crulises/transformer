MAIN     = main
OUTDIR   = build
PDFOUT   = $(OUTDIR)/$(MAIN).pdf
PDFLATEX = pdflatex
REF      = biber
LATEXMK  = latexmk

# Flags de compilación
PLX_FLAGS = -interaction=nonstopmode -shell-escape -output-directory=$(OUTDIR) $(MAIN).tex
REF_FLAGS = --input-directory=build --output-directory=$(OUTDIR) $(MAIN)
LMK_FLAGS = -pdf -pdflatex="pdflatex -interaction=nonstopmode -shell-escape" \
           -bibtex -outdir=$(OUTDIR)

# Referencias con biber
refs:
	$(REF) $(REF_FLAGS)

# Compilacion de los tex'ss
compile: refs
	$(PDFLATEX) $(PLX_FLAGS)

# Compilación completa (por defecto)
all: compile

# Latexmk -- variacion por si las moscas
$(PDFOUT): $(MAIN).tex sections/*.tex refs/references.bib
	@mkdir -p $(OUTDIR)
	$(LATEXMK) $(LMK_FLAGS) $(MAIN)

## Recompila automáticamente al guardar cambios
watch:
	@mkdir -p $(OUTDIR)
	$(LATEXMK) $(LMK_FLAGS) -pvc $(MAIN)

## Limpiar archivos auxiliares (mantiene el PDF)
clean:
	$(LATEXMK) -outdir=$(OUTDIR) -c
	@echo "Archivos auxiliares eliminados."
