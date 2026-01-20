function SparseDynamicG1TT!(T::Vector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real}, steady_state::Vector{<: Real})
    SparseDynamicResidTT!(T, y, x, params, steady_state)
@inbounds begin
T[9] = get_power_deriv(y[27]+params[19]*y[43],(-1),1)
T[10] = get_power_deriv(y[53]+params[19]*y[69],(-1),1)
T[11] = (-(1/y[32]))
end
    return nothing
end

