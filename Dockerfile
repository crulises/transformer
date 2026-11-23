# Imagen de compilacion del paper. Fuente de verdad del PDF oficial.
# Base fija: Ubuntu 24.04 LTS. Sus paquetes TeX Live (version 2023) quedan
# congelados por release de Ubuntu, lo que da builds repetibles sin pinnear cada paquete.
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive LANG=C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
        texlive-base \
        texlive-latex-recommended \
        texlive-latex-extra \
        texlive-lang-spanish \
        texlive-science \
        texlive-pictures \
        texlive-fonts-recommended \
        texlive-bibtex-extra \
        lmodern \
        biber \
        latexmk \
        make \
        poppler-utils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work
CMD ["make", "pdf-local"]
