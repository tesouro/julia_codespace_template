function SparseStaticG1TT!(T::Vector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real})
    SparseStaticResidTT!(T, y, x, params)
@inbounds begin
T[7] = get_power_deriv(y[1]+params[19]*y[17],(-1),1)
T[8] = (-(1/y[6]))
end
    return nothing
end

