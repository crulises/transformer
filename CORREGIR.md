# CORREGIR

Formato: `- [ ] [Etiqueta] descripcion`

Etiquetas:

- Build: compilacion, labels y referencias cruzadas
- Rigor: errores factuales y numericos
- Estilo: preferencias de redaccion
- Terminologia: nombres consistentes
- Figuras: TikZ y contenido de cada figura
- Referencias: bibliografia
- Contenido: flujo y estructura de las secciones

- [x] [Build] Makefile usaba -bibtex: reemplazado por .latexmkrc con biber
- [x] [Build] Agregar csquotes
- [x] [Build] Label fig:transformer_completo duplicada en fig_positional_encoding, ahora fig:positional_encoding
- [x] [Build] Label tab:hiperparametros duplicada (05:194 y 06:138): renombrar a tab:hiperparametros_generales y tab:hiperparametros_minimo y actualizar los \ref
- [x] [Build] Referencias a sec:conclusiones y sec:implementacion comentadas hasta R3
- [ ] [Build] Paquetes sin uso aparente: algorithm, algpseudocode, listings
- [ ] [Build] Portada sin universidad ni docente

- [x] [Rigor] Ejemplo de atencion (fig_atencion_ejemplo lineas 71-73 y 84-86, texto 04:124-129): A = [[0.40, 0.40, 0.20], [0.20, 0.40, 0.40], [0.25, 0.50, 0.25]] y Z = [[0.60, 0.40], [0.40, 0.60], [0.50, 0.50]]
- [x] [Rigor] Interpretacion del ejemplo: la fila de comio es (0.20, 0.40, 0.40), atiende a si mismo y a raton, poco a gato
- [x] [Rigor] Parametros del prototipo: 198,272 por bloque, total ~0.41M con 65 caracteres (06:194 y 06:207 dicen 200K)
- [x] [Rigor] 06:203 dice "exactamente la misma arquitectura que GPT-2": GPT-2 usa posiciones aprendidas, GELU y pre-LayerNorm
- [ ] [Rigor] 05:37-41: la atencion sin posiciones es equivariante a permutaciones, no invariante
- [ ] [Rigor] 05:102-105: las residuales no resuelven el gradiente desvanecido de las RNN
- [ ] [Rigor] 04:171-179: escribir la mascara como QK^T/sqrt(d_k) + M y explicar que -inf da peso 0
- [ ] [Rigor] Convencion de matrices inconsistente: q = W_Q x (04:62) contra Q W_Q (04:143) y x W_1 (05:90)
- [ ] [Rigor] 06:164-166: la justificacion de h=4 con patrones foneticos y morfologicos es especulativa
- [ ] [Rigor] 06:42-44: el mapeo de caracteres a indices no es aprendido
- [ ] [Rigor] 06:61: dice "entrada al encoder" en un modelo decoder-only
- [ ] [Rigor] Abstract y 01:30-33 describen el prototipo como implementado
- [ ] [Rigor] Anexo: GPT-3 son 3640 petaflop-dias, unos 100 GPU-anios a 100 TFLOPS efectivos
- [x] [Rigor] Verificar con script el ejemplo de Hopfield de 4 neuronas y la matriz de codificacion posicional

- [x] [Estilo] Em dashes: 92 apariciones en sections/, figures/ y main.tex (02:30, 02:264, 03:60, 03:110-111, 03:119, 04:202-203, 05:177-179 y cabeceras de figuras)
- [ ] [Estilo] Revisar que no haya emojis

- [ ] [Terminologia] Cap 6 y anexo: usar "bloque Transformer con mascara causal" en lugar de "bloque encoder" y explicarlo una vez en el cap 5
- [ ] [Terminologia] 04:167: la auto-atencion tambien es central en el decoder

