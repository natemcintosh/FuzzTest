using Test
using FuzzTest

@testset "hypotenuse is short" begin
    # Test that the hypotenuse of a right triangle is shorter than the sum of the two
    # sides

    # Create the channel from which we'll receive new random values
    c = Channel()

    # Start the task of generating new random inputs
    @async mutation_engine(c, 3.14, 5.6)

    # Generate n random inputs
    for idx = 1:10_000
        # Take from the channel, and make the values positive
        vals = abs.(take!(c))

        @test hypot(vals[1], vals[2]) < sum(vals)
    end
end

@testset "non-working types" begin    
    @test_throws ArgumentError mutation_engine(Channel(), "hello")
end
