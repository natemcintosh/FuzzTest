using Test
using FuzzTest

@testset "Conversions" begin
    b1 = UInt8[0]
    b2 = UInt8[0, 0]
    b4 = UInt8[0, 0, 0, 0]
    b8 = UInt8[0, 0, 0, 0, 0, 0, 0, 0]

    @testset "zeros" begin
        @test as_i8(b1) === Int8(0)

        @test as_i16(b2) === Int16(0)
        @test as_u16(b2) === UInt16(0)
        @test as_f16(b2) === Float16(0)

        @test as_i32(b4) === Int32(0)
        @test as_u32(b4) === UInt32(0)
        @test as_f32(b4) === Float32(0)

        @test as_i64(b8) === Int64(0)
        @test as_u64(b8) === UInt64(0)
        @test as_f64(b8) === Float64(0)
    end
end