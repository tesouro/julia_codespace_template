function SparseStaticResidTT!(T::Vector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real})
@inbounds begin
T[1] = y[3]^params[8]
T[2] = y[1]+params[4]*y[19]-params[7]*y[3]^(1+params[8])/(1+params[8])
T[3] = T[2]^(-params[11])
T[4] = y[4]^params[2]
T[5] = y[10]*T[4]
T[6] = y[3]^(1-params[2])
T[7] = y[21]^params[5]
T[8] = exp(y[28]/y[6]-params[29]/params[30])
end
    return nothing
end

