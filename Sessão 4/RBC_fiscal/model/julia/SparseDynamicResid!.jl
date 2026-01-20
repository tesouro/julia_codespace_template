function SparseDynamicResid!(T::Vector{<: Real}, residual::AbstractVector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real}, steady_state::Vector{<: Real})
    @assert length(T) >= 8
    @assert length(residual) == 24
    @assert length(y) == 72
    @assert length(x) == 6
    @assert length(params) == 36
@inbounds begin
    residual[1] = (T[1]) - (T[3]*(1+(1-y[62])*y[50]-params[3]));
    residual[2] = (y[27]) - (1-(y[25]+params[18]*y[41])*T[4]/y[31]);
    residual[3] = (T[1]) - (T[3]*(1+y[32]));
    residual[4] = (y[30]) - (T[6]*T[7]*T[8]);
    residual[5] = (y[26]) - (y[30]*params[2]/y[4]);
    residual[6] = (y[31]) - (y[30]*(1-params[2])/y[27]);
    residual[7] = (y[29]) - (y[28]-y[4]*(1-params[3]));
    residual[8] = (log(y[33])) - (params[5]*log(y[9])+(1-params[5])*log(params[8])+x[1]);
    residual[9] = (y[30]) - (y[41]+y[25]+y[29]+y[42]);
    residual[10] = (y[34]) - ((1+y[8])*y[10]+y[40]-y[35]);
    residual[11] = (y[40]) - (y[41]+y[42]);
    residual[12] = (log(y[41])) - (params[6]*log(y[17])+(1-params[6])*log(params[29])+x[2]);
    residual[13] = (log(y[42])) - (params[7]*log(y[18])+(1-params[7])*log(params[21])+x[3]);
    residual[14] = (y[43]) - (y[42]+(1-params[20])*y[19]);
    residual[15] = (y[35]) - (y[25]*y[36]+y[27]*y[37]*y[31]+y[4]*y[26]*y[38]+y[39]);
    residual[16] = (y[36]) - (params[13]*y[12]+(1-params[13])*params[9]+x[4]);
    residual[17] = (y[37]) - (params[14]*y[13]+(1-params[14])*params[10]+x[5]);
    residual[18] = (y[38]) - (params[15]*y[14]+(1-params[15])*params[11]+x[6]);
    residual[19] = (y[39]) - (params[16]*y[15]+(1-params[16])*params[12]+params[17]*(y[45]-params[33]));
    residual[20] = (y[44]) - (y[35]-y[40]);
    residual[21] = (y[45]) - (y[34]/y[30]);
    residual[22] = (y[46]) - (y[40]/y[30]);
    residual[23] = (y[47]) - (y[35]/y[30]);
    residual[24] = (y[48]) - (y[44]/y[30]);
end
    return nothing
end

