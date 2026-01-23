function SparseStaticResid!(T::Vector{<: Real}, residual::AbstractVector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real})
    @assert length(T) >= 0
    @assert length(residual) == 14
    @assert length(y) == 14
    @assert length(x) == 2
    @assert length(params) == 12
@inbounds begin
    residual[1] = (y[1]) - (y[1]*params[1]+params[12]*y[2]);
    residual[2] = (y[2]) - (y[2]-1/params[4]*(y[7]-y[1]-y[5]));
    residual[3] = (y[7]) - (y[1]*params[6]+y[2]*params[7]+y[10]);
    residual[4] = (y[5]) - ((-params[4])*params[11]*(1-params[2])*y[11]);
    residual[5] = (y[6]) - (y[7]-y[1]);
    residual[6] = (y[3]) - (params[11]*y[11]);
    residual[7] = (y[2]) - (y[4]-y[3]);
    residual[8] = (y[4]) - (y[11]+y[8]);
    residual[9] = (y[13]-y[12]) - (params[4]*y[14]+y[8]*params[5]);
    residual[10] = (y[4]) - (y[14]);
    residual[11] = (y[12]) - (y[1]+y[12]);
    residual[12] = (y[9]) - (y[4]-y[7]*params[8]);
    residual[13] = (y[11]) - (params[2]*y[11]+x[1]);
    residual[14] = (y[10]) - (y[10]*params[3]+x[2]);
end
    if ~isreal(residual)
        residual = real(residual)+imag(residual).^2;
    end
    return nothing
end

