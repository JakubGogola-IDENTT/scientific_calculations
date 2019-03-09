# Jakub Gogola 236412
# Lista 2., zadanie 6.

using PyPlot
# using Plots

"""
This function computes value of given functions in 40 iterations.
Parameters:
c - given constant
x0 - begining x
"""
function compute_function(c, x0)
    Y = []
    prev = x0
    for i in 1:40
        x = prev^(2.0) + c
        push!(Y, x)
        prev = x
    end

    return Y
end

"""
This function generates plot for given function
Parameters:
num - number of plot
X - array of arguments
Y - array of function's values
c - given constant
x0 - begining x
"""
function gen_plot(num, X, Y, c, x0)
    file_name = string(num, "_plot_", c, "_", x0)
    file_name = replace(file_name, "-", "minus")
    file_name = replace(file_name ,".", "")
    file_name = string(file_name, ".png")
    plot_title = string("Wykres ", num, ":  x0 = ", x0, ", c = ", c)
    clf()
    plot(X,Y)
    title(plot_title)
    savefig(file_name)
end

X = 1:40
data = [(-2.0, 1.0), (-2.0, 2.0), (-2.0, 1.99999999999999), 
        (-1.0, 1.0), (-1.0, -1.0), (-1.0, 0.75), (-1, 0.25)]

num = 1
for item in data
    Y = compute_function(item[1], item[2])
    gen_plot(num, X, Y, item[1], item[2])
    num += 1
end