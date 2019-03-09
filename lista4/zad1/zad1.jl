# Jakub Gogola 236412
# Lista 4., zadanie 1.
"""
This function computes differnece quotients for given function and vector of arguments.

Parameters:
x - vector of arguments; is Vector{Float64}
f - vector of values of function in given arguments; is Vector{Float64}

Return:
fx - vector with computed difference quotients; is Vector{Float64}
"""
function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
    len = length(f)
    fx = Vector{Float64}(len)

    for i in 1:len
        fx[i] = f[i]
    end

    for i = 2:len
        for j = len:-1:i
            fx[j] = (fx[j] - fx[j - 1]) / (x[j] - x[j - i + 1])
        end
    end

    return fx
end