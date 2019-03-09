# Jakub Gogola 236412
# Lista 3., zadanie 1.

"""
This function searches zero of given function using bisection method
Parameters:

f - given anonymous function
a - start of interval; if Float64
b - end of interval; is Float64
delta, epsilon - precision of computations

Return: tuple (r, v, it, err) where:
r - approximated value of zero of equation f(x) = 0
v - value f(r)
it - number of iterations
err - error: 
    0 - error didn't occurr, 
    1 - f(x) doesn't change sign in [a, b]
"""
function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64) 
    r = Float64(0.0)
    v = Float64(0.0)    
    it = 0
    err = 0

    f_a = f(a)
    f_b = f(b)

    if signbit(f_a) == signbit(f_b)
        err = 1
        return (r, v, it, err)
    end

    # Middle of interval
    mid = b - a

    while mid > epsilon
        it += 1

        mid /= 2.0
        r = a + mid
        v = f(r)

        if abs(mid) < delta || abs(v) < epsilon
            return (r, v, it, err)
        end

        if signbit(v) != signbit(f_a)
            b = r
            f_b = v
        else
            a = r
            f_a = v
        end
    end
end
