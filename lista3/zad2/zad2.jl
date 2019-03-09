# Jakub Gogola 236412
# Lista 3., zadanie 2.

"""
This function searches zero of given function using Newton's method
Parameters:

f - given anonymous function
pf - derivative of given function f
x0 - starting approximation
delta, epsilon - precision of computations
maxit - maximal number of iterations

Return: tuple (r, v, it, err) where:
r - approximated value of zero of equation f(x) = 0
v - value f(r)
it - number of iterations
err - error: 
    0 - error didn't occurr, 
    1 - the required accuracy was not achieved in maxit, 
    2 - pf approximately equal 0
"""
function mstycznych(f, pf, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    r = Float64(0.0)
    v = Float64(0.0)
    it = 0
    err = 0

    r = x0
    v = f(r)

    if abs(pf(r)) < epsilon 
        err = 2
        return (r, v, it, err)
    end

    for it in 1:maxit
        x1 = r - v / pf(r)
        v = f(x1)
        if abs(x1 - r) < delta || abs(v) < epsilon 
            r = x1
            return (r, v, it, err)
        end
        r = x1
    end
    
    err = 1

    return (r, v, it, err)
end