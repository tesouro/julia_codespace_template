function SparseDynamicG1!(T::Vector{<: Real}, g1_v::Vector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real}, steady_state::Vector{<: Real})
    @assert length(T) >= 7
    @assert length(g1_v) == 24
    @assert length(y) == 21
    @assert length(x) == 2
    @assert length(params) == 12
@inbounds begin
g1_v[1]=(-((1-params[1])*y[12]*T[5]));
g1_v[2]=(-(params[1]*y[12]*T[6]));
g1_v[3]=(-y[9])/(y[2]*y[2])-(y[12]*T[6]-(-y[8])/(y[2]*y[2]));
g1_v[4]=(-(y[12]*T[5]));
g1_v[5]=(-(params[4]*1/y[5]));
g1_v[6]=(-(params[5]*1/y[7]));
g1_v[7]=1/y[2];
g1_v[8]=(-y[15])/(y[8]*y[8]);
g1_v[9]=1/y[2];
g1_v[10]=(-(y[14]*params[1]*y[19]*get_power_deriv(y[9],params[1]-1,1)*T[7]));
g1_v[11]=1;
g1_v[12]=1;
g1_v[13]=(-((1-params[1])*T[1]));
g1_v[14]=(-(params[1]*T[2]));
g1_v[15]=(-T[2]);
g1_v[16]=(-T[1]);
g1_v[17]=1/y[12];
g1_v[18]=1;
g1_v[19]=(-((1+params[1]*y[19]*T[3]-params[2])*T[7]));
g1_v[20]=1/y[14];
g1_v[21]=1/y[8];
g1_v[22]=(-(T[7]*y[14]*params[1]*T[3]));
g1_v[23]=(-1);
g1_v[24]=(-1);
end
    return nothing
end

