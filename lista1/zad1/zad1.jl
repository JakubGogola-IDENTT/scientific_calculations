# Jakub Gogola 236412
# Lista 1., zadanie 1.

"""
Functions computes machine epsilon for given arithmetics
Parameters:

T - arithmetic type. Can be: Float16, Float32, Float64
"""
function compute_macheps(T)
    macheps = T(1.0)

    while T(macheps) / T(2.0) + T(1.0) > T(1.0)
        macheps /= T(2.0)
    end

    return macheps
end

"""
Function computes eta for given arithmetic.
Parameters:

T - arithmetic type. Can be: Float16, Float32, Float64
"""
function compute_eta(T)
    eta = T(1.0)

    while eta / T(2.0) != T(0.0)
        eta /= T(2.0)
    end

    return eta
end

"""
Function computes maximal allowed value for given arithmetic.
Parameters:

T - arithmetic type. Can be: Float16, Float32, Float64
"""
function compute_max(T)
    max = T(1.0)

    while !isinf(max * T(2.0))
        max *= T(2.0)
    end
    max *= (T(2.0) - eps(T))
    return max
end

#Computing macheps
println("Float16: ", eps(Float16))
println("Coputed macheps: ", compute_macheps(Float16))

println("Float32: ", eps(Float32))
println("Coputed macheps: ", compute_macheps(Float32))

println("Float64: ", eps(Float64))
println("Coputed macheps: ", compute_macheps(Float64), "\n\n")

#Computing eta
println("Eta16: ", nextfloat(Float16(0.0)))
println("Computed eta: ", compute_eta(Float16))

println("Eta32: ", nextfloat(Float32(0.0)))
println("Computed eta: ", compute_eta(Float32))

println("Eta64: ", nextfloat(Float64(0.0)))
println("Computed eta: ", compute_eta(Float64), "\n\n")

#Computing max
println("Max16: ", realmax(Float16))
println("Computed max: ", compute_max(Float16))

println("Max32: ", realmax(Float32))
println("Computed max: ", compute_max(Float32))

println("Max64: ", realmax(Float64))
println("Computed max: ", compute_max(Float64))