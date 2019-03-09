# Jakub Gogola 236412
# Lista 5., zadanie 2.

include("../zad1/zad1.jl")

"""
Computes LU decomposition for given matrix using gaussian elimination

Parameters:
A - matrix; is Sparse Matrix; is SparseMatrixCSC{Float64, Int64}
b - vector with values; is Vector{Float64}
n - size of matrix A; is Int64
l - size of submatrices of A; is Int64

Return:
(A, b) - tuple: A - given matrix after elimination, is SparseMatrixCSC{Float64, Int64};
                b - given vector of right sides after elimination, is Vector{Float64}
"""
function lu_decomposition(A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64}, n::Int64, l::Int64) 
    return gauss(A, b, n, l, true)
end


"""
Computes LU decomposition for given matrix using gaussian elimination with choose of main element

Parameters:
A - matrix; is Sparse Matrix; is SparseMatrixCSC{Float64, Int64}
b - vector with values; is Vector{Float64}
n - size of matrix A; is Int64
l - size of submatrices of A; is Int64

Return:
(A, perm, b) - tuple: A - given matrix after elimination, is SparseMatrixCSC{Float64, Int64};
                perm - permutation vector, is Vector{Float64};
                b - given vector of right sides after elimination, is Vector{Float64}
"""
function lu_decomposition_with_choose(A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64}, n::Int64, l::Int64) 
     return gauss_with_choose(A, b, n, l, true)
end