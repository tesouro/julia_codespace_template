function SparseStaticG1TT!(T::Vector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real})
    SparseStaticResidTT!(T, y, x, params)
@inbounds begin
T[9] = get_power_deriv(T[2],(-params[11]),1)
T[10] = (-(1/y[6]))
end
    return nothing
end

