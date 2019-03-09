# Jakub Gogola 236412
# Module with functions to compute interpolation polynomials

module Interpolation
    include("./zad1/zad1.jl")
    include("./zad2/zad2.jl")
    include("./zad3/zad3.jl")
    include("./zad4/zad4.jl")

    using PyPlot

    export ilorazyRoznicowe, warNewton, naturalna, rysujNnfx
end