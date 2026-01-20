function SparseDynamicResidTT!(T::Vector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real}, steady_state::Vector{<: Real})
@inbounds begin
T[1] = (y[28]+params[18]*y[44])^(-1)
T[2] = params[1]*(y[55]+params[18]*y[71])^(-1)
T[3] = T[2]*(1+y[39])/(1+y[66])
T[4] = (1+y[39])*(1-params[4])/params[4]/(1-y[40])
T[5] = y[4]^params[2]
T[6] = y[36]*T[5]
T[7] = y[30]^(1-params[2])
T[8] = y[46]^params[19]
end
    return nothing
end

