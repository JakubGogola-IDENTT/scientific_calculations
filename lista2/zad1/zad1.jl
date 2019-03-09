# Jakub Gogola 236412
# Lista 2., zadanie 1.

"""
Functions returns tuple with vectors X and Y of speficied typeassert.
Parameters: 

T - type of arithmetic. Can be: Float16, Float32, Float64.

Previous x_i:
x_4 = 0.5772156649
x_5 = 0.3010299957
"""
function gen_vectors(T)::Tuple
    X = [T(2.718281828), T(-3.141592654), T(1.414213562), T(0.577215664), T(0.301029995)]
    Y = [T(1486.2497), T(878366.9879), T(-22.37492), T(4773714.647), T(0.000185049)]

    return (X, Y)
end

"""
Function computes dot product of two given vectors and returns result.
Parameters:

T - type of arithmetic. Can be: Float16, Float32, Float64.
v - typle with vectors.
"""
function dot_a(T, v::Tuple)
        X = v[1]
        Y = v[2]
        n = 5
        s = T(0.0)

        for i in 1:n
            s += T(X[i] * Y[i])
        end

        return s
end

"""
Function computes dot product of two given vectors but multiples in reversed order
and returns result.
Parameters:

T - type of arithmetic. Can be: Float16, Float32, Float64.
v - typle with vectors.
"""
function dot_b(T, v::Tuple)
    X = v[1]
    Y = v[2]

    n = 5
    s = T(0.0)
    while n >= 1
        s += X[n] * Y[n]
        n -= 1
    end

    return s
end

"""
Function computes dot product of two given vectors and returns result.
It adds positive results of multiplying in descending order and negative results
of multiplying in ascending order. In the end it sums partial sums.
Parameters:

T - type of arithmetic. Can be: Float16, Float32, Float64.
v - typle with vectors.
"""
function dot_c(T, v::Tuple)
    X = v[1]
    Y = v[2]
    temp = T[]
    
    for i in 1:length(X)
        push!(temp, X[i] * Y[i])
    end

    pos = T[]
    neg = T[]

    for i in 1:length(temp)
        if temp[i] < 0.0
            push!(neg, temp[i])
        else
            push!(pos, temp[i])
        end
    end

    sort!(neg)
    sort!(pos, rev = true)

    s_neg = T(0.0)
    s_pos = T(0.0)

    for i in 1:length(neg)
        s_neg += neg[i]
    end

    for i in 1:length(pos)
        s_pos += pos[i]
    end

    return s_neg + s_pos
end

"""
Function computes dot product of two given vectors and returns result.
It adds positive results of multiplying in ascending order and negative results
of multiplying in descending order. In the end it sums partial sums.
Parameters:

T - type of arithmetic. Can be: Float16, Float32, Float64.
v - typle with vectors.
"""
function dot_d(T, v::Tuple)
    X = v[1]
    Y = v[2]
    temp = T[]
    
    for i = 1:length(X)
        push!(temp, X[i] * Y[i])
    end

    pos = T[]
    neg = T[]

    for i in 1:length(temp)
        if temp[i] < 0.0
            push!(neg, temp[i])
        else
            push!(pos, temp[i])
        end
    end

    sort!(neg, rev = true)
    sort!(pos)

    s_neg = T(0.0)
    s_pos = T(0.0)

    for i in 1:length(neg)
        s_neg += neg[i]
    end

    for i in 1:length(pos)
        s_pos += pos[i]
    end

    return s_neg + s_pos
end

T = Float64
vectors = gen_vectors(T)
println("Arithmetic type: ", T)
println(dot_a(T, vectors))
println(dot_b(T, vectors))
println(dot_c(T, vectors))
println(dot_d(T, vectors))

T = Float32
vectors = gen_vectors(T)
println("\nArithmetic type: ", T)
println(dot_a(T, vectors))
println(dot_b(T, vectors))
println(dot_c(T, vectors))
println(dot_d(T, vectors))