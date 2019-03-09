# Jakub Gogola 236412
# Lista 1., zadanie 4.

"""
Functions finds the smallest number which added to 1.0 gives number greater than 1.0.
Arithmetic is Float64.
"""
function find_smallest_num()
    x = nextfloat(Float64(1.0))

    while Float64(x * (Float64(1.0) / x)) == Float64(1.0) && x < Float64(2.0)
       x = nextfloat(x) 
       # println(x)
    end

    return x
end

println(find_smallest_num())