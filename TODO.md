# TODO

Formato: `- [ ] [Etiqueta] descripcion`

Etiquetas (cada una es un release que termina con PDF limpio y tag de git):

- R0: setup reproducible
- R1: compilacion limpia, figuras y rigor numerico
- R2: redaccion de los capitulos 3, 4 y 5
- R3: conclusiones, anexo y cierre del documento
- R4: implementacion del prototipo
- R5: material extra

- [x] [R0] Runtime: Docker Desktop
- [x] [R0] Dockerfile sobre ubuntu:24.04 con TeX Live minimo
- [x] [R0] .latexmkrc con biber
- [x] [R0] Makefile: docker-build, pdf, pdf-local, watch, clean, cleanall, check, figures
- [x] [R0] make check: falla ante errores, referencias o citas indefinidas y labels duplicadas
- [x] [R0] make figures: cada figura sola, PNG en build/figcheck/
- [x] [R0] README para macOS y contenedor
- [x] [R0] preamble.tex separado de main.tex y csquotes agregado
- [x] [R0] GitHub Actions: compila en el contenedor y publica el PDF como artifact
- [ ] [R0] Probar el workflow en GitHub
- [ ] [R0] Tag r0

- [ ] [R1] Cero errores y warnings revisados uno por uno
- [ ] [R1] Revisar visualmente cada figura compilada sola
- [ ] [R1] Formalizar la paleta con \colorlet en el preambulo
- [ ] [R1] Scripts de verificacion en verify/: atencion, Hopfield, positional encoding, parametros, GPT-3
- [ ] [R1] Portada: universidad, docente y fecha fija Diciembre 2026
- [ ] [R1] Tag r1

- [ ] [R2] Cap 3: revisar y hacer mas ameno
- [ ] [R2] Cap 4: revisar y agregar puente de Bahdanau antes de Q, K, V
- [ ] [R2] Cap 4: figura de la mascara causal como matriz triangular sobre los scores del ejemplo
- [ ] [R2] Cap 5: revisar y aclarar que el prototipo es decoder-only
- [ ] [R2] Cap 6: repaso y alineacion con resultados reales
- [ ] [R2] Cada concepto en dos capas: intuicion con figura y luego formalizacion
- [ ] [R2] Tag r2

- [ ] [R3] Escribir 07_conclusiones.tex
- [ ] [R3] Reescribir el anexo conceptual y reactivar su \input
- [ ] [R3] Revisar abstract y referencias cruzadas
- [ ] [R3] Tag r3

- [ ] [R4] Reorganizar el monorepo en paper/ y code/
- [ ] [R4] Elegir corpus: espanol de dominio publico o Tiny Shakespeare
- [ ] [R4] Un modulo por concepto: embeddings, positional encoding, atencion, bloque, modelo, entrenamiento, generacion
- [ ] [R4] Python con versiones fijadas y semilla fija en el contenedor
- [ ] [R4] Tests que reproducen los ejemplos numericos del paper
- [ ] [R4] Scripts o notebooks paso a paso con graficos
- [ ] [R4] Figuras de resultados: curva de perdida, mapa de atencion, proyeccion 2D de embeddings, texto generado por temperatura
- [ ] [R4] Anexo con parametros medidos y resultados reales
- [ ] [R4] Tag r4

- [ ] [R5] Elevar el documento a formato paper con teoria y practica implementada
- [ ] [R5] Presentacion o guion de defensa
- [ ] [R5] Ejemplos corriendo del proyecto aparte de Uli
