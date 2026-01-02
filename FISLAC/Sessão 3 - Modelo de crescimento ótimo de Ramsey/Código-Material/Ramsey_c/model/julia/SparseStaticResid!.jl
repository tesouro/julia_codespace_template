function SparseStaticResid!(T::Vector{<: Real}, residual::AbstractVector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real})
    @assert length(T) >= 0
    @assert length(residual) == 7
    @assert length(y) == 7
    @assert length(x) == 2
    @assert length(params) == 12
@inbounds begin
    residual[1] = (y[3]) - ((1-params[1])*y[5]*y[2]^params[1]);
    residual[2] = (y[4]) - (params[1]*y[5]*y[2]^(params[1]-1)-params[2]);
    residual[3] = (1) - (1-params[2]+y[5]*y[2]^(params[1]-1)-y[1]/y[2]);
    residual[4] = (1) - ((y[7]*(1+params[1]*y[5]*y[2]^(params[1]-1)-params[2]))^(1/params[3]));
    residual[5] = (y[6]) - (y[5]*y[2]^params[1]);
    residual[6] = (log(y[5])) - (log(y[5])*params[4]+(1-params[4])*log(params[6])+x[1]);
    residual[7] = (log(y[7])) - (log(y[7])*params[5]+(1-params[5])*log(params[7])+x[2]);
end
    return nothing
end

