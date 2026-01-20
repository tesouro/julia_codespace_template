function SparseStaticResidTT!(T::Vector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real})
@inbounds begin
T[1] = (y[1]+params[19]*y[17])^(-1)
T[2] = (1+y[12])*(1-params[4])/params[4]/(1-y[13])
T[3] = y[4]^params[2]
T[4] = y[9]*T[3]
T[5] = y[3]^(1-params[2])
T[6] = y[19]^params[20]
end
    return nothing
end

