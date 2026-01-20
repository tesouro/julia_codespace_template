function SparseStaticResid!(T::Vector{<: Real}, residual::AbstractVector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real})
    @assert length(T) >= 8
    @assert length(residual) == 36
    @assert length(y) == 36
    @assert length(x) == 7
    @assert length(params) == 32
@inbounds begin
    residual[1] = (y[9]) - (y[9]*params[1]*(1+(1-y[16])*y[2]-params[3]));
    residual[2] = (y[7]) - (params[7]*(1+y[14])/(1-y[15])*T[1]);
    residual[3] = (1) - (params[1]*(1+y[8]));
    residual[4] = (y[9]) - (T[3]/(1+y[14]));
    residual[5] = (y[6]) - (T[5]*T[6]*T[7]);
    residual[6] = (y[2]) - (y[6]*params[2]/y[4]);
    residual[7] = (y[7]) - (y[6]*(1-params[2])/y[3]);
    residual[8] = (y[4]) - (y[5]+y[4]*(1-params[3]));
    residual[9] = (log(y[10])) - (log(y[10])*params[13]+(1-params[13])*log(params[22])+x[1]);
    residual[10] = (y[11]) - ((1+y[8])*y[11]-y[22]);
    residual[11] = (y[12]) - (y[8]*y[11]);
    residual[12] = (y[13]) - (y[14]*y[1]+y[3]*y[7]*y[15]+y[4]*y[16]*y[2]+y[17]);
    residual[13] = (y[14]) - (y[14]*params[16]+(1-params[16])*params[23]+x[4]);
    residual[14] = (y[15]) - (y[15]*params[17]+(1-params[17])*params[24]+x[5]);
    residual[15] = (y[16]) - (y[16]*params[18]+(1-params[18])*params[25]+x[6]);
    residual[16] = (y[17]) - (y[17]*params[19]+(1-params[19])*params[26]+params[21]*(y[29]-params[31]));
    residual[17] = (y[25]) - (y[11]*params[12]);
    residual[18] = (y[26]) - (y[11]*(1-params[12]));
    residual[19] = (y[18]) - (y[19]+y[20]);
    residual[20] = (log(y[19])) - (log(y[19])*params[14]+(1-params[14])*log(params[27])+x[2]);
    residual[21] = (log(y[20])) - (log(y[20])*params[15]+(1-params[15])*log(params[28])+x[3]);
    residual[22] = (y[21]) - (y[20]+y[21]*(1-params[6]));
    residual[23] = (y[22]) - (y[13]-y[18]);
    residual[24] = (y[8]) - (y[27]+params[10]*(T[8]-1));
    residual[25] = (y[27]) - (y[27]*params[20]+(1-params[20])*params[32]+x[7]);
    residual[26] = (y[6]) - (y[18]+y[1]+y[5]+y[23]);
    residual[27] = (y[23]) - ((1+y[8])*y[28]-y[28]);
    residual[28] = (y[24]) - (y[23]-y[8]*y[28]);
    residual[29] = (y[31]) - (y[18]/y[6]);
    residual[30] = (y[32]) - (y[13]/y[6]);
    residual[31] = (y[33]) - (y[22]/y[6]);
    residual[32] = (y[29]) - (y[11]/y[6]);
    residual[33] = (y[30]) - (y[12]/y[6]);
    residual[34] = (y[34]) - (y[24]/y[6]);
    residual[35] = (y[35]) - (y[25]/y[6]);
    residual[36] = (y[36]) - (y[26]/y[6]);
end
    if ~isreal(residual)
        residual = real(residual)+imag(residual).^2;
    end
    return nothing
end

