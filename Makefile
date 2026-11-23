# Targets principales: docker-build, pdf, check, figures, watch, clean.
# El PDF oficial se compila en el contenedor. pdf-local usa el TeX del sistema.

MAIN   = main
OUTDIR = build
IMAGE  = transformers-paper
# Docker Desktop en macOS no siempre deja el CLI en el PATH.
DOCKER := $(shell command -v docker 2>/dev/null || echo /Applications/Docker.app/Contents/Resources/bin/docker)
export PATH := $(PATH):/Applications/Docker.app/Contents/Resources/bin
# En Apple Silicon la imagen es arm64 nativa. En Intel usar: make pdf PLATFORM=linux/amd64
PLATFORM ?=
RUN = $(DOCKER) run --rm $(if $(PLATFORM),--platform $(PLATFORM)) \
      -u $(shell id -u):$(shell id -g) -e HOME=/tmp -v "$(CURDIR)":/work $(IMAGE)

.PHONY: help docker-build pdf pdf-local check check-local figures figures-local watch clean cleanall view

help:
	@echo "docker-build  construye la imagen de compilacion"
	@echo "pdf           compila build/main.pdf dentro del contenedor (oficial)"
	@echo "pdf-local     compila con el TeX del sistema (iteracion rapida)"
	@echo "check         pdf + falla ante errores, refs/citas indefinidas, labels duplicadas"
	@echo "figures       compila cada figura sola y exporta PNG a build/figcheck/"
	@echo "watch         recompila al guardar (local)"
	@echo "clean         borra auxiliares (deja el PDF); cleanall borra todo build/"

docker-build:
	$(DOCKER) build $(if $(PLATFORM),--platform $(PLATFORM)) -t $(IMAGE) .

pdf: ; $(RUN) make pdf-local
check: ; $(RUN) make check-local
figures: ; $(RUN) make figures-local

pdf-local:
	@mkdir -p $(OUTDIR)
	latexmk $(MAIN)

check-local: pdf-local
	@sh scripts/check.sh $(OUTDIR)/$(MAIN).log

figures-local:
	@sh scripts/figures.sh

watch:
	@mkdir -p $(OUTDIR)
	latexmk -pvc $(MAIN)

view:
	open $(OUTDIR)/$(MAIN).pdf

clean:
	latexmk -c $(MAIN)

cleanall:
	rm -rf $(OUTDIR)
