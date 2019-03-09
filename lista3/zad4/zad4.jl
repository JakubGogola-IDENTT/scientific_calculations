# Jakub Gogola 236412
# Lista 3., zadanie 4.
# include("../module.jl")

using ZeroMethods

# Given function f
f(x) = sin.(x) - (0.5 * x)^2

# Derivatife of function f
pf(x) = cos.(x) - 0.5x

# Declaring variables which will be used multiple times.
local delta::Float64
local epsilon::Float64
local maxit::Int

# Bisection method tests.
a = Float64(1.5)
b = Float64(2.0)
delta = 0.5 * (1.0/10.0^5)
epsilon = delta

(r, v, it, err) = ZeroMethods.mbisekcji(f, a, b, delta, epsilon)
println("Bisection method results: ", (r, v, it, err))

# Number of iteratons.
maxit = 50

# Newton's method tests.
x0 = Float64(1.5)

(r, v, it, err) = ZeroMethods.mstycznych(f, pf, x0, delta, epsilon, maxit)
println("Newton's method results: ", (r, v, it, err))

# Secant method tests.
x0 = Float64(1.0)
x1 = Float64(2.0)
(r, v, it, err) = ZeroMethods.msiecznych(f, x0, x1, delta, epsilon, maxit)
println("Secant method results: ", (r, v, it, err))
