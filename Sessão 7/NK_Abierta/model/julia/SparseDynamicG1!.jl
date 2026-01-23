function SparseDynamicG1!(T::Vector{<: Real}, g1_v::Vector{<: Real}, y::Vector{<: Real}, x::Vector{<: Real}, params::Vector{<: Real}, steady_state::Vector{<: Real})
    @assert length(T) >= 0
    @assert length(g1_v) == 73
    @assert length(y) == 66
    @assert length(x) == 4
    @assert length(params) == 20
@inbounds begin
g1_v[1]=params[6];
g1_v[2]=(-1);
g1_v[3]=(-1);
g1_v[4]=1;
g1_v[5]=(-params[11]);
g1_v[6]=(-params[12]);
g1_v[7]=(-params[9]);
g1_v[8]=(-params[10]);
g1_v[9]=(-params[19]);
g1_v[10]=1;
g1_v[11]=(-params[14]);
g1_v[12]=1;
g1_v[13]=1;
g1_v[14]=(-params[13]);
g1_v[15]=(-1);
g1_v[16]=(-1);
g1_v[17]=1/params[16];
g1_v[18]=1;
g1_v[19]=(-1);
g1_v[20]=params[8];
g1_v[21]=1;
g1_v[22]=1;
g1_v[23]=(-(1/params[16]));
g1_v[24]=1;
g1_v[25]=(-1);
g1_v[26]=1;
g1_v[27]=(-params[16]);
g1_v[28]=1;
g1_v[29]=(-1);
g1_v[30]=1;
g1_v[31]=(-(params[6]*(params[15]/params[2]-1)));
g1_v[32]=(-params[6]);
g1_v[33]=(-params[6]);
g1_v[34]=1;
g1_v[35]=1;
g1_v[36]=(-1);
g1_v[37]=(-1);
g1_v[38]=(-params[3]);
g1_v[39]=1;
g1_v[40]=1;
g1_v[41]=1;
g1_v[42]=1;
g1_v[43]=(-1);
g1_v[44]=(-params[2]);
g1_v[45]=(-1);
g1_v[46]=1;
g1_v[47]=1;
g1_v[48]=(-1);
g1_v[49]=1;
g1_v[50]=(-1);
g1_v[51]=(-1);
g1_v[52]=1;
g1_v[53]=params[20];
g1_v[54]=(-params[18]);
g1_v[55]=params[16];
g1_v[56]=1;
g1_v[57]=(-1);
g1_v[58]=1;
g1_v[59]=(-((-params[16])*params[17]*(1-params[9])));
g1_v[60]=(-params[17]);
g1_v[61]=(-1);
g1_v[62]=1;
g1_v[63]=(-1);
g1_v[64]=1;
g1_v[65]=(-1);
g1_v[66]=(-params[1]);
g1_v[67]=(-(1/params[16]));
g1_v[68]=1;
g1_v[69]=(-params[20]);
g1_v[70]=(-1);
g1_v[71]=(-1);
g1_v[72]=(-1);
g1_v[73]=(-1);
end
    return nothing
end

