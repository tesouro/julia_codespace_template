function SparseDynamicG1TT!(T::Vector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real}, steady_state::Vector{<: Real})
    SparseDynamicResidTT!(T, y, x, params, steady_state)
@inbounds begin
T[9] = get_power_deriv(T[2],(-params[11]),1)
T[10] = (-(1/y[42]))
end
    return nothing
end

