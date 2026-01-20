function SparseStaticG1!(T::Vector{<: Real}, g1_v::Vector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real})
    @assert length(T) >= 8
    @assert length(g1_v) == 75
    @assert length(y) == 26
    @assert length(x) == 7
    @assert length(params) == 39
@inbounds begin
g1_v[1]=T[7]-(1+(1-y[14])*y[2]-params[3])*params[1]*T[7];
g1_v[2]=T[2]/y[7];
g1_v[3]=T[7]-(1+y[8])*params[1]*T[7];
g1_v[4]=(-1);
g1_v[5]=(-y[12]);
g1_v[6]=(-(T[1]*params[1]*(1-y[14])));
g1_v[7]=1;
g1_v[8]=(-(y[14]*y[4]));
g1_v[9]=1;
g1_v[10]=(-(T[6]*T[4]*get_power_deriv(y[3],1-params[2],1)));
g1_v[11]=(-((-(y[6]*(1-params[2])))/(y[3]*y[3])));
g1_v[12]=(-(y[13]*y[7]));
g1_v[13]=(-(T[6]*T[5]*y[9]*get_power_deriv(y[4],params[2],1)));
g1_v[14]=(-((-(y[6]*params[2]))/(y[4]*y[4])));
g1_v[15]=(-(1-(1-params[3])));
g1_v[16]=(-(y[14]*y[2]));
g1_v[17]=1;
g1_v[18]=(-1);
g1_v[19]=1;
g1_v[20]=(-(params[2]/y[4]));
g1_v[21]=(-((1-params[2])/y[3]));
g1_v[22]=1;
g1_v[23]=(-((-y[10])/(y[6]*y[6])));
g1_v[24]=(-((-y[16])/(y[6]*y[6])));
g1_v[25]=(-((-y[11])/(y[6]*y[6])));
g1_v[26]=(-((-y[20])/(y[6]*y[6])));
g1_v[27]=(-((y[1]+params[19]*y[17])*T[2]))/(y[7]*y[7]);
g1_v[28]=1;
g1_v[29]=(-(y[3]*y[13]));
g1_v[30]=(-(T[1]*params[1]));
g1_v[31]=(-y[10]);
g1_v[32]=(-(T[6]*T[3]*T[5]));
g1_v[33]=1/y[9]-params[5]*1/y[9];
g1_v[34]=1-(1+y[8]);
g1_v[35]=T[8];
g1_v[36]=1;
g1_v[37]=(-1);
g1_v[38]=T[8];
g1_v[39]=(y[1]+params[19]*y[17])*(1-params[4])/params[4]/(1-y[13])/y[7];
g1_v[40]=(-y[1]);
g1_v[41]=1-params[13];
g1_v[42]=(y[1]+params[19]*y[17])*(1+y[12])*(1-params[4])/params[4]/((1-y[13])*(1-y[13]))/y[7];
g1_v[43]=(-(y[3]*y[7]));
g1_v[44]=1-params[14];
g1_v[45]=(-(T[1]*params[1]*(-y[2])));
g1_v[46]=(-(y[2]*y[4]));
g1_v[47]=1-params[15];
g1_v[48]=(-1);
g1_v[49]=1-params[16];
g1_v[50]=1;
g1_v[51]=1;
g1_v[52]=T[8];
g1_v[53]=params[19]*T[7]-(1+(1-y[14])*y[2]-params[3])*params[1]*params[19]*T[7];
g1_v[54]=params[19]*T[2]/y[7];
g1_v[55]=params[19]*T[7]-(1+y[8])*params[1]*params[19]*T[7];
g1_v[56]=(-1);
g1_v[57]=(-1);
g1_v[58]=1/y[17]-params[6]*1/y[17];
g1_v[59]=(-1);
g1_v[60]=(-1);
g1_v[61]=1/y[18]-params[7]*1/y[18];
g1_v[62]=(-1);
g1_v[63]=(-(T[4]*T[5]*get_power_deriv(y[19],params[20],1)));
g1_v[64]=1-(1-params[21]);
g1_v[65]=1;
g1_v[66]=1;
g1_v[67]=T[8];
g1_v[68]=(-1);
g1_v[69]=1-params[18];
g1_v[70]=(-params[17]);
g1_v[71]=1;
g1_v[72]=1;
g1_v[73]=1;
g1_v[74]=1;
g1_v[75]=1;
end
    if ~isreal(g1_v)
        g1_v = real(g1_v)+2*imag(g1_v);
    end
    return nothing
end

