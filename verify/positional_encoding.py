"""Codificacion posicional sinusoidal: valores y propiedad de distancia relativa."""
import math

d = 8


def pe(t, d=d):
    v = []
    for i in range(d // 2):
        w = t / 10000 ** (2 * i / d)
        v += [math.sin(w), math.cos(w)]
    return v


print("PE(t) para t = 0..4, d_model = 8")
for t in range(5):
    print(f"  t={t}", " ".join(f"{x:+.3f}" for x in pe(t)))

assert pe(0)[0] == 0 and pe(0)[1] == 1


def dot(a, b):
    return sum(x * y for x, y in zip(a, b))


# el producto punto PE(t).PE(t+k) depende solo de k (distancia relativa)
for k in (1, 3, 5):
    vals = [dot(pe(t), pe(t + k)) for t in range(0, 20)]
    assert max(vals) - min(vals) < 1e-9, f"depende de t para k={k}"
    print(f"k={k}: PE(t).PE(t+k) = {vals[0]:.4f} para todo t")
print("\nOK: positional encoding")