- [x] [Figuras] Estilos reservados out y pos renombrados a outblk y posblk
- [ ] [Figuras] fig_positional_encoding.tex es una copia de fig_transformer_completo.tex: falta crear la figura real de codificacion posicional (valores en verify/positional_encoding.py)
- [ ] [Figuras] fig_perceptron_ml no se incluye en ninguna seccion: usar o borrar
- [ ] [Figuras] fig_ambiguedad: tokens superpuestos ("depositar" cortado, "del" tapado) y el globo de nota pisa el contexto B
- [ ] [Figuras] fig_dependencias: "su" tapa a "presento", la leyenda choca con la nota, abreviaturas "cient." e "invest."
- [ ] [Figuras] fig_dependencias y 03:82: la figura dice 8 tokens de distancia y el texto dice 6; hay 7 tokens entre cientifico y presento (distancia 8)
- [ ] [Figuras] fig_ejemplo_contexto: rota (textos superpuestos en los tres pasos), rehacer con layout relativo
- [ ] [Figuras] fig_ejemplo_contexto: usa "Vi a la estrella con el telescopio" mientras el cap usa "banco" y "espia"; unificar el ejemplo
- [ ] [Figuras] fig_atencion_intuicion: sus pesos (gato 0.55, raton 0.25) contradicen los del ejemplo numerico (gato 0.20, raton 0.40) sobre la misma oracion
- [ ] [Figuras] fig_atencion_intuicion: etiquetas de tokens pegadas a las barras
- [ ] [Figuras] fig_qkv: la etiqueta "representacion contextualizada" pisa a z_i, la flecha de softmax a la suma es casi invisible, etiquetas W_Q, W_K, W_V diminutas
- [ ] [Figuras] fig_atencion_ejemplo: "Paso 3" se superpone con el titulo de A, flecha suelta de Z = A.V, disposicion escalonada
- [ ] [Figuras] fig_multihead: cajas de las cabezas superpuestas y con texto cortado (W_V), flechas de Z_1 y Z_4 salen de la caja Concat, texto de proyecciones sobre las flechas
- [ ] [Figuras] fig_multihead: asigna a cada cabeza un tipo de relacion (sintactica, semantica, correferencia, posicion) que no esta demostrado
- [ ] [Figuras] Revisar visualmente cada figura de los caps 3 a 6 y el anexo, incluyendo si el contenido tiene sentido, es escueto o se puede simplificar
- [ ] [Figuras] Rediseñar fig_atencion_ejemplo: coordenadas absolutas y flecha de softmax suelta
- [ ] [Figuras] Repasar las figuras del cap 2
- [ ] [Figuras] Colores sueltos (blue!12, red!10) a paleta por concepto
- [ ] [Figuras] Reconstruir la lista de glitches graficos

- [ ] [Referencias] Citar o quitar del .bib: dosovitskiy2021vit, khan2022survey, soydaner2022attention, devlin2019bert, radford2019gpt2
- [ ] [Referencias] Adam citado a Goodfellow (06:114): usar Kingma y Ba 2015
- [ ] [Referencias] Layer Norm citado a Goodfellow (05:109): usar Ba et al. 2016
- [ ] [Referencias] 05:118 atribuye a Vaswani que los bloques tempranos capturan sintaxis
- [ ] [Referencias] 03:71 cita bengio2003 para dependencias de largo alcance
- [ ] [Referencias] Agregar Bahdanau et al. 2015
- [ ] [Referencias] Quitar russell2020ai del .bib si no se usa

- [ ] [Contenido] Ejemplos heterogeneos (banco, espia, estrella, gato y raton, Hopfield aparte): unificar con una frase ancla del corpus
- [ ] [Contenido] Falta explicar tokenizacion antes de hablar de tokens, vocabulario y embeddings
- [ ] [Contenido] Cap 4: falta el puente de Bahdanau, la atencion es anterior al Transformer
- [ ] [Contenido] Cap 4: la conexion con Hopfield (04:191-195) merece subseccion propia con ejemplo numerico
- [ ] [Contenido] Cap 3: fusionar analisis integrado y requerimientos, y mejorar la analogia con Hopfield en correferencia (03:139-144)
- [ ] [Contenido] Cap 5: indicar al comienzo que el prototipo recorre solo el camino decoder-only
- [ ] [Contenido] Nota breve sobre tokenizacion (BPE) y por que se usa nivel caracter
