# Jakub Gogola 236412
# Lista 4., zadanie 4.

using PyPlot

"""
This function interpolates given function if in interval [a, b] using 
Newton's interpolation polynomial with degree n and draws plots of
given function f and interpolation polynomial.

Parameters:
f - given function to interpolate
a - start of interval; is Float64
b - end of interval; is Float64
n - degree of interpolation polynomial

Return:
None (function draws plots of given function f and interpolaton polynomial)
"""
function rysujNnfx(f, a::Float64, b::Float64, n::Int)
    x = Vector{Float64}(n + 1)
    y = Vector{Float64}(n + 1)
    f_x = Vector{Float64}(n + 1)

    max_nodes = n + 1
    
    h = (b - a) / n
    kh = Float64(0.0)

    mult = 20
    
    plot_args = Vector{Float64}(mult * max_nodes)
    plot_val = Vector{Float64}(mult * max_nodes)
    plot_ip = Vector{Float64}(mult * max_nodes)

    for i = 1:max_nodes
        x[i] = a + kh
        y[i] = f(x[i])
        kh += h
    end

    f_x = ilorazyRoznicowe(x, y)

    kh = Float64(0.0)
    max_nodes *= mult
    h = (b - a) / (max_nodes - 1)

    for i = 1:max_nodes
        plot_args[i] = a + kh
        plot_ip[i] = warNewton(x, f_x, plot_args[i])
        plot_val[i] = f(plot_args[i])
        kh += h
    end

    filename = string("plot_", f, "_", n, ".png")
    clf()
    plot(plot_args, plot_val, label="f(x)", linewidth=1.0)
    plot(plot_args, plot_ip, label="w(x)", linewidth=1.0)
    grid(true)
    legend(loc=2,borderaxespad=0)
    title(string("Interpolation: n = ", n))
    savefig(filename)
end