# Jakub Gogola 236412
# Lista 4., zadanie 3.

"""
This function computes coefficients for natural form of Newton's interpolation polynomial.

Parameters:
x - vector of arguments of length n + 1; is Vector{Float64}
fx - vector of difference quotients of length n + 1; is Vector{Float64}

Return:
a - vector of coefficients of length n + 1; is Vector{Float64}
"""
function naturalna(x::Vector{Float64}, fx::Vector{Float64})
    len = length(x)
    a = Vector{Float64}(len)
    a[len] = fx[len]

    for i = len - 1:-1:1
        a[i] = fx[i] - a[i + 1] * x[i]

        for j = i + 1:len - 1
            a[j] = a[j] - a[j + 1] * x[i]
        end
    end

    return a
end