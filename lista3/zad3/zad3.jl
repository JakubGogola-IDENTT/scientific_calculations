# Jakub Gogola 236412
# Lista 3., zadanie 3.

"""
This function searches zero of given function using secant method
Parameters:

f - given anonymous function
x0, x1 - starting approximation
delta, epsilon - precision of computations
maxit - maximal number of iterations

Return: tuple (r, v, it, err) where:
r - approximated value of zero of equation f(x) = 0
v - value f(r)
it - number of iterations
err - error: 
    0 - error didn't occurr, 
    1 - the required accuracy was not achieved in maxit, 
"""
function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    r = Float64(0.0)
    v = Float64(0.0)
    it = 0
    err = 0

    f_x0 = f(x0)
    f_x1 = f(x1)

    for it in 1:maxit
        if abs(f_x0) > abs(f_x1)
            # Swap values
            x0, x1 = x1, x0
            f_x0, f_x1 = f_x1, f_x0
        end

        s = (x1 - x0) / (f_x1 - f_x0)
        x1 = x0
        f_x1 = f_x0
        x0 -= f_x0 * s 
        f_x0 = f(x0)

        if abs(x1 - x0) < delta || abs(f_x0) < epsilon
            r = x0
            v = f_x0
            return(r, v, it, err)
        end
    end

    err = 1
    r = x0
    v = f_x0
    return(r, v, it, err)
end