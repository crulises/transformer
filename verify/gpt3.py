"""Costo de entrenar GPT-3: 3640 petaflop/s-dias (Brown et al., 2020) expresado en GPU-anios."""
flops = 3640 * 1e15 * 86400
print(f"FLOP totales = {flops:.2e}")
for nombre, tflops in (("30 TFLOPS efectivos", 30), ("100 TFLOPS efectivos", 100), ("300 TFLOPS efectivos", 300)):
    anios = flops / (tflops * 1e12) / (86400 * 365)
    print(f"  {nombre}: {anios:,.0f} GPU-anios")
assert 90 < flops / 100e12 / (86400 * 365) < 110
print("\nOK: gpt3")
