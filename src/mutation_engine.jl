export mutation_engine

function mutation_engine(c::Channel, args...)
    # Can't do strings for now
    any(x -> isa(x, String), args) && throw(ArgumentError("Can't produce random strings yet"))

    # Gather the types of each argument
    types = typeof.(args)

    # Generate random values of each type for as long as necessary
    while true
        put!(c, rand.(types))
    end
end
