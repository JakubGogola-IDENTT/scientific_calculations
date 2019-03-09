# Jakub Gogola 236412
# lista 2., zadanie 3

include("hilb.jl")
include("matcond.jl")

"""
Function solves Ax = b for Hilbert matrix using Gauss's elimination and inversion methods.
It computes errors for every method.
"""
function hilb_matrix()
    println("**********************************")
    println("Hilbert's matrix")
    println("**********************************\n")
    println("**********************************")
    for i in 1:20
        A = hilb(i)
        x = ones(Float64, i)
        b = A * x 

        gauss_res = A \ b
        inv_res = inv(A) * b
        
        @printf("Size of matrix: %d x %d\n", i, i)
        println("Condition number of matrix: ", cond(A))
        println("Rank number of matrix: ", rank(A))
        
        # Computing errors
        err = norm(gauss_res - x) / norm(x)
        println("Error - Gauss's method: ", err)
        err = norm(inv_res - x) / norm(x)
        println("Error - inversion methos: ", err)
        println("**********************************")
    end
    println()
end

"""
Function solves Ax = b for Random matrix using Gauss's elimination and inversion methods.
It computes errors for every method.
Parameters:
n - number of iterations
c - indicator of matrix's condition
"""
function random_matrix(n, c)
    println("**********************************")
    println("Matrix with random values")
    println("**********************************\n")
    println("**********************************")
    for i in n 
        for j in c
            x = ones(Float64, i)
            A = matcond(i, j)
            b = A * x

            gauss_res = A \ b
            inv_res = inv(A) * b
            @printf("Size of matrix: %d x %d\n", i, i)
            println("Condition number of matrix: ", cond(A))
            println("Rank number of matrix: ", rank(A))
        
            # Computing errors
            err = norm(gauss_res - x) / norm(x)
            println("Error - Gauss's method: ", err)
            err = norm(inv_res - x) / norm(x)
            println("Error - inversion methos: ", err)
            println("**********************************")
        end
    end
end

T = Float64
n = [5, 10, 20]
c = [T(1), T(10), T(10^3), T(10^7), T(10^12), T(10^16)]

hilb_matrix()
random_matrix(n, c)