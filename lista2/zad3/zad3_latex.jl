# Jakub Gogola 236412
# lista 2., zadanie 3

include("hilb.jl")
include("matcond.jl")

"""
    blahblahblah
"""
function hilb_matrix()
    for i in 1:20
        A = hilb(i)
        x = ones(Float64, i)
        b = A * x 

        gauss_res = A \ b
        inv_res = inv(A) * b
        err_g = norm(gauss_res - x) / norm(x)
        err_i = norm(inv_res - x) / norm(x)
        
        #@printf("\$%d\$ & \$%e\$ & \$%e\$ & \$%e\$ \\\\ \\hline\n", 
        #        i, cond(A), err_g, err_i)
        println("\$", i, "\$ & \$", cond(A), "\$ & \$", err_g, "\$ & \$", err_i, 
                "\$ \\\\ \\hline")

    end
    println()
end

function random_matrix(n, c)
    for i in n 
        for j in c
            x = ones(Float64, i)
            A = matcond(i, j)
            b = A * x

            gauss_res = A \ b
            inv_res = inv(A) * b
        
            # Computing errors
            err_g = norm(gauss_res - x) / norm(x)
            err_i = norm(inv_res - x) / norm(x)

            
            #@printf("\$%d\$ & \$%e\$ & \$%e\$ & \$%e\$ \\\\ \\hline\n", 
            #    i, j, err_g, err_i)
            println("\$", i, "\$ & \$", j, "\$ & \$", err_g, "\$ & \$", err_i, 
                "\$ \\\\ \\hline")
        end
    end
end

T = Float64
n = [5, 10, 20]
c = [T(1), T(10), T(10^3), T(10^7), T(10^12), T(10^16)]

hilb_matrix()
random_matrix(n, c)