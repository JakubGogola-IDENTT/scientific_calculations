# Jakub Gogola 236412
# Lista 3., zadanie 6.\

include("../module.jl")
using ZeroMethods

# Declarations
f1(x) = exp.(1.0 - x) - 1.0
f2(x) = x * exp.(-x)

pf1(x) = -exp.(1.0 - x)
pf2(x) = -exp.(-x) * (x - 1.0)

# Given accuracy
delta = Float64(1.0 / 10.0^5)
epsilon = delta
# *** f1(x) ***
println("f1(x) = e^(1 - x) - 1\n")

# Number of iterations
maxit = 1000

# Bisection method
println("f1 - Bisection method")
intervals = [(0.0, 2.0), (-2.0, 2.0), (0.1, 1.8), (0.1, 1.2), (-0.2, 1.8), (-5.0, 500.0)]

for iv in intervals
    (r, v, it, err) = ZeroMethods.mbisekcji(f1, iv[1], iv[2], delta, epsilon)
    println("[", iv[1], ",", iv[2], "]: ", (r, v, it, err))
end

#Newton's method
println("f1 - NEWTON")
starts = [-1.0, 0.0, 1.1, 2.0, 6.0, 8.0, 15.00]

for s in starts
    (r, v, it, err) = ZeroMethods.mstycznych(f1, pf1, s, delta, epsilon, maxit)
    println("x0 = ", s, ": ", (r, v, it, err))
end

#Secant method
println("f1 - SECANT")
starts = [(-2.0, 2.0), (-0.3, 1.8), (0.1, 1.3), (-2.0, 6.0), (-10.0, 10.0), (10.0, 100.0)]
for s in starts
    (r, v, it, err) = ZeroMethods.msiecznych(f1, s[1], s[2], delta, epsilon, maxit)
    println("x0 = ", s[1],", x1 = ", s[2], ": ", (r, v, it, err))
end

println("\n######################################\n")

# *** f2(x) ***
println("f1(x) = x * e^(-x)\n")
# Bisection method
println("f1 - BISECTION")
intervals = [(-0.5, 0.5), (-0.7, 0.4), (-10.0, 100.)]

for iv in intervals
    (r, v, it, err) = ZeroMethods.mbisekcji(f2, iv[1], iv[2], delta, epsilon)
    println("[", iv[1], ",", iv[2], "]: ", (r, v, it, err))
end

#Newton's method
println("f1 - NEWTON")
starts = [-1.0, -0.4, 0.0, 1.0, 6.0, 8.0, 15.00]

for s in starts
    (r, v, it, err) = ZeroMethods.mstycznych(f2, pf2, s, delta, epsilon, maxit)
    println("x0 = ", s, ": ", (r, v, it, err))
end

#Secant method
println("f1 - SECANT")
starts = [(-2.0, 2.0), (-0.3, 1.8), (0.1, 1.3), (-2.0, 6.0), (-10.0, 10.0), (10.0, 100.0)]
for s in starts
    (r, v, it, err) = ZeroMethods.msiecznych(f2, s[1], s[2], delta, epsilon, maxit)
    println("x0 = ", s[1],", x1 = ", s[2], ": ", (r, v, it, err))
end