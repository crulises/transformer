"""Conteo exacto de parametros del prototipo (cap 6)."""
d, h, N, ff, T = 128, 4, 2, 512, 64

atencion = 4 * (d * d + d)                # W_Q, W_K, W_V, W_O con bias
ffn = (d * ff + ff) + (ff * d + d)        # dos capas lineales con bias
layernorm = 2 * (2 * d)                   # dos LayerNorm por bloque (gamma y beta)
bloque = atencion + ffn + layernorm
print(f"atencion={atencion:,}  ffn={ffn:,}  layernorm={layernorm:,}  bloque={bloque:,}")
assert bloque == 198_272

print("\nSupuestos: sin LayerNorm final, proyeccion de salida con bias, sin pesos ligados,")
print("posicional sinusoidal (0 parametros).")
for V in (60, 65, 80, 100):
    total = V * d + N * bloque + d * V + V
    print(f"  |V|={V:3d}: total = {total:,} ({total / 1e6:.2f}M)")
assert 65 * d + N * bloque + d * 65 + 65 == 413_249
print("\nOK: parametros")
