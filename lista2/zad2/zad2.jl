# Jakub Gogola 236412
# Lista 2., zadanie 2
using SymPy
using PyPlot

"""
Definition of function f
"""
f(x)= exp.(x) * log.(1.0 + exp.(-x))

x = symbols("x")

# Computing limit of f(x) with x going to infinity.
l = limit(f(x), x, oo)

# Printing result.
println(" lim  f(x) = ", l)
println("x->oo")

"""
Function which generates plot of function f(x)
Parameters:

start - begining of part of domain
stop - end of part of domain
"""
function gen_plot(start, stop)
    X = []
    Y = []

    for i in start:stop
        push!(X, Float64(i))
    end

    for x in X
        push!(Y, f(x))
    end

    clf()
    plot(X, Y)
    title("Zadanie 2")
    file_name = string("pyplot_", abs(start), "_", abs(stop), ".png")
    savefig(file_name)
end

gen_plot(-10, 100)
gen_plot(30, 40)