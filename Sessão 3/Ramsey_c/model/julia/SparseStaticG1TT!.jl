function SparseStaticG1TT!(T::Vector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real})
    SparseStaticResidTT!(T, y, x, params)
@inbounds begin
T[3] = get_power_deriv(y[2],params[1],1)
T[4] = get_power_deriv(y[2],params[1]-1,1)
T[5] = get_power_deriv(y[7]*(1+params[1]*y[5]*T[2]-params[2]),1/params[3],1)
end
    return nothing
end

