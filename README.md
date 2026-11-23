# Transformers: fundamentos, arquitectura y prototipo minimo

El PDF oficial se compila dentro de un contenedor Ubuntu 24.04, asi sale igual en cualquier maquina.

## Uso rapido (solo requiere Docker)

```sh
make docker-build   # una sola vez (~2 min)
make pdf            # genera build/main.pdf
make check          # falla ante errores, referencias o citas indefinidas
make figures        # cada figura sola, PNG en build/figcheck/
```

Runtimes soportados en macOS: Docker Desktop, OrbStack o Colima. Si `docker` no esta en el PATH,
el Makefile usa el de `/Applications/Docker.app`. En Intel usar `make docker-build pdf PLATFORM=linux/amd64`.

## Compilacion local (opcional, para iterar rapido)

macOS: `brew install --cask mactex` (o BasicTeX mas `tlmgr install` de los paquetes usados) y `brew install biber latexmk`.

Ubuntu:
```sh
apt install texlive-base texlive-latex-recommended texlive-latex-extra \
  texlive-lang-spanish texlive-science texlive-pictures texlive-fonts-recommended \
  texlive-bibtex-extra lmodern biber latexmk
```

Luego `make pdf-local` o `make watch`.

## Estructura

- `main.tex` y `preamble.tex`: documento y preambulo compartido
- `sections/`, `figures/` (una figura TikZ por archivo), `refs/references.bib`
- `scripts/`: verificacion del build y compilacion de figuras
- `TODO.md` (trabajo nuevo) y `CORREGIR.md` (ajustes sobre lo ya hecho)
