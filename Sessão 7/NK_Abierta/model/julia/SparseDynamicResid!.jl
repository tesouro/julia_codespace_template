function SparseDynamicResid!(T::Vector{<: Real}, residual::AbstractVector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real}, steady_state::Vector{<: Real})
    @assert length(T) >= 0
    @assert length(residual) == 22
    @assert length(y) == 66
    @assert length(x) == 4
    @assert length(params) == 20
@inbounds begin
    residual[1] = (y[24]) - (params[1]*y[46]+params[19]*y[23]);
    residual[2] = (y[23]) - (y[45]-1/params[16]*(y[25]-y[46]-y[27]));
    residual[3] = (y[25]) - (y[24]*params[13]+y[23]*params[14]+y[44]);
    residual[4] = (y[27]) - ((-params[16])*params[17]*(1-params[9])*y[43]+params[20]*(y[63]-y[41]));
    residual[5] = (y[33]) - (y[25]-y[46]);
    residual[6] = (y[26]) - (params[17]*y[43]+y[41]*params[18]);
    residual[7] = (y[23]) - (y[28]-y[26]);
    residual[8] = (y[28]) - (y[43]+y[31]);
    residual[9] = (y[34]-y[38]) - (params[2]*y[36]+y[31]*params[3]);
    residual[10] = (y[29]) - (params[16]*(y[28]-y[41]));
    residual[11] = (y[35]) - (y[29]*params[6]*(params[15]/params[2]-1));
    residual[12] = (y[28]) - (y[36]+y[35]+y[29]*params[6]);
    residual[13] = (y[30]) - (y[24]+params[6]*(y[29]-y[7]));
    residual[14] = (y[37]) - (y[24]+y[15]);
    residual[15] = (y[38]) - (y[30]+y[16]);
    residual[16] = (y[29]) - (y[39]+y[42]-y[37]);
    residual[17] = (y[40]) - (y[39]-y[17]);
    residual[18] = (y[32]) - (y[28]-y[25]*params[8]);
    residual[19] = (y[43]) - (params[9]*y[21]+x[2]);
    residual[20] = (y[44]) - (params[10]*y[22]+x[1]);
    residual[21] = (y[41]) - (params[11]*y[19]+x[3]);
    residual[22] = (y[42]) - (params[12]*y[20]+x[4]);
end
    return nothing
end

