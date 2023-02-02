export as_i8, as_u16, as_i16, as_i32, as_u32, as_i64, as_u64, as_f16, as_f32, as_f64

"""
Convert the first item in a collection of bytes to Int8
"""
@views as_i8(bytes) = only(reinterpret(Int8, first(bytes)))

"""
Convert the first 2 items in a collection of bytes to UInt16
"""
@views as_u16(bytes) = only(reinterpret(UInt16, bytes[1:2]))

"""
Convert the first 2 items in a collection of bytes to Int16
"""
@views as_i16(bytes) = only(reinterpret(Int16, bytes[1:2]))

"""
Convert the first 4 items in a collection of bytes to UInt32
"""
@views as_u32(bytes) = only(reinterpret(UInt32, bytes[1:4]))

"""
Convert the first 4 items in a collection of bytes to Int32
"""
@views as_i32(bytes) = only(reinterpret(Int32, bytes[1:4]))

"""
Convert the first 8 items in a collection of bytes to UInt64
"""
@views as_u64(bytes) = only(reinterpret(UInt64, bytes[1:8]))

"""
Convert the first 8 items in a collection of bytes to Int64
"""
@views as_i64(bytes) = only(reinterpret(Int64, bytes[1:8]))

"""
Convert the first 2 items in a collection of bytes to Float16
"""
@views as_f16(bytes) = only(reinterpret(Float16, bytes[1:2]))

"""
Convert the first 4 items in a collection of bytes to Float32
"""
@views as_f32(bytes) = only(reinterpret(Float32, bytes[1:4]))

"""
Convert the first 8 items in a collection of bytes to Float64
"""
@views as_f64(bytes) = only(reinterpret(Float64, bytes[1:8]))