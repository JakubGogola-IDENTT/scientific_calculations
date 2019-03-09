using Interpolation

x = [-1.0, 0.0, 1.0, 2.0]
f_x = [-1.0, 0.0, -1.0, 2.0]

res = ilorazyRoznicowe(x, f_x)

println("Natural form: ")
println(naturalna(x, res))

