
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   Banco Interamericano de Desarrollo                    %
%                                                                         %
%            Modelo RBC de economia aberta com política fiscal            %
%                           Janeiro de 2026                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------------------------
% 1. Definição de variáveis
%--------------------------------------------------------------------------

% Variáveis endógenas

var
    c          (long_name='Consumo privado') 
    rk         (long_name='Retorno do capital')
    n          (long_name='Trabalho')
    k          (long_name='Capital privado') 
    x          (long_name='Investimento privado')
    y          (long_name='Produto') 
    w          (long_name='Taxa de salário') 
    rb         (long_name='Taxa de retorno dos ativos financeiros')
    lambda     (long_name='Utilidade marginal do consumo') 
    A          (long_name='Produtividade Total dos Fatores')
    b          (long_name='Dívida bruta do governo')
    int        (long_name='Pagamento de juros')
    R          (long_name='Receita fiscal')
    tauc       (long_name='Taxa de imposto sobre consumo') 
    tauw       (long_name='Taxa de imposto sobre salário') 
    tauk       (long_name='Taxa de imposto sobre a renda do capital') 
    tauo       (long_name='Imposto Lump-Sum')  
    g          (long_name='Gasto primário') 
    cg         (long_name='Consumo público corrente')
    xg         (long_name='Investimento público')
    kg         (long_name='Capital público')
    pb         (long_name='Resultado primário')
    xn         (long_name='Exportações líquidas')
    ca         (long_name='Conta-corrente')
    b_dom      (long_name='Dívida pública doméstica') 
    b_star     (long_name='Dívida pública externa')
    r_star     (long_name='Taxa de juro internacional')
    d_star     (long_name='Dívida externa')
    b_gdp      (long_name='Dívida como proporção do PIB')
    int_gdp    (long_name='Pagamento de juros como proporção do PIB')
    g_gdp      (long_name='Gasto primário como proporção do PIB')
    R_gdp      (long_name='Receita fiscal como proporção do PIB')
    pb_gdp     (long_name='Resultado primário como proporção do PIB')
    ca_gdp     (long_name='Conta-corrente como proporção do PIB')
    b_dom_gdp  (long_name='Dívida pública doméstica como proporção do PIB') 
    b_star_gdp (long_name='Dívida pública externa como proporção do PIB')
;

% Variáveis exógenas

varexo 
    e_A       (long_name='Choque de PTF')
    e_cg      (long_name='Choque no Consumo do Governo')
    e_xg      (long_name='Choque de investimento público')
    e_tauc    (long_name='Choque de imposto sobre consumo')
    e_tauw    (long_name='Choque de imposto sobre salário')
    e_tauk    (long_name='Choque de imposto sobre a renda do capital')
    e_rstar   (long_name='Choque de taxa de juro internacional')
;

% Parâmetros

parameters beta alpha delta psi alpha1 deltag omega varphi phi 
           psi1 sigma alpha_b rho_A rho_cg rho_xg rho_c 
           rho_w rho_k rho_to rho_rstar tauob
           A_ss tauc_ss tauw_ss tauk_ss tauo_ss   
           cg_ss xg_ss d_star_ss y_ss b_gdp_ss r_star_ss;

%--------------------------------------------------------------------------
% 2. Calibragem
%--------------------------------------------------------------------------

