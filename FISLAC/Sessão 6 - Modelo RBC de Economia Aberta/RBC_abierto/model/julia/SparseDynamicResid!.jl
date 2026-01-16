function SparseDynamicResid!(T::Vector{<: Real}, residual::AbstractVector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real}, steady_state::Vector{<: Real})
    @assert length(T) >= 0
    @assert length(residual) == 36
    @assert length(y) == 108
    @assert length(x) == 7
    @assert length(params) == 32
@inbounds begin
    residual[1] = (y[45]*(1+params[9]*(y[40]-y[4]))) - (params[1]*y[81]*(1+(1-y[88])*y[74]-params[3]+params[9]*(y[76]-y[40])));
    residual[2] = (y[43]) - (params[7]*(1+y[50])/(1-y[51])*y[39]^params[8]);
    residual[3] = (1) - (params[1]*y[81]/y[45]*(1+y[44]));
    residual[4] = (y[45]) - ((y[37]+params[4]*y[55]-params[7]*y[39]^(1+params[8])/(1+params[8]))^(-params[11])/(1+y[50]));
    residual[5] = (y[42]) - (y[46]*y[4]^params[2]*y[39]^(1-params[2])*y[57]^params[5]);
    residual[6] = (y[38]) - (y[42]*params[2]/y[4]);
    residual[7] = (y[43]) - (y[42]*(1-params[2])/y[39]);
    residual[8] = (y[40]) - (y[41]+y[4]*(1-params[3])-params[9]/2*(y[40]-y[4])^2);
    residual[9] = (log(y[46])) - (params[13]*log(y[10])+(1-params[13])*log(params[22])+x[1]);
    residual[10] = (y[47]) - ((1+y[8])*y[11]-y[58]);
    residual[11] = (y[48]) - (y[8]*y[11]);
    residual[12] = (y[49]) - (y[50]*y[37]+y[39]*y[43]*y[51]+y[4]*y[38]*y[52]+y[53]);
    residual[13] = (y[50]) - (params[16]*y[14]+(1-params[16])*params[23]+x[4]);
    residual[14] = (y[51]) - (params[17]*y[15]+(1-params[17])*params[24]+x[5]);
    residual[15] = (y[52]) - (params[18]*y[16]+(1-params[18])*params[25]+x[6]);
    residual[16] = (y[53]) - (params[19]*y[17]+(1-params[19])*params[26]+params[21]*(y[65]-params[31]));
    residual[17] = (y[61]) - (y[47]*params[12]);
    residual[18] = (y[62]) - (y[47]*(1-params[12]));
    residual[19] = (y[54]) - (y[55]+y[56]);
    residual[20] = (log(y[55])) - (params[14]*log(y[19])+(1-params[14])*log(params[27])+x[2]);
    residual[21] = (log(y[56])) - (params[15]*log(y[20])+(1-params[15])*log(params[28])+x[3]);
    residual[22] = (y[57]) - (y[56]+(1-params[6])*y[21]);
    residual[23] = (y[58]) - (y[49]-y[54]);
    residual[24] = (y[44]) - (y[63]+params[10]*(exp(y[64]/y[42]-params[29]/params[30])-1));
    residual[25] = (y[63]) - (params[20]*y[27]+(1-params[20])*params[32]+x[7]);
    residual[26] = (y[42]) - (y[54]+y[37]+y[41]+y[59]);
    residual[27] = (y[59]) - ((1+y[8])*y[28]-y[64]);
    residual[28] = (y[60]) - (y[59]-y[8]*y[28]);
    residual[29] = (y[67]) - (y[54]/y[42]);
    residual[30] = (y[68]) - (y[49]/y[42]);
    residual[31] = (y[69]) - (y[58]/y[42]);
    residual[32] = (y[65]) - (y[47]/y[42]);
    residual[33] = (y[66]) - (y[48]/y[42]);
    residual[34] = (y[70]) - (y[60]/y[42]);
    residual[35] = (y[71]) - (y[61]/y[42]);
    residual[36] = (y[72]) - (y[62]/y[42]);
end
    return nothing
end

