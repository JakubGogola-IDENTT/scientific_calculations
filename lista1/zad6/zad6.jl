# Jakub Gogola 236412
# Lista 1., zadanie 6.

"""
Function which returns value of sqrt(x^2 + 1.0) - 1.0
Arithmetic is Float64.
Parameter:

x - argument of function.
"""
function f(x)
    return sqrt(Float64(x^2) + Float64(1.0)) - Float64(1.0)
end

"""
Function which returns value of x^2 / (sqrt(x^2 + 1.0) + 1.0)
Arithmetic is Float64.
Parameter:

x - argument of function.
"""
function g(x)
    return Float64(x^2) / (sqrt(Float64(x^2) + Float64(1.0)) + Float64(1.0))
end

steps = 200

for i in 1:steps
    x = Float64(8.0)^(-i) 
    fx = f(x)
    gx = g(x)
    println("i = ", i, " x = ", x, " f(x) = ", fx, " g(x) = ", gx)
end