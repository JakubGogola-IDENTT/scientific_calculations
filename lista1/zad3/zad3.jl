# Jakub Gogola 236412
# Lista 1., zadanie 3.

"""
Functions checks if shift between two numbers in given partition is delta.
Computations in aritmetic Float64.
Parameters:

down - starting value of partition
t - number of digits in mantissa
steps - number of numbers to print
"""
function num_shift(down, delta, steps)
    for k in 1:steps
        x = Float64(down) + k * delta
        println(bits(x))
    end
end

steps = 8
t = -53

i = 0.5
while i <= 2.0
    println("[", i, ";", 2 * i, "]")
    delta = Float64(2.0) ^ Float64(t)
    num_shift(i, delta, steps)
    i *= 2
    t += 1
    println()
end
