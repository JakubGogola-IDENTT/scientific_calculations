# Jakub Gogola 236412
# Lista 3., zadanie 5.

include("../module.jl")

using ZeroMethods

f1(x) = 3 * x
f2(x) = exp.(x)

delta = Float64(1.0 / 10.0^4)
epsilon = delta

# Solution
f(x) = f1(x) - f2(x)

# Interval
a = Float64(0.0)
b = Float64(1.0)
c = Float64(2.0)

# Interval: [0.0, 1.0]
(r, v, it, err) = ZeroMethods.mbisekcji(f, a, b, delta, epsilon)
println("[", a, ", ", b, "]: ", (r, v, it, err))

# Interval: [1.0, 2.0]
(r, v, it, err) = ZeroMethods.mbisekcji(f, b, c, delta, epsilon)
println("[", b, ", ", c, "]: ", (r, v, it, err))
