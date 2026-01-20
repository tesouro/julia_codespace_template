function SparseStaticResidTT!(T::Vector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real})
@inbounds begin
T[1] = y[2]^params[1]
T[2] = y[2]^(params[1]-1)
end
    return nothing
end