r_star_ss     = 0.01;
rb_ss         = r_star_ss;
beta          = 1 / (1 + rb_ss);
alpha         = 0.32;
omega         = 1;
varphi        = 0.455;
phi           = 0.1;
psi1          = 0.01;
sigma         = 2;
alpha1        = 0.1;
psi           = -0.9;
deltag        = 0.1;
rho_A         = 0.42;
rho_cg        = 0.5;
rho_xg        = 0.5;
rho_c         = 0.5;
rho_w         = 0.5;
rho_k         = 0.5;
rho_to        = 0.5;
rho_rstar     = 0.5;
tauob         = 0.03;
A_ss          = 1;
tauc_ss       = 0.162;
tauw_ss       = 0.15;
tauk_ss       = 0.15;
cg_y          = 0.1918;      % Consumo público corrente/PIB
xg_y          = 0.0055;      % Investimento público/PIB 
b_y           = 0.8440;      % Dívida pública/PIB
b_star_y      = 0.1003;      % Dívida pública externa/PIB
x_y           = 0.1642;      % Investimento privado/PIB
d_star_y      = 0.1735;      % Dívida externa/PIB
g_y           = cg_y + xg_y; % Gasto primário/PIB
exp_den       = varphi * (1 - alpha) - alpha1 * (1 + varphi);
exp1          = alpha * (1 + varphi) / exp_den;
exp2          = (1 - alpha) / exp_den;
exp3          = varphi * (1 - alpha) / exp_den;
kg_ss         = (beta * A_ss / (1 - beta))^exp1 * ( (1 - tauk_ss) * alpha - x_y)^exp1 * (( (1 - alpha) * (1 - tauw_ss)*A_ss ) / (omega * (1 + tauc_ss)) )^exp2 * (xg_y * A_ss / deltag)^exp3;                         
k_n           = (beta / (1 - beta) * ((1 - tauk_ss) * alpha - x_y) * A_ss * kg_ss^alpha1)^(1 / (1 - alpha));
n_ss          = ((1 - alpha) * (1 - tauw_ss) * A_ss / (omega * (1 + tauc_ss)) * k_n^alpha * kg_ss^alpha1)^(1 / varphi);
k_ss          = k_n * n_ss;   
y_ss          = A_ss * k_ss^alpha * n_ss^(1 - alpha) * kg_ss^alpha1;
x_ss          = x_y * y_ss;
delta         = x_ss / k_ss;
w_ss          = (1 - alpha) * y_ss / n_ss;
rk_ss         = alpha * y_ss / k_ss;           
cg_ss         = cg_y * y_ss;
xg_ss         = xg_y * y_ss;
g_ss          = g_y * y_ss;
b_ss          = b_y * y_ss;
b_star_ss     = b_star_y * y_ss;  
d_star_ss     = d_star_y * y_ss;
alpha_b       = 1 - b_star_ss / b_ss;
b_dom_ss      = alpha_b * b_ss;
xn_ss         = rb_ss * d_star_ss;
ca_ss         = xn_ss - rb_ss * d_star_ss;
c_ss          = y_ss - x_ss - g_ss - xn_ss;
pb_ss         = rb_ss * b_ss;
int_ss        = pb_ss;
R_ss          = pb_ss + g_ss;
tauo_ss       = R_ss - tauc_ss * c_ss - tauw_ss * w_ss * n_ss - tauk_ss * rk_ss * k_ss;
lambda_ss     = (c_ss + psi * cg_ss - omega * n_ss^(1 + varphi)/(1 + varphi))^(-sigma) / (1 + tauc_ss);
g_gdp_ss      = g_ss / y_ss;
R_gdp_ss      = R_ss / y_ss;
pb_gdp_ss     = pb_ss / y_ss;
b_gdp_ss      = b_ss / y_ss;
int_gdp_ss    = int_ss / y_ss;
ca_gdp_ss     = ca_ss / y_ss;
b_dom_gdp_ss  = b_dom_ss / y_ss;
b_star_gdp_ss = b_star_ss / y_ss;

%--------------------------------------------------------------------------
% 3. Modelo
%--------------------------------------------------------------------------

model;

[name='Equação de Euler']
lambda * (1 + phi*(k - k(-1))) = beta * lambda(+1) * ((1 - tauk(+1)) * rk(+1) + 1 - delta + phi * (k(+1) - k));    

[name='Oferta de trabalho']
w = omega * (1 + tauc) / (1 - tauw) * n^varphi;

[name='Condição de precificação dos ativos financeiros']
1 = beta * lambda(+1) / lambda * (1 + rb);

[name='Utilidade marginal do consumo']
lambda = (c + psi * cg - omega * n^(1 + varphi)/(1 + varphi))^(-sigma) / (1 + tauc);

[name='Função de produção']
y = A * k(-1)^alpha * n^(1 - alpha) * kg^alpha1;

[name='Retorno do capital']
rk = alpha * y / k(-1);

[name='Produtividade marginal do trabalho']
w = (1 - alpha) * y / n;

[name='Lei de movimento do capital']
k = x + (1 - delta) * k(-1) - phi / 2 * (k - k(-1))^2;

[name='Produtividade total dos fatores']
log(A) = rho_A * log(A(-1)) + (1 - rho_A) * log(A_ss) + e_A;

[name='Dinâmica da dívida bruta']
b = (1 + rb(-1)) * b(-1) - pb;

[name='Pagamento de juros']
int = rb(-1) * b(-1);

[name='Receita fiscal']
R = tauc * c + tauw * w * n + tauk * rk * k(-1) + tauo;

