function SparseDynamicResidTT!(T::Vector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real}, steady_state::Vector{<: Real})
@inbounds begin
T[1] = (y[25]+params[18]*y[41])^(-1)
T[2] = params[1]*(y[49]+params[18]*y[65])^(-1)
T[3] = T[2]*(1+y[36])/(1+y[60])
T[4] = (1+y[36])*(1-params[4])/params[4]/(1-y[37])
T[5] = y[4]^params[2]
T[6] = y[33]*T[5]
T[7] = y[27]^(1-params[2])
T[8] = y[43]^params[19]
end
    return nothing
end

