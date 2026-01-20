function SparseDynamicResid!(T::Vector{<: Real}, residual::AbstractVector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real}, steady_state::Vector{<: Real})
    @assert length(T) >= 8
    @assert length(residual) == 26
    @assert length(y) == 78
    @assert length(x) == 7
    @assert length(params) == 39
@inbounds begin
    residual[1] = (T[1]) - (T[3]*(1+(1-y[66])*y[54]-params[3]));
    residual[2] = (y[29]) - (1-(y[27]+params[19]*y[43])*T[4]/y[33]);
    residual[3] = (T[1]) - (T[3]*(1+y[34]));
    residual[4] = (y[32]) - (T[6]*T[7]*T[8]);
    residual[5] = (y[28]) - (y[32]*params[2]/y[4]);
    residual[6] = (y[33]) - (y[32]*(1-params[2])/y[29]);
    residual[7] = (y[31]) - (y[30]-y[4]*(1-params[3]));
    residual[8] = (log(y[35])) - (params[5]*log(y[9])+(1-params[5])*log(params[8])+x[1]);
    residual[9] = (y[32]) - (y[43]+y[27]+y[31]+y[44]);
    residual[10] = (y[36]) - ((1+y[8])*y[10]-y[46]+y[47]+x[7]);
    residual[11] = (y[42]) - (y[43]+y[44]);
    residual[12] = (log(y[43])) - (params[6]*log(y[17])+(1-params[6])*log(params[31])+x[2]);
    residual[13] = (log(y[44])) - (params[7]*log(y[18])+(1-params[7])*log(params[22])+x[3]);
    residual[14] = (y[45]) - (y[44]+(1-params[21])*y[19]);
    residual[15] = (y[37]) - (y[27]*y[38]+y[29]*y[39]*y[33]+y[4]*y[28]*y[40]+y[41]);
    residual[16] = (y[38]) - (params[13]*y[12]+(1-params[13])*params[9]+x[4]);
    residual[17] = (y[39]) - (params[14]*y[13]+(1-params[14])*params[10]+x[5]);
    residual[18] = (y[40]) - (params[15]*y[14]+(1-params[15])*params[11]+x[6]);
    residual[19] = (y[41]) - (params[16]*y[15]+(1-params[16])*params[12]+params[17]*(y[48]-params[35]));
    residual[20] = (y[47]) - (params[18]*y[21]+(1-params[18])*params[30]);
    residual[21] = (y[46]) - (y[37]-y[42]);
    residual[22] = (y[48]) - (y[36]/y[32]);
    residual[23] = (y[49]) - (y[42]/y[32]);
    residual[24] = (y[50]) - (y[37]/y[32]);
    residual[25] = (y[51]) - (y[46]/y[32]);
    residual[26] = (y[52]) - (params[39]+y[32]/y[6]-1);
end
    return nothing
end

