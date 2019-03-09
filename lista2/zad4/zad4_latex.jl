# Jakub Gogola 236412
# Lista 2., zadanie 4.

using Polynomials

function compute_roots(coeff)
    # Polynomials.Poly needs coefficients in reversed order, so
    # we reverse array with them.
    rev_coeff = coeff[end:-1:1]
    canonical_polynomial = Poly(rev_coeff)
    println("\nPolynomial: ", canonical_polynomial)
    computed_roots = roots(canonical_polynomial)
    #println("\nRoots: ", computed_roots)
    println("\nRoots:")
    # computed_roots = computed_roots[end:-1:1]
    for r in computed_roots
        if (typeof(r) == Float64)
            @printf("%.15f\n", r)
        else 
            println(r)
        end
    end
    #canonical_polynomial = canonical_polynomial[end:-1:1]
    # Computing P(z_k) - Wilkinson's polynomial in canonical versioninfo
    println("\n**** P(z_k) ****")
    P = zeros(20)
    for k in 1:20
        P[k] = abs(polyval(canonical_polynomial, computed_roots[k]))
        #println("|P[z_", k, "]| = ", P)
    end

     # Generate roots of Wilkinson's polynomial
     std_roots = zeros(20)
     for i in 1:20
         std_roots[i] = Float64(i)
     end
     prod_polynomial = poly(std_roots)
     println(prod_polynomial)
     println("\nPolynomial: ", prod_polynomial)
     #prod_polynomial = prod_polynomial[end:-1:1]
     println("\n**** p(z_k) ****")
     p = zeros(20)
     for k in 1:20
        p[k] = abs(polyval(prod_polynomial, computed_roots[k]))
        #println("|p[z_", k, "]| = ", p)
     end

     std_roots = std_roots[end:-1:1]
     println("\n**** |z_k - k| ****")
     diff = zeros(20)
     for k in 1:20
        diff[k] = abs(computed_roots[k] - std_roots[k])
        #println("|z_", k, " - ", k, "| = ", diff)
     end
     computed_roots = computed_roots[end:-1:1]
     P = P[end:-1:1]
     p = p[end:-1:1]
     diff = diff[end:-1:1]

     for k in 1:20
        println("\$", k, "\$ & \$", P[k], "\$ & \$", p[k], "\$ & \$", diff[k], "\$ \\\\ \\hline")
        #@printf("\$ %d \$ & \$ %e \$ & \$ %e \$ & \$ %e \$ & \\\\ \\hline\n", k, P[k], p[k], diff[k])
     end

     println("******************************")
     for k in 1:20
         println("\$", k, "\$ & \$", computed_roots[k], "\$ & \$", P[k], "\$ & \$", p[k], "\$ & \$", diff[k], "\$ \\\\ \\hline")
        #@printf("\$ %d \$ & \$ %e \$ & \$ %e \$ & \$ %e \$ & \$ %e \$ & \\\\ \\hline\n", k,
        #computed_roots, P[k], p[k], diff[k])
     end
end


# Standard coefficients
coeff_std = [1, -210.0, 20615.0,-1256850.0,
    53327946.0,-1672280820.0, 40171771630.0, -756111184500.0,          
    11310276995381.0, -135585182899530.0,
      1307535010540395.0,     -10142299865511450.0,
      63030812099294896.0,     -311333643161390640.0,
      1206647803780373360.0,     -3599979517947607200.0,
      8037811822645051776.0,      -12870931245150988800.0,
      13803759753640704000.0,      -8752948036761600000.0,
      2432902008176640000.0]

# Generating coefficients with Wilkinson's modification
coeff_mod = copy(coeff_std)
coeff_mod[2] = -210.0 - (1.0/(2.0^23))

println("**** Standrad polynomial ****")
compute_roots(coeff_std)

println("\n\n**** Polynomial with Wilkinson's modification ****")
compute_roots(coeff_mod)

