function SparseDynamicResid!(T::Vector{<: Real}, residual::AbstractVector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real}, steady_state::Vector{<: Real})
    @assert length(T) >= 0
    @assert length(residual) == 14
    @assert length(y) == 42
    @assert length(x) == 2
    @assert length(params) == 12
@inbounds begin
    residual[1] = (y[15]) - (params[1]*y[29]+params[12]*y[16]);
    residual[2] = (y[16]) - (y[30]-1/params[4]*(y[21]-y[29]-y[19]));
    residual[3] = (y[21]) - (y[15]*params[6]+y[16]*params[7]+y[24]);
    residual[4] = (y[19]) - ((-params[4])*params[11]*(1-params[2])*y[25]);
    residual[5] = (y[20]) - (y[21]-y[29]);
    residual[6] = (y[17]) - (params[11]*y[25]);
    residual[7] = (y[16]) - (y[18]-y[17]);
    residual[8] = (y[18]) - (y[25]+y[22]);
    residual[9] = (y[27]-y[26]) - (params[4]*y[28]+y[22]*params[5]);
    residual[10] = (y[18]) - (y[28]);
    residual[11] = (y[26]) - (y[15]+y[12]);
    residual[12] = (y[23]) - (y[18]-y[21]*params[8]);
    residual[13] = (y[25]) - (params[2]*y[11]+x[1]);
    residual[14] = (y[24]) - (params[3]*y[10]+x[2]);
end
    return nothing
end

