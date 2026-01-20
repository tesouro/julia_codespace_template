function SparseDynamicResidTT!(T::Vector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real}, steady_state::Vector{<: Real})
@inbounds begin
T[1] = (y[27]+params[19]*y[43])^(-1)
T[2] = params[1]*(y[53]+params[19]*y[69])^(-1)
T[3] = T[2]*(1+y[38])/(1+y[64])
T[4] = (1+y[38])*(1-params[4])/params[4]/(1-y[39])
T[5] = y[4]^params[2]
T[6] = y[35]*T[5]
T[7] = y[29]^(1-params[2])
T[8] = y[45]^params[20]
end
    return nothing
end

