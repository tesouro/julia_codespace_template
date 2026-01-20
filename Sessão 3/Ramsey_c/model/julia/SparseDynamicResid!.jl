function SparseDynamicResid!(T::Vector{<: Real}, residual::AbstractVector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real}, steady_state::Vector{<: Real})
    @assert length(T) >= 4
    @assert length(residual) == 7
    @assert length(y) == 21
    @assert length(x) == 2
    @assert length(params) == 12
@inbounds begin
    residual[1] = (y[10]) - ((1-params[1])*y[12]*T[1]);
    residual[2] = (y[11]) - (params[1]*y[12]*T[2]-params[2]);
    residual[3] = (y[9]/y[2]) - (1-params[2]+y[12]*T[2]-y[8]/y[2]);
    residual[4] = (y[15]/y[8]) - (T[4]^(1/params[3]));
    residual[5] = (y[13]) - (y[12]*T[1]);
    residual[6] = (log(y[12])) - (params[4]*log(y[5])+(1-params[4])*log(params[6])+x[1]);
    residual[7] = (log(y[14])) - (params[5]*log(y[7])+(1-params[5])*log(params[7])+x[2]);
end
    return nothing
end

