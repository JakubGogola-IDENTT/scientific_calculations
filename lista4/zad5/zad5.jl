# Jakub Gogola 236412
# Lista 4., zadanie 5.

using Interpolation

# (a)

f(x) = exp.(x)
a = Float64(0.0)
b = Float64(1.0)
rysujNnfx(f, a, b, 5)
rysujNnfx(f, a, b, 10)
rysujNnfx(f, a, b, 15)

# (b)

g(x) = (x^2) * sin.(x) 
a = Float64(-1.0)
b = Float64(1.0)
rysujNnfx(g, a, b, 5)
rysujNnfx(g, a, b, 10)
rysujNnfx(g, a, b, 15)
