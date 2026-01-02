%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   Banco Interamericano de Desarrollo                    %
%                                                                         %
%                     Modelo RBC com política fiscal                      %
%                           Dezembro de 2025                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------------------------
% 1. Definição de variáveis
%--------------------------------------------------------------------------

% Variáveis endógenas

var 
    c         (long_name='Consumo privado') 
    rk        (long_name='Retorno do capital')
    n         (long_name='Trabalho')
    k         (long_name='Capital privado') 
    x         (long_name='Investimento privado')
    y         (long_name='Produto') 
    w         (long_name='Taxa de salário') 
    rb        (long_name='Taxa de retorno dos ativos financeiros') 
    A         (long_name='Produtividade Total dos Fatores')
    b         (long_name='Dívida bruta do governo') 
    R         (long_name='Receita fiscal')
    tauc      (long_name='Taxa de imposto sobre consumo') 
    tauw      (long_name='Taxa de imposto sobre salário') 
    tauk      (long_name='Taxa de imposto sobre a renda do capital') 
    tauo      (long_name='Imposto Lump-Sum')  
    g         (long_name='Gasto primário') 
    cg        (long_name='Consumo público corrente')
    xg        (long_name='Investimento público')
    kg        (long_name='Capital público')
    pb        (long_name='Resultado primário')
    b_gdp     (long_name='Dívida como proporção do PIB')
    g_gdp     (long_name='Gasto primário como proporção do PIB')
    R_gdp     (long_name='Receita fiscal como proporção do PIB')
    pb_gdp    (long_name='Resultado primário como proporção do PIB')
;

% Variáveis exógenas

varexo 
    e_A       (long_name='Choque de PTF')
    e_cg      (long_name='Choque no Consumo do Governo')
    e_xg      (long_name='Choque de investimento público')
    e_tauc    (long_name='Choque de imposto sobre consumo')
    e_tauw    (long_name='Choque de imposto sobre salário')
    e_tauk    (long_name='Choque de imposto sobre a renda do capital')
;

% Parâmetros

parameters beta alpha delta theta rho_A rho_cg rho_xg A_ss 
           tauc_ss tauw_ss tauk_ss tauo_ss rho_c rho_w rho_k rho_to tauob 
           psi alpha1 deltag xg_ss kg_ss c_ss n_ss k_ss x_ss y_ss b_ss 
           cg_ss rk_ss rb_ss w_ss b_gdp_ss g_gdp_ss R_gdp_ss pb_gdp_ss;

%--------------------------------------------------------------------------
% 2. Calibragem
%--------------------------------------------------------------------------

beta      = 0.9529;
alpha     = 0.448;
delta     = 0.0963;
psi       = 0;
theta     = 0.5;
alpha1    = 0.1;
deltag    = delta;
rho_A     = 0.69;
rho_c     = 0.41;
rho_w     = 0.41;
rho_k     = 0.41;
rho_to    = 0.41;
rho_cg    = 0.47;
rho_xg    = 0.47;  
tauob     = 0.036;
A_ss      = 1;
tauc_ss   = 0.162;
tauw_ss   = 0.15;
tauk_ss   = 0.15;
cg_y      = 0.3891; % Consumo Público/PIB
xg_y      = 0.0004; % Investimento Público/PIB 
b_y       = 0.8637; % Dívida/PIB
x_y       = 0.1642; % Investimento Privado/PIB
k_y       = (beta / (1 - beta)) * ((1 - tauk_ss)*alpha - x_y);
c_y       = 1 - x_y - cg_y - xg_y;
delta     = x_y / k_y;
deltag    = delta;
n_ss      = (1 + (1 - theta) / (theta * (1 - alpha)) * (1 + tauc_ss) / (1 - tauw_ss) * (c_y + psi * cg_y))^(-1);
k_ss      = ((alpha * beta * (1 - tauk_ss) * A_ss / (1 - beta * (1 - delta)))^(1 - alpha1) * (xg_y * A_ss / deltag)^alpha1 * n_ss^(1 - alpha))^(1 / (1 - alpha - alpha1));                     
kg_ss     = (xg_y * A_ss / deltag * k_ss^alpha * n_ss^(1 - alpha))^(1 / (1 - alpha1));
y_ss      = A_ss * k_ss^alpha * n_ss^(1 - alpha) * kg_ss^alpha1;
w_ss      = (1 - alpha) * y_ss / n_ss;
rk_ss     = alpha * y_ss / k_ss;
rb_ss     = 1 / beta - 1;
x_ss      = delta * k_ss;
cg_ss     = cg_y * y_ss;
xg_ss     = xg_y * y_ss;
c_ss      = y_ss - x_ss - cg_ss - xg_ss;
g_ss      = cg_ss + xg_ss;
b_ss      = b_y * y_ss;
pb_ss     = rb_ss * b_ss;
R_ss      = pb_ss + g_ss;
tauo_ss   = R_ss - tauc_ss * c_ss - tauw_ss * w_ss * n_ss - tauk_ss * rk_ss * k_ss;
b_gdp_ss  = b_ss / y_ss;
g_gdp_ss  = g_ss / y_ss;
R_gdp_ss  = R_ss / y_ss;
pb_gdp_ss = pb_ss / y_ss;

