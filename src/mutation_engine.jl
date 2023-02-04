import Base.rand

export mutation_engine

struct WholeRangeFloat16 <: AbstractFloat end
struct WholeRangeFloat32 <: AbstractFloat end
struct WholeRangeFloat64 <: AbstractFloat end

Base.rand(::Type{WholeRangeFloat16}) = reinterpret(Float16, rand(UInt16))
Base.rand(::Type{WholeRangeFloat32}) = reinterpret(Float32, rand(UInt32))
Base.rand(::Type{WholeRangeFloat64}) = reinterpret(Float64, rand(UInt64))

function mutation_engine(c::Channel, args...)
    # Can't do strings for now
    any(x -> isa(x, String), args) &&
        throw(ArgumentError("Can't produce random strings yet"))

    # Gather the types of each argument
    types = collect(typeof.(args))

    # Change out any Float values for WholeRangeFloat values
    replace!(
        types,
        Float16 => WholeRangeFloat16,
        Float32 => WholeRangeFloat32,
        Float64 => WholeRangeFloat64,
    )

    # Generate random values of each type for as long as necessary
    while true
        put!(c, rand.(types))
    end
end
