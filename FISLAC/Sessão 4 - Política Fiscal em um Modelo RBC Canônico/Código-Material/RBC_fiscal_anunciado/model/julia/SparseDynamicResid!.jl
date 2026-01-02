function SparseDynamicResid!(T::Vector{<: Real}, residual::AbstractVector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real}, steady_state::Vector{<: Real})
    @assert length(T) >= 0
    @assert length(residual) == 27
    @assert length(y) == 81
    @assert length(x) == 6
    @assert length(params) == 36
@inbounds begin
    residual[1] = ((y[28]+params[18]*y[44])^(-1)) - (params[1]*(y[55]+params[18]*y[71])^(-1)*(1+y[39])/(1+y[66])*(1+(1-y[68])*y[56]-params[3]));
    residual[2] = (y[30]) - (1-(y[28]+params[18]*y[44])*(1+y[39])*(1-params[4])/params[4]/(1-y[40])/y[34]);
    residual[3] = ((y[28]+params[18]*y[44])^(-1)) - (params[1]*(y[55]+params[18]*y[71])^(-1)*(1+y[39])/(1+y[66])*(1+y[35]));
    residual[4] = (y[33]) - (y[36]*y[4]^params[2]*y[30]^(1-params[2])*y[46]^params[19]);
    residual[5] = (y[29]) - (y[33]*params[2]/y[4]);
    residual[6] = (y[34]) - (y[33]*(1-params[2])/y[30]);
    residual[7] = (y[32]) - (y[31]-y[4]*(1-params[3]));
    residual[8] = (log(y[36])) - (params[5]*log(y[9])+(1-params[5])*log(params[8])+x[1]);
    residual[9] = (y[33]) - (y[44]+y[28]+y[32]+y[45]);
    residual[10] = (y[37]) - ((1+y[8])*y[10]+y[43]-y[38]);
    residual[11] = (y[43]) - (y[44]+y[45]);
    residual[12] = (log(y[44])) - (params[6]*log(y[17])+(1-params[6])*log(params[29])+x[2]);
    residual[13] = (log(y[45])) - (params[7]*log(y[18])+(1-params[7])*log(params[21])+x[3]);
    residual[14] = (y[46]) - (y[45]+(1-params[20])*y[19]);
    residual[15] = (y[38]) - (y[28]*y[39]+y[30]*y[40]*y[34]+y[4]*y[29]*y[41]+y[42]);
    residual[16] = (y[39]) - (params[13]*y[12]+(1-params[13])*params[9]+x[4]);
    residual[17] = (y[40]) - (params[14]*y[13]+(1-params[14])*params[10]+y[27]);
    residual[18] = (y[41]) - (params[15]*y[14]+(1-params[15])*params[11]+x[6]);
    residual[19] = (y[42]) - (params[16]*y[15]+(1-params[16])*params[12]+params[17]*(y[48]-params[33]));
    residual[20] = (y[47]) - (y[38]-y[43]);
    residual[21] = (y[48]) - (y[37]/y[33]);
    residual[22] = (y[49]) - (y[43]/y[33]);
    residual[23] = (y[50]) - (y[38]/y[33]);
    residual[24] = (y[51]) - (y[47]/y[33]);
    residual[25] = (y[52]) - (x[5]);
    residual[26] = (y[53]) - (y[25]);
    residual[27] = (y[54]) - (y[26]);
end
    return nothing
end

