# Jakub Gogola 236412
# Lista 4., zadanie 2

"""
This function computes value for Newton's interpolation polynomial for given argument t.

Parameters:
x - vector of argumentes of length n + 1; is Vector{Float64}
fx - vector of difference quotients of length n + 1; is Vector{Float64}
t - given argument for which value of polynomial is computed; is Float64

Return:
nt - value of polynomial for given argument t
"""
function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
    len = length(x)
    nt = fx[len]

    for i = len - 1:-1:1
        nt = fx[i] + (t-x[i]) * nt
    end

    return nt
end
