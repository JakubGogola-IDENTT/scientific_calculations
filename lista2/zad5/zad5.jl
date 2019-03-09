# Jakub Gogola 236412
# Lista 2., zadanie 5.


"""
This functions iterates 40 times given expresion.
Parameters:
T - arithemtic.
"""
function normal_iter(T)
    P = zeros(T, 40)
    p = T(0.01)
    r = 3

    for i in 1:40
        p = p + r * p * (T(1.0) - p)
        P[i] = p
    end

    return P
end

"""
This functions iterates 40 times given expresion with brake after 10th iteration and
truncation of value
Parameters:
T - arithemtic.
"""
function mod_iter(T)
    P = zeros(T, 40)
    p = T(0.01)
    r = 3

    for i in 1:10
        p = p + r * p * (T(1.0) - p)
        if(i == 10)
            p = trunc(p, 3)
        end
        P[i] = p
    end

    for i in 11:40
        p = p + r * p * (T(1.0) - p)
        P[i] = p
    end

    return P     
end

T = Float32

println("*** Normal iterations ***")
println("Arithmetic: ", T)
res = normal_iter(T)    

for item in res
    println(item)
end

println("\n\n*** Iterations with truncation ***")
println("Arithmetic: ", T)
res = mod_iter(T)    

for item in res
    println(item)
end

println("\n\n****************************************\n\n")

println("\n\n*** Normal iterations ***")

arithm = [Float32, Float64]

for a in arithm
    println("\nArithmetic: ", a)
    res = normal_iter(a)    

    for item in res
        println(item)
    end
end

