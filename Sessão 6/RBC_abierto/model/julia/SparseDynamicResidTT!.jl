function SparseDynamicResidTT!(T::Vector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real}, steady_state::Vector{<: Real})
@inbounds begin
T[1] = y[39]^params[8]
T[2] = y[37]+params[4]*y[55]-params[7]*y[39]^(1+params[8])/(1+params[8])
T[3] = T[2]^(-params[11])
T[4] = y[4]^params[2]
T[5] = y[46]*T[4]
T[6] = y[39]^(1-params[2])
T[7] = y[57]^params[5]
T[8] = exp(y[64]/y[42]-params[29]/params[30])
end
    return nothing
end

