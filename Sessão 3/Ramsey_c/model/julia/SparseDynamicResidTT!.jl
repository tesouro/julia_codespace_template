function SparseDynamicResidTT!(T::Vector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real}, steady_state::Vector{<: Real})
@inbounds begin
T[1] = y[2]^params[1]
T[2] = y[2]^(params[1]-1)
T[3] = y[9]^(params[1]-1)
T[4] = y[14]*(1+params[1]*y[19]*T[3]-params[2])
end
    return nothing
end

