function dynamic_set_auxiliary_series!(ds, params)
#
# Computes auxiliary variables of the dynamic model
#
@inbounds begin
ds.AUX_EXO_LAG_28_0 .=ds.e_tauw;
ds.AUX_EXO_LAG_28_1 .=lag(ds.AUX_EXO_LAG_28_0);
ds.AUX_EXO_LAG_28_2 .=lag(ds.AUX_EXO_LAG_28_1);
end
end
