"""Ejemplo de Hopfield del cap 2: 4 neuronas, regla de Hebb, una actualizacion."""
xi = [1, -1, 1, -1]
s = [1, 1, 1, -1]
n = len(xi)

W = [[0 if i == j else xi[i] * xi[j] / n for j in range(n)] for i in range(n)]
print("W (Hebb, 1/n, diagonal nula)")
for fila in W:
    print("  ", " ".join(f"{w:+.2f}" for w in fila))


def energia(estado):
    return -0.5 * sum(W[i][j] * estado[i] * estado[j] for i in range(n) for j in range(n))


def signo(x):
    return 1 if x >= 0 else -1


h = [sum(W[i][j] * s[j] for j in range(n)) for i in range(n)]
nuevo = [signo(x) for x in h]
print("campo local h =", [round(x, 2) for x in h])
print("s antes  =", s, " E =", energia(s))
print("s despues=", nuevo, " E =", energia(nuevo))

assert nuevo == xi, "no recupera el patron"
assert energia(nuevo) < energia(s)
# estado estable: otra actualizacion no cambia nada
assert [signo(sum(W[i][j] * nuevo[j] for j in range(n))) for i in range(n)] == nuevo
print("\nOK: hopfield (se recupera xi en una iteracion y es estable)")
