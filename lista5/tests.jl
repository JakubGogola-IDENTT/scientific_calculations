# Jakub Gogola 236412
# Lista 5., testy dla zaimplementownych funkcji z zadan 1-3

using blocksys
using matrixgen
using Base.Test
using PyPlot

# Sizes of matrices to generate
mat_sizes = [1000, 2000, 5000, 10000, 20000, 25000, 30000, 50000]
sub_size = 4
cond = Float64(1.0)

# Tests results
times_gauss = Vector{Float64}(length(mat_sizes))
times_gauss_choose = Vector{Float64}(length(mat_sizes))
times_lu = Vector{Float64}(length(mat_sizes))
times_lu_choose = Vector{Float64}(length(mat_sizes))
times_lu_solve = Vector{Float64}(length(mat_sizes))
times_lu_choose_solve = Vector{Float64}(length(mat_sizes))

memory_gauss = Vector{Float64}(length(mat_sizes))
memory_gauss_choose = Vector{Float64}(length(mat_sizes))
memory_lu = Vector{Float64}(length(mat_sizes))
memory_lu_choose = Vector{Float64}(length(mat_sizes))
memory_lu_solve = Vector{Float64}(length(mat_sizes))
memory_lu_choose_solve = Vector{Float64}(length(mat_sizes))

operations_gauss = Vector{Float64}(length(mat_sizes))
operations_gauss_choose = Vector{Float64}(length(mat_sizes))
operations_lu = Vector{Float64}(length(mat_sizes))
operations_lu_choose = Vector{Float64}(length(mat_sizes))
operations_lu_solve = Vector{Float64}(length(mat_sizes))
operations_lu_choose_solve = Vector{Float64}(length(mat_sizes))


for i = 1:length(mat_sizes)

    # Generating matrix for tests
    blockmat(mat_sizes[i], sub_size, cond, "test_matrix.txt")
    println("Matrix size: ", mat_sizes[i])
    println("Submatrices size: ", sub_size)

    # Loading generated matrix and computing vector of right sides
    matrix = load_matrix("test_matrix.txt")
    vec = generate_right_side_vector(matrix[1], matrix[2], matrix[3])

    #### Gauss
    results = @timed solve_gauss(matrix[1], vec, matrix[2], matrix[3])
    
    times_gauss[i] = results[2] 
    memory_gauss[i] = results[3]
    operations_gauss[i] = mat_sizes[i] * sub_size^2 + 2 * mat_sizes[i]

    # Loading generated matrix and computing vector of right sides
    matrix = load_matrix("test_matrix.txt")
    vec = generate_right_side_vector(matrix[1], matrix[2], matrix[3])

    #### Gauss with choose
    results = @timed solve_gauss_with_choose(matrix[1], vec, matrix[2], matrix[3])
    
    times_gauss_choose[i] = results[2]
    memory_gauss_choose[i] = results[3]
    operations_gauss_choose[i] = mat_sizes[i] * sub_size^3 + 2 * mat_sizes[i]

    # Loading generated matrix and computing vector of right sides
    matrix = load_matrix("test_matrix.txt")
    vec = generate_right_side_vector(matrix[1], matrix[2], matrix[3])

    #### LU
    results = @timed lu_decomposition(matrix[1], vec, matrix[2], matrix[3])
    data = results[1]

    times_lu[i] = results[2]
    memory_lu[i] = results[3]
    operations_lu[i] = mat_sizes[i] * (sub_size^2 + sub_size)

    results = @timed solve_lu_decomposition(data[1], data[2], matrix[2], matrix[3])
    
    times_lu_solve[i] = results[2] + times_lu[i]
    memory_lu_solve[i] = results[3] + memory_lu[i]
    operations_lu_solve[i]  = mat_sizes[i] * (sub_size^2 + sub_size) + 2 * mat_sizes[i] * sub_size

    #### LU with choose

    # Loading generated matrix and computing vector of right sides
    matrix = load_matrix("test_matrix.txt")
    vec = generate_right_side_vector(matrix[1], matrix[2], matrix[3])

    results = @timed lu_decomposition_with_choose(matrix[1], vec, matrix[2], matrix[3])
    data = results[1]

    times_lu_choose[i] = results[2]
    memory_lu_choose[i] = results[3]
    operations_lu_choose[i]  = mat_sizes[i] * (sub_size^3 + sub_size)

    results = @timed solve_lu_decomposition_with_choose(data[1], data[2], data[3], matrix[2], matrix[3])
    
    times_lu_choose_solve[i] = results[2] + times_lu_choose[i]
    memory_lu_choose_solve[i] = results[3] + memory_lu_choose[i]
    operations_lu_choose_solve[i] = mat_sizes[i] * (sub_size^3 + sub_size) + 2 * mat_sizes[i] * sub_size
end

#### Solving
# Generate plots
clf()
plot(mat_sizes, times_gauss, label="Gauss", linewidth=1.0)
plot(mat_sizes, times_gauss_choose, label="Gauss with choose", linewidth=1.0)
plot(mat_sizes, times_lu_solve, label="LU", linewidth=1.0)
plot(mat_sizes, times_lu_choose_solve, label="LU with choose", linewidth=1.0)
grid(true)
legend(loc=2,borderaxespad=0)
title("Times of computing (solving methods)")
savefig("times_solving.png")

# Genete plots
clf()
plot(mat_sizes, memory_gauss, label="Gauss", linewidth=1.0)
plot(mat_sizes, memory_gauss_choose, label="Gauss with choose", linewidth=1.0)
plot(mat_sizes, memory_lu_solve, label="LU", linewidth=1.0)
plot(mat_sizes, memory_lu_choose_solve, label="LU with choose", linewidth=1.0)
grid(true)
legend(loc=2,borderaxespad=0)
title("Used memory (solving methods)")
savefig("memory_solving.png")

