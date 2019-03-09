# Jakub Gogola 236412
# Lista 1., zadanie 2.

"""
Functions computes machine epsilone using Kahan's method.
T - arithmetic type. Can be: Float16, Float32, Float64.
"""
function kahan_macheps_method(T)
    return T(3.0) * (T(4.0) / T(3.0) - T(1.0)) - T(1.0)
end

println("***Kahan macheps computing method***")
println("Macheps16: ", eps(Float16))
println("Computed macheps: ", kahan_macheps_method(Float16))

println("Macheps32: ", eps(Float32))
println("Computed macheps: ", kahan_macheps_method(Float32))

println("Macheps64: ", eps(Float64))
println("Computed macheps: ", kahan_macheps_method(Float64))