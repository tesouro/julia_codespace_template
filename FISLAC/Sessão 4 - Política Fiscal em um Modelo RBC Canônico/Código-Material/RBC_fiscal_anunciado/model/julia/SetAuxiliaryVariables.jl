function set_auxiliary_variables!(y, x, params)
#
# Computes auxiliary variables of the static model
#
@inbounds begin
y[25]=x[5];
y[26]=y[25];
y[27]=y[26];
end
end
