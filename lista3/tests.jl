# Jakub Gogola 236412
# Lista 3
# Test for implementations of algorithms: mbisekcji, mstycznych, msiecznych

include("module.jl")

using ZeroMethods

f1(x) = x^2 - 4
pf1(x) = 2x

f2(x) = x^3
pf2(x) = 3x^2

f3(x) = -x^4 + 2
pf3(x) = -4x^3

delta = 0.5 * (1.0/10.0^5)
epsilon = delta
maxit = 50

# Tests for bisection method

println("### f1(x) = 2x^2 - 4 ###")
println("\nBisection method")
a = 1.0
b = 3.0
(r, v, it, err) = ZeroMethods.mbisekcji(f1, a, b, delta, epsilon)
println("[", a, ",", b,"]: ", (r, v, it, err))
a = 5.0
b = 10.0
(r, v, it, err) = ZeroMethods.mbisekcji(f1, a, b, delta, epsilon)
println("[", a, ",", b,"]: ", (r, v, it, err))

println("\nNewton's method")
x0 = 1.0
(r, v, it, err) = ZeroMethods.mstycznych(f1, pf1, x0, delta, epsilon, maxit)
println("x0 = ", x0, ": ", (r, v, it, err))
x0 = 10000000000000000.0
(r, v, it, err) = ZeroMethods.mstycznych(f1, pf1, x0, delta, epsilon, maxit)
println("x0 = ", x0, ": ", (r, v, it, err))
x0 = 0.0
(r, v, it, err) = ZeroMethods.mstycznych(f1, pf1, x0, delta, epsilon, maxit)
println("x0 = ", x0, ": ", (r, v, it, err))

println("\nSecant method")
x0 = 0.0
x1 = 3.0
(r, v, it, err) = ZeroMethods.msiecznych(f1, x0, x1, delta, epsilon, maxit)
println("x0 = ", x0, " x1 =", x1, ": ", (r, v, it, err))
x0 = -0.5
x1 = 0.5
(r, v, it, err) = ZeroMethods.msiecznych(f1, x0, x1, delta, epsilon, maxit)
println("x0 = ", x0, " x1 = ", x1, ": ", (r, v, it, err))

println("\n### f2(x) = x^3 ###")
println("\nBisection method")
a = -1.0
b = 3.0
(r, v, it, err) = ZeroMethods.mbisekcji(f2, a, b, delta, epsilon)
println("[", a, ",", b,"]: ", (r, v, it, err))
a = 5.0
b = 10.0
(r, v, it, err) = ZeroMethods.mbisekcji(f2, a, b, delta, epsilon)
println("[", a, ",", b,"]: ", (r, v, it, err))

println("\nNewton's method")
x0 = 1.0
(r, v, it, err) = ZeroMethods.mstycznych(f2, pf2, x0, delta, epsilon, maxit)
println("x0 = ", x0, ": ", (r, v, it, err))
x0 = 10000000000000000.0
(r, v, it, err) = ZeroMethods.mstycznych(f2, pf2, x0, delta, epsilon, maxit)
println("x0 = ", x0, ": ", (r, v, it, err))
x0 = 0.0
(r, v, it, err) = ZeroMethods.mstycznych(f2, pf2, x0, delta, epsilon, maxit)
println("x0 = ", x0, ": ", (r, v, it, err))

println("\nSecant method")
x0 = 0.0
x1 = 3.0
(r, v, it, err) = ZeroMethods.msiecznych(f2, x0, x1, delta, epsilon, maxit)
println("x0 = ", x0, " x1 =", x1, ": ", (r, v, it, err))
x0 = 100000000.0
x1 = 100000000000.0
(r, v, it, err) = ZeroMethods.msiecznych(f2, x0, x1, delta, epsilon, maxit)
println("x0 = ", x0, " x1 = ", x1, ": ", (r, v, it, err))

println("\n### f3 = x^4 + 3x ###")
println("\nBisection method")
a = 0.5
b = 4.0
(r, v, it, err) = ZeroMethods.mbisekcji(f3, a, b, delta, epsilon)
println("[", a, ",", b,"]: ", (r, v, it, err))
a = 5.0
b = 10.0
(r, v, it, err) = ZeroMethods.mbisekcji(f3, a, b, delta, epsilon)
println("[", a, ",", b,"]: ", (r, v, it, err))

println("\nNewton's method")
x0 = 1.0
(r, v, it, err) = ZeroMethods.mstycznych(f3, pf3, x0, delta, epsilon, maxit)
println("x0 = ", x0, ": ", (r, v, it, err))
x0 = 10000000000000000.0
(r, v, it, err) = ZeroMethods.mstycznych(f3, pf3, x0, delta, epsilon, maxit)
println("x0 = ", x0, ": ", (r, v, it, err))
x0 = 0.0
(r, v, it, err) = ZeroMethods.mstycznych(f3, pf3, x0, delta, epsilon, maxit)
println("x0 = ", x0, ": ", (r, v, it, err))

println("\nSecant method")
x0 = 0.0
x1 = 3.0
(r, v, it, err) = ZeroMethods.msiecznych(f3, x0, x1, delta, epsilon, maxit)
println("x0 = ", x0, " x1 =", x1, ": ", (r, v, it, err))
x0 = 100000000.0
x1 = 100000000000.0
(r, v, it, err) = ZeroMethods.msiecznych(f3, x0, x1, delta, epsilon, maxit)
println("x0 = ", x0, " x1 = ", x1, ": ", (r, v, it, err))