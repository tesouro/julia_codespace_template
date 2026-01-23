function SparseStaticG1!(T::Vector{<: Real}, g1_v::Vector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real})
    @assert length(T) >= 0
    @assert length(g1_v) == 52
    @assert length(y) == 22
    @assert length(x) == 4
    @assert length(params) == 20
@inbounds begin
g1_v[1]=(-params[19]);
g1_v[2]=(-params[14]);
g1_v[3]=1;
g1_v[4]=1-params[1];
g1_v[5]=(-(1/params[16]));
g1_v[6]=(-params[13]);
g1_v[7]=1;
g1_v[8]=(-1);
g1_v[9]=(-1);
g1_v[10]=1/params[16];
g1_v[11]=1;
g1_v[12]=(-1);
g1_v[13]=params[8];
g1_v[14]=1;
g1_v[15]=1;
g1_v[16]=(-(1/params[16]));
g1_v[17]=1;
g1_v[18]=(-1);
g1_v[19]=1;
g1_v[20]=(-params[16]);
g1_v[21]=1;
g1_v[22]=(-1);
g1_v[23]=1;
g1_v[24]=(-(params[6]*(params[15]/params[2]-1)));
g1_v[25]=(-params[6]);
g1_v[26]=1;
g1_v[27]=1;
g1_v[28]=(-1);
g1_v[29]=(-1);
g1_v[30]=(-params[3]);
g1_v[31]=1;
g1_v[32]=1;
g1_v[33]=1;
g1_v[34]=1;
g1_v[35]=(-1);
g1_v[36]=(-params[2]);
g1_v[37]=(-1);
g1_v[38]=1;
g1_v[39]=(-1);
g1_v[40]=(-1);
g1_v[41]=1;
g1_v[42]=(-params[18]);
g1_v[43]=params[16];
g1_v[44]=1-params[11];
g1_v[45]=(-1);
g1_v[46]=1-params[12];
g1_v[47]=(-((-params[16])*params[17]*(1-params[9])));
g1_v[48]=(-params[17]);
g1_v[49]=(-1);
g1_v[50]=1-params[9];
g1_v[51]=(-1);
g1_v[52]=1-params[10];
end
    if ~isreal(g1_v)
        g1_v = real(g1_v)+2*imag(g1_v);
    end
    return nothing
end