%--------------------------------------------------------------------------
% 3. Modelo
%--------------------------------------------------------------------------

model;

[name='Equação de Euler']
(c + psi * cg)^(-1) = beta * (c(+1) + psi * cg(+1))^(-1) * (1 + tauc) / (1 + tauc(+1)) * ((1 - tauk(+1)) * rk(+1) + 1 - delta);

[name='Oferta de trabalho']
n = 1 - (1 - theta) / theta * (1 + tauc) / (1 - tauw) * (c + psi * cg) / w;

[name='Condição de precificação dos ativos financeiros']
(c + psi * cg)^(-1) = beta * (c(+1) + psi * cg(+1))^(-1) * (1 + tauc) / (1 + tauc(+1)) * (1 + rb);

[name='Função de produção']
y = A * k(-1)^alpha * n^(1 - alpha) * kg^alpha1;

[name='Retorno do capital']
rk = alpha * y / k(-1);

[name='Produtividade marginal do trabalho']
w = (1 - alpha) * y / n;

[name='Lei de movimento do capital']
x = k - (1 - delta) * k(-1);

[name='Produtividade total dos fatores']
log(A) = rho_A * log(A(-1)) + (1 - rho_A) * log(A_ss)+ e_A;

[name='Demanda agregada']
y = c + x + cg + xg;

[name='Dinâmica da dívida bruta']
b = (1 + rb(-1)) * b(-1) + g - R;

[name='Gasto primário']
g = cg + xg;

[name='Gasto corrente']
log(cg) = rho_cg * log(cg(-1)) + (1 - rho_cg) * log(cg_ss) + e_cg;

[name='Gasto de capital']
log(xg) = rho_xg * log(xg(-1)) + (1 - rho_xg) * log(xg_ss) + e_xg;

[name='Lei de movimento do capital público']
kg = xg + (1 - deltag) * kg(-1);

[name='Receita fiscal']
R = tauc * c + tauw * w * n + tauk * rk * k(-1) + tauo;

[name='Taxa de impostos sobre consumo']
tauc = rho_c * tauc(-1) + (1 - rho_c) * tauc_ss + e_tauc;

[name='Taxa de impostos sobre salário']
tauw = rho_w * tauw(-1) + (1 - rho_w) * tauw_ss + e_tauw(-3);

[name='Taxa de impostos sobre a renda do capital']
tauk = rho_k * tauk(-1) + (1 - rho_k) * tauk_ss + e_tauk;

[name='Outras taxas de impostos']
tauo = rho_to * tauo(-1) + (1 - rho_to) * tauo_ss + tauob * (b_gdp - b_gdp_ss);

[name='Resultado primário']
pb = R - g;

[name='Dívida como proporção do PIB']
b_gdp  = b / y;

[name='Gasto primário como proporção do PIB']
g_gdp  = g / y;

[name='Receita fiscal como proporção do PIB']
R_gdp  = R / y;

[name='Resultado primário como proporção do PIB']
pb_gdp = pb / y;

end;

%--------------------------------------------------------------------------
% 4. Valores iniciais
%--------------------------------------------------------------------------

initval;
c      = c_ss;
rk     = rk_ss;
n      = n_ss;
k      = k_ss;
x      = x_ss;
y      = y_ss;
w      = w_ss;
rb     = rb_ss;
A      = A_ss;
b      = b_ss;
R      = R_ss;
tauc   = tauc_ss;
tauw   = tauw_ss;
tauk   = tauk_ss;
tauo   = tauo_ss;
g      = g_ss;
cg     = cg_ss;
xg     = xg_ss;
kg     = kg_ss;
pb     = pb_ss;
b_gdp  = b_gdp_ss;
g_gdp  = g_gdp_ss;
R_gdp  = R_gdp_ss;
pb_gdp = pb_gdp_ss;
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
var e_A;    stderr 0.01;  
var e_cg;   stderr 0.01;  
var e_xg;   stderr 0.01;  
var e_tauc; stderr 0.01;  
var e_tauw; stderr 0.01;  
var e_tauk; stderr 0.01;  
end; 

%--------------------------------------------------------------------------
% 7. Simulação estocástica
%--------------------------------------------------------------------------

stoch_simul(order = 1, irf = 50);
