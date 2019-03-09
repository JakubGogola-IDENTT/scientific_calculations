# Jakub Gogola 236412
# Lista 2., zadanie 6.

using PyPlot
# using Plots

function calc_fucntion(c, x0)
    Y = []
    prev = x0
    for i in 1:40
        x = prev^(2.0) + c
        push!(Y, x)
        prev = x
    end

    return Y
end

function gen_plot(X, Y, c, x0)
    file_name = string("plot_", c, "_", x0)
    file_name = replace(file_name, "-", "minus")
    file_name = replace(file_name ,".", "")
    file_name = string(file_name, ".png")
    plot_title = string("x0 = ", x0, ", c = ", c)
    clf()
    plot(X,Y)
    title(plot_title)
    savefig(file_name)
end

X = 1:40
data = [(-2.0, 1.0), (-2.0, 2.0), (-2.0, 1.99999999999999), 
        (-1.0, 1.0), (-1.0, -1.0), (-1.0, 0.75), (-1, 0.25)]

res = []
for item in data
    Y = calc_fucntion(item[1], item[2])
    push!(res, Y)
    #gen_plot(X, Y, item[1], item[2])
end

for i in 1:40
    str = string("\$", i, "\$ & ")
    for arr in res
        if (arr != res[length(res)])
            str = string(str, "\$", arr[i], "\$ &")
        else 
            str = string(str, "\$", arr[i], "\$ ")
        end
    end
    str = string(str, "\\\\ \\hline")
    @printf("%s\n", str)
end
