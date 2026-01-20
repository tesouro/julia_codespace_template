function SparseDynamicG1TT!(T::Vector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real}, steady_state::Vector{<: Real})
    SparseDynamicResidTT!(T, y, x, params, steady_state)
@inbounds begin
T[9] = get_power_deriv(y[25]+params[18]*y[41],(-1),1)
T[10] = get_power_deriv(y[49]+params[18]*y[65],(-1),1)
T[11] = (-(1/y[30]))
end
    return nothing
end

