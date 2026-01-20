function SparseDynamicG1!(T::Vector{<: Real}, g1_v::Vector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real}, steady_state::Vector{<: Real})
    @assert length(T) >= 7
    @assert length(g1_v) == 20
    @assert length(y) == 18
    @assert length(x) == 1
    @assert length(params) == 11
@inbounds begin
g1_v[1]=(-((1-params[1])*y[11]*T[5]));
g1_v[2]=(-(params[1]*y[11]*T[6]));
g1_v[3]=(-y[8])/(y[2]*y[2])-(y[11]*T[6]-(-y[7])/(y[2]*y[2]));
g1_v[4]=(-(y[11]*T[5]));
g1_v[5]=(-(params[5]*1/y[5]));
g1_v[6]=1/y[2];
g1_v[7]=(-y[13])/(y[7]*y[7]);
g1_v[8]=1/y[2];
g1_v[9]=(-(params[2]*params[1]*y[17]*get_power_deriv(y[8],params[1]-1,1)*T[7]));
g1_v[10]=1;
g1_v[11]=1;
g1_v[12]=(-((1-params[1])*T[1]));
g1_v[13]=(-(params[1]*T[2]));
g1_v[14]=(-T[2]);
g1_v[15]=(-T[1]);
g1_v[16]=1/y[11];
g1_v[17]=1;
g1_v[18]=1/y[7];
g1_v[19]=(-(T[7]*params[2]*params[1]*T[3]));
g1_v[20]=(-1);
end
    return nothing
end