[name='Taxa de impostos sobre consumo']
tauc = rho_c * tauc(-1) + (1 - rho_c) * tauc_ss + e_tauc;

[name='Taxa de impostos sobre salário']
tauw = rho_w * tauw(-1) + (1 - rho_w) * tauw_ss + e_tauw;

[name='Taxa de impostos sobre a renda do capital']
tauk = rho_k * tauk(-1) + (1 - rho_k) * tauk_ss + e_tauk;

[name='Outras taxas de impostos']
tauo = rho_to * tauo(-1) + (1 - rho_to) * tauo_ss + tauob * (b_gdp - b_gdp_ss);

[name='Dívida pública doméstica']
b_dom = alpha_b * b;

[name='Dívida pública externa']
b_star = (1 - alpha_b) * b;

[name='Gasto primário']
g = cg + xg;

[name='Gasto corrente']
log(cg) = rho_cg * log(cg(-1)) + (1 - rho_cg) * log(cg_ss) + e_cg;

[name='Gasto de capital']
log(xg) = rho_xg * log(xg(-1)) + (1 - rho_xg) * log(xg_ss) + e_xg;

[name='Lei de movimento do capital público']
kg = xg + (1 - deltag) * kg(-1);

[name='Resultado primário']
pb = R - g;

[name='Taxa de juro da dívida pública']
rb = r_star + psi1 * (exp(d_star / y - d_star_ss / y_ss) - 1);

[name='Taxa de juro internacional']
r_star = rho_rstar * r_star(-1) + (1 - rho_rstar) * r_star_ss + e_rstar;

[name='Demanda agregada']
y = c + x + g + xn;

[name='Exportações líquidas']
xn = (1 + rb(-1)) * d_star(-1) - d_star;

[name='Conta-corrente']
ca = xn - rb(-1) * d_star(-1);

[name='Gasto primário como proporção do PIB']
g_gdp  = g / y;

[name='Receita fiscal como proporção do PIB']
R_gdp  = R / y;

[name='Resultado primário como proporção do PIB']
pb_gdp = pb / y;

[name='Dívida como proporção do PIB']
b_gdp  = b / y;

[name='Pagamento de juros como proporção do PIB']
int_gdp  = int / y;

[name='Conta-corrente como proporção do PIB']
ca_gdp = ca / y;

[name='Dívida pública doméstica como proporção do PIB']
b_dom_gdp  = b_dom / y;

[name='Dívida pública externa como proporção do PIB']
b_star_gdp = b_star / y;

end;

%--------------------------------------------------------------------------
% 4. Valores iniciais
%--------------------------------------------------------------------------

initval;
c          = c_ss;
rk         = rk_ss;
n          = n_ss;
k          = k_ss;
x          = x_ss;
y          = y_ss;
w          = w_ss;
rb         = rb_ss;
lambda     = lambda_ss;
A          = A_ss;
b          = b_ss;
int        = int_ss;
R          = R_ss;
tauc       = tauc_ss;
tauw       = tauw_ss;
tauk       = tauk_ss;
tauo       = tauo_ss;
g          = g_ss;
cg         = cg_ss;
xg         = xg_ss;
kg         = kg_ss;
pb         = pb_ss;
xn         = xn_ss;
ca         = ca_ss;
b_dom      = b_dom_ss;
b_star     = b_star_ss;
r_star     = r_star_ss;
d_star     = d_star_ss;
b_gdp      = b_gdp_ss;
int_gdp    = int_gdp_ss;
g_gdp      = g_gdp_ss;
R_gdp      = R_gdp_ss;
pb_gdp     = pb_gdp_ss;
ca_gdp     = ca_gdp_ss;
b_dom_gdp  = b_dom_gdp_ss;
b_star_gdp = b_star_gdp_ss;
end;

%--------------------------------------------------------------------------
% 5. Estado Estacionário e Condições de Blanchard-Kahn
%--------------------------------------------------------------------------

steady;
check;

%--------------------------------------------------------------------------
% 6. Especificação do choque
%--------------------------------------------------------------------------

shocks;
var e_A;     stderr 0.01;
var e_cg;    stderr 0.01;
var e_xg;    stderr 0.01;
var e_tauc;  stderr 0.01;
var e_tauw;  stderr 0.01;
var e_tauk;  stderr 0.01;
var e_rstar; stderr 0.01;
end; 

%--------------------------------------------------------------------------
% 7. Simulação estocástica
%--------------------------------------------------------------------------

stoch_simul(order = 1, irf = 50);
