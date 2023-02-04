using Test
using Random
using FuzzTest

@testset "hypotenuse is short" begin
    # Test that the hypotenuse of a right triangle is shorter than the sum of the two
    # sides

    # Create the channel from which we'll receive new random values
    c = Channel()

    # Start the task of generating new random inputs
    Random.seed!(0)
    @async mutation_engine(c, 3, 5)

    # Generate n random inputs
    for idx = 1:2
        # Take from the channel, and make the values positive
        vals = abs.(take!(c))
        @show vals, sum(vals)

        @test hypot(vals[1], vals[2]) < sum(vals)
        # @test sum(vals) > first(vals)
    end
end

@testset "non-working types" begin    
    @test_throws ArgumentError mutation_engine(Channel(), "hello")
end
