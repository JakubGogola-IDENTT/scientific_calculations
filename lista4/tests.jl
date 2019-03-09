# Jakub Gogola 236412
# Tests for programs from folders zad1-zad4

using Interpolation
using Base.Test

# Tests for zad1
x1 = [3.0, 1.0, 5.0, 6.0]
f1 = [1.0, -3.0, 2.0, 4.0]
expected_output_1 = [1.0, 2.0, -3.0/8.0, 7.0/40.0]

x2 = [-1.0, 0.0, 1.0, 2.0, 3.0]
f2 = [2.0, 1.0, 2.0, -7.0, 10.0]
expected_output_2 = [2.0, -1.0, 1.0, -2.0, 2.0]

@testset "Difference quotient tests" begin
    @test isapprox(ilorazyRoznicowe(x1, f1), expected_output_1)
    @test isapprox(ilorazyRoznicowe(x2, f2), expected_output_2)
end

# Tests for zad2
fx2 = ilorazyRoznicowe(x2, f2)

@testset "Value of Newton's polynomial test" begin
    @test isapprox(warNewton(x2, fx2, 2.0), -7.0)
    @test isapprox(warNewton(x2, fx2, 10.0), 13961.0)
    @test isapprox(warNewton(x2, fx2, 5.0), 506.0)
    @test isapprox(warNewton(x2, fx2, -3.0), 298.0)
end

# Tests for zad3
expected_output_3 = [1.0, 6.0, -1.0, -6.0, 2.0]
@testset "Coefficients of natural form of Newton's polynomial test" begin
    @test isapprox(naturalna(x2, fx2), expected_output_3)
end