clf()
plot(mat_sizes, operations_gauss, label="Gauss", linewidth=1.0)
plot(mat_sizes, operations_gauss_choose, label="Gauss with choose", linewidth=1.0)
plot(mat_sizes, operations_lu_solve, label="LU", linewidth=1.0)
plot(mat_sizes, operations_lu_choose_solve, label="LU with choose", linewidth=1.0)
grid(true)
legend(loc=2,borderaxespad=0)
title("Operations")
savefig("operations_solving.png")

#### Only LU
# Generate plots
clf()
plot(mat_sizes, times_lu, label="Gauss", linewidth=1.0)
plot(mat_sizes, times_lu_choose, label="Gauss with choose", linewidth=1.0)
grid(true)
legend(loc=2,borderaxespad=0)
title("Times of computing (only LU)")
savefig("times_lu.png")

# Genete plots
clf()
plot(mat_sizes, memory_lu, label="Gauss", linewidth=1.0)
plot(mat_sizes, memory_lu_choose, label="Gauss with choose", linewidth=1.0)
grid(true)
legend(loc=2,borderaxespad=0)
title("Used memory (only LU)")
savefig("memory_lu.png")

clf()
plot(mat_sizes, operations_lu, label="Gauss", linewidth=1.0)
plot(mat_sizes, operations_lu_choose, label="Gauss with choose", linewidth=1.0)
grid(true)
legend(loc=2,borderaxespad=0)
title("Operations (only LU)")
savefig("operations_lu.png")


########### UNIT Tests

@testset "16x16" begin
    matrix = load_matrix("test_data/Dane16_1_1/A.txt")
    vec = load_vector("test_data/Dane16_1_1/b.txt")
    results = ones(16)

    @test isapprox(solve_gauss(matrix[1], vec[1], matrix[2], matrix[3]), results)

    matrix = load_matrix("test_data/Dane16_1_1/A.txt")
    vec = load_vector("test_data/Dane16_1_1/b.txt")
    @test isapprox(solve_gauss_with_choose(matrix[1], vec[1], matrix[2], matrix[3]),  results)

    matrix = load_matrix("test_data/Dane16_1_1/A.txt")
    vec = load_vector("test_data/Dane16_1_1/b.txt")
    tmp = lu_decomposition(matrix[1], vec[1], matrix[2], matrix[3])
    @test isapprox(solve_lu_decomposition(tmp[1], vec[1], matrix[2], matrix[3]),  results)

    matrix = load_matrix("test_data/Dane16_1_1/A.txt")
    vec = load_vector("test_data/Dane16_1_1/b.txt")
    tmp = lu_decomposition_with_choose(matrix[1], vec[1], matrix[2], matrix[3])
    @test isapprox(solve_lu_decomposition_with_choose(tmp[1], tmp[2], vec[1], matrix[2], matrix[3]),  results)
end

@testset "10kx10k" begin
    matrix = load_matrix("test_data/Dane10000_1_1/A.txt")
    vec = load_vector("test_data/Dane10000_1_1/b.txt")
    results = ones(10000)

    @test isapprox(solve_gauss(matrix[1], vec[1], matrix[2], matrix[3]), results)

    matrix = load_matrix("test_data/Dane10000_1_1/A.txt")
    vec = load_vector("test_data/Dane10000_1_1/b.txt")
    @test isapprox(solve_gauss_with_choose(matrix[1], vec[1], matrix[2], matrix[3]),  results)

    matrix = load_matrix("test_data/Dane10000_1_1/A.txt")
    vec = load_vector("test_data/Dane10000_1_1/b.txt")
    tmp = lu_decomposition(matrix[1], vec[1], matrix[2], matrix[3])
    @test isapprox(solve_lu_decomposition(tmp[1], vec[1], matrix[2], matrix[3]),  results)

    matrix = load_matrix("test_data/Dane10000_1_1/A.txt")
    vec = load_vector("test_data/Dane10000_1_1/b.txt")
    tmp = lu_decomposition_with_choose(matrix[1], vec[1], matrix[2], matrix[3])
    @test isapprox(solve_lu_decomposition_with_choose(tmp[1], tmp[2], vec[1], matrix[2], matrix[3]),  results)
end

@testset "50kx50k" begin
matrix = load_matrix("test_data/Dane50000_1_1/A.txt")
vec = load_vector("test_data/Dane50000_1_1/b.txt")
results = ones(50000)

@test isapprox(solve_gauss(matrix[1], vec[1], matrix[2], matrix[3]), results)

matrix = load_matrix("test_data/Dane50000_1_1/A.txt")
vec = load_vector("test_data/Dane50000_1_1/b.txt")
@test isapprox(solve_gauss_with_choose(matrix[1], vec[1], matrix[2], matrix[3]),  results)

matrix = load_matrix("test_data/Dane50000_1_1/A.txt")
vec = load_vector("test_data/Dane50000_1_1/b.txt")
tmp = lu_decomposition(matrix[1], vec[1], matrix[2], matrix[3])
@test isapprox(solve_lu_decomposition(tmp[1], vec[1], matrix[2], matrix[3]),  results)

matrix = load_matrix("test_data/Dane50000_1_1/A.txt")
vec = load_vector("test_data/Dane50000_1_1/b.txt")
tmp = lu_decomposition_with_choose(matrix[1], vec[1], matrix[2], matrix[3])
@test isapprox(solve_lu_decomposition_with_choose(tmp[1], tmp[2], vec[1], matrix[2], matrix[3]),  results)
end