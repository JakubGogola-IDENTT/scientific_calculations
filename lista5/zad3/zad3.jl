# Jakub Gogola 236412
# Lista 5., zadanie 3.

include("../zad2/zad2.jl")

"""
Solves set of linear equations using LU decomposition.
LU decompistion was computed using gaussian elimination.

Parameters:
A - matrix; is Sparse Matrix; is SparseMatrixCSC{Float64, Int64}
b - vector with values; is Vector{Float64}
n - size of matrix A; is Int64
l - size of submatrices of A; is Int64

Return:
x - vector with solutions; is Vector{Float64}
"""
function solve_lu_decomposition(A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64}, n::Int64, l::Int64) 
    # b vector aftermultiplieng by multipliers
    modified_b = Vector{Float64}(n)

    # Solving upper matrix
    for i = 1:n
        sum_from_row = Float64(0.0)

        for j = max(1, Int64(l * floor((i - 1) / l))):i - 1
            sum_from_row += A[j, i] * modified_b[j]
        end

        modified_b[i] = b[i] - sum_from_row

    end

    x = Vector{Float64}(n)

    # Iteration trough rows
    for i = n:-1:1
        sum_from_row = Float64(0.0)

        #Iteration trough columns
        for j = i + 1:min(n, i + l + 1)
            sum_from_row += A[j, i] * x[j]
        end
        x[i] = (modified_b[i] - sum_from_row) / A[i, i]
    end

    return x

end


"""
Solves set of linear equations using LU decomposition.
LU decompistion was computed using gaussian elimination with choose of main element

Parameters:
A - matrix; is Sparse Matrix; is SparseMatrixCSC{Float64, Int64}
perm - permutation vector; is Vector{Float64}
b - vector with values; is Vector{Float64}
n - size of matrix A; is Int64
l - size of submatrices of A; is Int64

Return:
x - vector with solutions; is Vector{Float64}
"""
function solve_lu_decomposition_with_choose(A::SparseMatrixCSC{Float64, Int64}, perm::Vector{Int64},
                                                b::Vector{Float64}, n::Int64, l::Int64) 
    modified_b = Vector{Float64}(n)

    for i = 1:n
        sum_from_row = Float64(0.0)

        for j = max(1, Int64(l * floor((i - 1) / l)) - 1):i - 1
            sum_from_row += A[j, perm[i]] * modified_b[j]
        end

        modified_b[i] = b[perm[i]] - sum_from_row
    end

    x = Vector{Float64}(n)

    for i = n:-1:1
        sum_from_row = Float64(0.0)

        for j = i + 1:min(i + 2 * l + 1, n)
            sum_from_row += A[j, perm[i]] * x[j]
        end

        x[i] = (modified_b[i] -  sum_from_row) / A[i, perm[i]]
    end

    return x
end