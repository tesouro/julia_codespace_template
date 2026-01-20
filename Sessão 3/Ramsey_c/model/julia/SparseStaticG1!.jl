function SparseStaticG1!(T::Vector{<: Real}, g1_v::Vector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real})
    @assert length(T) >= 5
    @assert length(g1_v) == 17
    @assert length(y) == 7
    @assert length(x) == 2
    @assert length(params) == 12
@inbounds begin
g1_v[1]=1/y[2];
g1_v[2]=(-((1-params[1])*y[5]*T[3]));
g1_v[3]=(-(params[1]*y[5]*T[4]));
g1_v[4]=(-(y[5]*T[4]-(-y[1])/(y[2]*y[2])));
g1_v[5]=(-(y[7]*params[1]*y[5]*T[4]*T[5]));
g1_v[6]=(-(y[5]*T[3]));
g1_v[7]=1;
g1_v[8]=1;
g1_v[9]=(-((1-params[1])*T[1]));
g1_v[10]=(-(params[1]*T[2]));
g1_v[11]=(-T[2]);
g1_v[12]=(-(T[5]*y[7]*params[1]*T[2]));
g1_v[13]=(-T[1]);
g1_v[14]=1/y[5]-params[4]*1/y[5];
g1_v[15]=1;
g1_v[16]=(-((1+params[1]*y[5]*T[2]-params[2])*T[5]));
g1_v[17]=1/y[7]-params[5]*1/y[7];
end
    if ~isreal(g1_v)
        g1_v = real(g1_v)+2*imag(g1_v);
    end
    return nothing
end

