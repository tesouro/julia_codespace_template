function SparseDynamicG1TT!(T::Vector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real}, steady_state::Vector{<: Real})
    SparseDynamicResidTT!(T, y, x, params, steady_state)
@inbounds begin
T[9] = get_power_deriv(y[28]+params[18]*y[44],(-1),1)
T[10] = get_power_deriv(y[55]+params[18]*y[71],(-1),1)
T[11] = (-(1/y[33]))
end
    return nothing
end

