"""Ejemplo numerico de atencion del cap 4 (3 tokens, d_k = d_v = 2), con y sin mascara causal."""
import math

Q = [[1, 0], [0, 1], [1, 1]]
K = [[1, 0], [1, 1], [0, 1]]
V = [[1, 0], [0.5, 0.5], [0, 1]]
tokens = ["gato", "comio", "raton"]
dk = 2


def softmax(fila):
    m = max(fila)
    e = [math.exp(x - m) for x in fila]
    s = sum(e)
    return [x / s for x in e]


def matmul(A, B):
    return [[sum(a * b for a, b in zip(fila, col)) for col in zip(*B)] for fila in A]


def mostrar(nombre, M):
    print(nombre)
    for t, fila in zip(tokens, M):
        print(f"  {t:6s}", "  ".join(f"{x:5.2f}" for x in fila))


def atencion(mascara=False):
    S = [[sum(q * k for q, k in zip(Qi, Kj)) / math.sqrt(dk) for Kj in K] for Qi in Q]
    if mascara:
        S = [[s if j <= i else -math.inf for j, s in enumerate(f)] for i, f in enumerate(S)]
    A = [softmax(f) for f in S]
    return S, A, matmul(A, V)


S, A, Z = atencion()
mostrar("S = QK^T / sqrt(d_k)", S)
mostrar("A = softmax(S)", A)
mostrar("Z = A V", Z)

esperado_A = [[0.40, 0.40, 0.20], [0.20, 0.40, 0.40], [0.25, 0.50, 0.25]]
esperado_Z = [[0.60, 0.40], [0.40, 0.60], [0.50, 0.50]]
for f, g in zip(A, esperado_A):
    assert all(abs(x - y) < 0.005 for x, y in zip(f, g)), "A no coincide con el valor esperado"
for f, g in zip(Z, esperado_Z):
    assert all(abs(x - y) < 0.005 for x, y in zip(f, g)), "Z no coincide con el valor esperado"

print()
Sm, Am, Zm = atencion(mascara=True)
mostrar("A con mascara causal", Am)
mostrar("Z con mascara causal", Zm)
assert all(Am[i][j] == 0 for i in range(3) for j in range(3) if j > i)
print("\nOK: atencion")
