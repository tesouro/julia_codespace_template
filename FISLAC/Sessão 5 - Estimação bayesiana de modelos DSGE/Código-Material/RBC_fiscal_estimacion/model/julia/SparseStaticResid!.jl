function SparseStaticResid!(T::Vector{<: Real}, residual::AbstractVector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real})
    @assert length(T) >= 0
    @assert length(residual) == 26
    @assert length(y) == 26
    @assert length(x) == 7
    @assert length(params) == 39
@inbounds begin
    residual[1] = ((y[1]+params[19]*y[17])^(-1)) - ((y[1]+params[19]*y[17])^(-1)*params[1]*(1+(1-y[14])*y[2]-params[3]));
    residual[2] = (y[3]) - (1-(y[1]+params[19]*y[17])*(1+y[12])*(1-params[4])/params[4]/(1-y[13])/y[7]);
    residual[3] = ((y[1]+params[19]*y[17])^(-1)) - ((y[1]+params[19]*y[17])^(-1)*params[1]*(1+y[8]));
    residual[4] = (y[6]) - (y[9]*y[4]^params[2]*y[3]^(1-params[2])*y[19]^params[20]);
    residual[5] = (y[2]) - (y[6]*params[2]/y[4]);
    residual[6] = (y[7]) - (y[6]*(1-params[2])/y[3]);
    residual[7] = (y[5]) - (y[4]-y[4]*(1-params[3]));
    residual[8] = (log(y[9])) - (log(y[9])*params[5]+(1-params[5])*log(params[8])+x[1]);
    residual[9] = (y[6]) - (y[17]+y[1]+y[5]+y[18]);
    residual[10] = (y[10]) - ((1+y[8])*y[10]-y[20]+y[21]+x[7]);
    residual[11] = (y[16]) - (y[17]+y[18]);
    residual[12] = (log(y[17])) - (log(y[17])*params[6]+(1-params[6])*log(params[31])+x[2]);
    residual[13] = (log(y[18])) - (log(y[18])*params[7]+(1-params[7])*log(params[22])+x[3]);
    residual[14] = (y[19]) - (y[18]+y[19]*(1-params[21]));
    residual[15] = (y[11]) - (y[1]*y[12]+y[3]*y[13]*y[7]+y[4]*y[14]*y[2]+y[15]);
    residual[16] = (y[12]) - (y[12]*params[13]+(1-params[13])*params[9]+x[4]);
    residual[17] = (y[13]) - (y[13]*params[14]+(1-params[14])*params[10]+x[5]);
    residual[18] = (y[14]) - (y[14]*params[15]+(1-params[15])*params[11]+x[6]);
    residual[19] = (y[15]) - (y[15]*params[16]+(1-params[16])*params[12]+params[17]*(y[22]-params[35]));
    residual[20] = (y[21]) - (y[21]*params[18]+(1-params[18])*params[30]);
    residual[21] = (y[20]) - (y[11]-y[16]);
    residual[22] = (y[22]) - (y[10]/y[6]);
    residual[23] = (y[23]) - (y[16]/y[6]);
    residual[24] = (y[24]) - (y[11]/y[6]);
    residual[25] = (y[25]) - (y[20]/y[6]);
    residual[26] = (y[26]) - (params[39]);
end
    return nothing
end

