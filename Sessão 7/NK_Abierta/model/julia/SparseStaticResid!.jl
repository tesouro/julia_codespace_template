function SparseStaticResid!(T::Vector{<: Real}, residual::AbstractVector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real})
    @assert length(T) >= 0
    @assert length(residual) == 22
    @assert length(y) == 22
    @assert length(x) == 4
    @assert length(params) == 20
@inbounds begin
    residual[1] = (y[2]) - (y[2]*params[1]+params[19]*y[1]);
    residual[2] = (y[1]) - (y[1]-1/params[16]*(y[3]-y[2]-y[5]));
    residual[3] = (y[3]) - (y[2]*params[13]+y[1]*params[14]+y[22]);
    residual[4] = (y[5]) - ((-params[16])*params[17]*(1-params[9])*y[21]);
    residual[5] = (y[11]) - (y[3]-y[2]);
    residual[6] = (y[4]) - (params[17]*y[21]+y[19]*params[18]);
    residual[7] = (y[1]) - (y[6]-y[4]);
    residual[8] = (y[6]) - (y[21]+y[9]);
    residual[9] = (y[12]-y[16]) - (params[2]*y[14]+y[9]*params[3]);
    residual[10] = (y[7]) - (params[16]*(y[6]-y[19]));
    residual[11] = (y[13]) - (y[7]*params[6]*(params[15]/params[2]-1));
    residual[12] = (y[6]) - (y[14]+y[13]+y[7]*params[6]);
    residual[13] = (y[8]) - (y[2]);
    residual[14] = (y[15]) - (y[2]+y[15]);
    residual[15] = (y[16]) - (y[16]+y[8]);
    residual[16] = (y[7]) - (y[17]+y[20]-y[15]);
residual[17] = y[18];
    residual[18] = (y[10]) - (y[6]-y[3]*params[8]);
    residual[19] = (y[21]) - (params[9]*y[21]+x[2]);
    residual[20] = (y[22]) - (y[22]*params[10]+x[1]);
    residual[21] = (y[19]) - (y[19]*params[11]+x[3]);
    residual[22] = (y[20]) - (y[20]*params[12]+x[4]);
end
    if ~isreal(residual)
        residual = real(residual)+imag(residual).^2;
    end
    return nothing
end

