# Jakub Gogola 236412
# Lista 2., zadanie 5.

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
res_n = normal_iter(T)    

println("\n\n*** Iterations with truncation ***")
println("Arithmetic: ", T)
res_m = mod_iter(T)    

for i in 1:length(res_n)
    println("\$", i, "\$ & \$", res_n[i], "\$ & \$", res_m[i], "\$ \\\\ \\hline")
end


println("\n\n****************************************\n\n")

println("\n\n*** Normal iterations ***")


res32 = normal_iter(Float32)
res64 = normal_iter(Float64)

for i in 1:length(res32)
    println("\$", i, "\$ & \$", res32[i], "\$ & \$", res64[i], "\$ \\\\ \\hline")
end


