# Jakub Gogola 236412
# Lista 1., zadanie 7.

"""
Function which returns value of sin(x) + cos(3x)
Arithmetic is Float64.
Parameters:

x - argmunent of function.
"""
function f(x) 
    return sin(x) + cos(3x)
end

"""
Function which returns value of derivatife of sin(x) + cos(3x) 
(it returns value of cos(x) - 3sin(3x)).
Arithmetic is Float64.
Parameters:

x - argmunent of function.
"""
function real_df(x)
    return cos(x) - 3sin(3x)
end

"""
Function which returns approximate value of derivatife of sin(x) + cos(3x) 
Arithmetic is Float64.
Parameters:

x - argmunent of function.
"""
function approx_df(x0, h)
    return (f(x0 + h) - f(x0)) / h
end

"""
Function which returns approximate value of error of approximation of derivative.
Arithmetic is Float64.
Parameters:

x - argmunent of function.
"""
function approx_error(rdf, adf)
    return abs(rdf - adf)
end

for n in 0:54 
    h = Float64(2.0)^-n
    rdf = real_df(Float64(1.0))
    adf = approx_df(Float64(1.0), h)
    err = approx_error(rdf, adf)
    println(n, " h = 2^", -n, " | f'(x) = ", adf, " | err = ", err, " | 1 + h = ", Float64(1.0) + h)
end