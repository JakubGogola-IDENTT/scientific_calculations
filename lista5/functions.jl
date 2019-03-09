# Jakub Gogola 236412
# Funkcje umożliwiające łatwe testowanie programów

using blocksys
using Base.Test


"""
Tests programs to solve equations set using gaussian elimination
"""
function test_gauss(input_file_matrix::String = "", input_file_vector::String = "", output_file::String = "",
                     with_choose::Bool = false, calc_vec::Bool = false)
    local matrix
    local vec
    local results
    local gen_vec

    if input_file_matrix == ""
        error("Can't open file with matrix")
    else
        matrix = load_matrix(input_file_matrix)
    end

    if !calc_vec
        vec = load_vector(input_file_vector)
        gen_vec = true
    else
        t = generate_right_side_vector(matrix[1], matrix[2], matrix[3])
        gen_vec = false
        vec = (t, 0)
    end

    if with_choose
        results = solve_gauss_with_choose(matrix[1], vec[1], matrix[2], matrix[3])
    else
        results = solve_gauss(matrix[1], vec[1], matrix[2], matrix[3])
    end

    if output_file != ""
        write_results(output_file, results, matrix[2], gen_vec)
    end

    @testset "Test solutions" begin
        @test isapprox(results, ones(matrix[2]))
    end
end


"""
Test progrmas to solve equations set using LU decompositon
"""
function test_lu_decomposition(input_file_matrix::String = "", input_file_vector::String = "", output_file::String = "",
                                with_choose::Bool = false, calc_vec::Bool = false)
    local matrix
    local vec
    local results
    local gen_vec

    if input_file_matrix == ""
        error("Can't open file with matrix")
    else
        matrix = load_matrix(input_file_matrix)
    end

    if !calc_vec
        vec = load_vector(input_file_vector)
        gen_vec = true
    else
        t = generate_right_side_vector(matrix[1], matrix[2], matrix[3])
        gen_vec = false
        vec = (t, 0)
    end

    if with_choose
        tmp = lu_decomposition_with_choose(matrix[1], vec[1], matrix[2], matrix[3])
        results = solve_lu_decomposition_with_choose(tmp[1], tmp[2], vec[1], matrix[2], matrix[3])
    else
        tmp = lu_decomposition(matrix[1], vec[1], matrix[2], matrix[3])
        results = solve_lu_decomposition(tmp[1], vec[1], matrix[2], matrix[3])
    end

    if output_file != ""
        write_results(output_file, results, matrix[2], gen_vec)
    end

    @testset "Test solutions" begin
        @test isapprox(results, ones(matrix[2]))
    end
end



test_gauss("test_data/Dane16_1_1/A.txt", "test_data/Dane8_1_1/b.txt", "out.txt", true, true)
test_lu_decomposition("test_data/Dane8_1_1/A.txt", "test_data/Dane8_1_1/b.txt", "out.txt", true, true)