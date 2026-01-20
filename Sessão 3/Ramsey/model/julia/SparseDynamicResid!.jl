function SparseDynamicResid!(T::Vector{<: Real}, residual::AbstractVector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real}, steady_state::Vector{<: Real})
    @assert length(T) >= 4
    @assert length(residual) == 6
    @assert length(y) == 18
    @assert length(x) == 1
    @assert length(params) == 11
@inbounds begin
    residual[1] = (y[9]) - ((1-params[1])*y[11]*T[1]);
    residual[2] = (y[10]) - (params[1]*y[11]*T[2]-params[3]);
    residual[3] = (y[8]/y[2]) - (1-params[3]+y[11]*T[2]-y[7]/y[2]);
    residual[4] = (y[13]/y[7]) - (T[4]^(1/params[4]));
    residual[5] = (y[12]) - (y[11]*T[1]);
    residual[6] = (log(y[11])) - (params[5]*log(y[5])+(1-params[5])*log(params[6])+x[1]);
end
    return nothing
end

