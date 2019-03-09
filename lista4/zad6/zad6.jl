# Jakub Gogola 236412
# Lista 4., zadanie 6.

using Interpolation

# (a)

f(x) = abs(x)
a = Float64(-1.0)
b = Float64(1.0)
rysujNnfx(f, a, b, 5)
rysujNnfx(f, a, b, 10)
rysujNnfx(f, a, b, 15)

# (b)

g(x) = 1.0 / (1.0 + x^2)
a = Float64(-5.0)
b = Float64(5.0)
rysujNnfx(g, a, b, 5)
rysujNnfx(g, a, b, 10)
rysujNnfx(g, a, b, 15)