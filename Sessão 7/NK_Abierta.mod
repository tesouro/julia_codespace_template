%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   Banco Interamericano de Desarrollo                    %
%                                                                         %
%             Modelo Novo-Keynesiano de Economia Aberta                   %
%                           Janeiro de 2026                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------------------------
% 1. Definição de variáveis
%--------------------------------------------------------------------------

% Variáveis endógenas

var y_gap pi_h i y_nat r_nat y s pi n m_real r_real w nx c p_h p er d_er y_star p_star a nu;

% Variáveis exógenas

varexo eps_nu eps_a eps_y_star eps_p_star;

% Parâmetros

parameters beta sigma varphi epsilon theta gamma eta eta_m rho_a rho_nu rho_y_star rho_p_star phi_pi phi_y omega sigma_gamma Gamma Psi kappa_gamma Phi_star;

%--------------------------------------------------------------------------
% 2. Calibragem
%--------------------------------------------------------------------------

beta        = 0.99;
sigma       = 1;
varphi      = 1;
epsilon     = 9;
theta       = 0.75;
rho_nu      = 0.5;
rho_a       = 0.9;
phi_pi      = 1.5;
phi_y       = 0.125;
eta_m       = 3.77;
eta         = 1;
gamma       = 0.4;
rho_y_star  = 0.5;
rho_p_star  = 0.5;
omega       = sigma * eta + (1 - gamma) * (sigma * eta - 1);
sigma_gamma = sigma / (1 + gamma * (omega - 1));
Gamma       = (1 + varphi) / (sigma_gamma + varphi);
Psi         = - gamma * (omega - 1) * sigma_gamma / (sigma_gamma + varphi);
kappa_gamma = (1 - theta) * (1 - beta * theta) / theta * (sigma_gamma + varphi);
Phi_star    = sigma_gamma * (gamma * (omega - 1) + Psi);

%--------------------------------------------------------------------------
% 3. Modelo
%--------------------------------------------------------------------------

model(linear); 

[name = 'Curva de Phillips Novo-Keynesiana']
pi_h = beta * pi_h(+1) + kappa_gamma * y_gap;

[name = 'Curva IS dinâmica']
y_gap = y_gap(+1) - 1 / sigma_gamma * (i - pi_h(+1) - r_nat);

[name = 'Regra de Taylor']
i = phi_pi * pi_h + phi_y * y_gap + nu;

[name = 'Taxa de juros natural']
r_nat = - sigma_gamma * Gamma * (1 - rho_a) * a + Phi_star * (y_star(+1) - y_star);

[name = 'Taxa de juros real']
r_real = i - pi_h(+1);

[name = 'Produto natural']
y_nat = Gamma * a + Psi * y_star;

[name = 'Hiato do produto']
y_gap = y - y_nat;

[name = 'Função de produção']
y = a + n;

[name = 'Oferta de trabalho']
w - p = sigma * c + varphi * n;

[name = 'Termos de troca']
s = sigma_gamma * (y - y_star);

[name = 'Balança comercial']
nx = gamma * (omega / sigma - 1) * s;

[name = 'Restrição de recursos']
y = c + nx + gamma * s;

[name = 'Inflação da cesta de consumo']
pi = pi_h + gamma * (s - s(-1));

[name = 'Nível de preços domésticos']
p_h = p_h(-1) + pi_h;

[name = 'Índice de Preços ao Consumidor']
p = p(-1) + pi;

[name = 'Taxa de câmbio nominal']
s = er + p_star -  p_h;

[name = 'Crescimento da taxa de câmbio']
d_er = er - er(-1);

[name = 'Demanda por encaixes reais']
m_real = y - eta_m * i;

[name = 'Choque de produtividade']
a = rho_a * a(-1) + eps_a;

[name = 'Choque de política monetária']
nu = rho_nu * nu(-1) + eps_nu;

[name = 'Choque de demanda externa']
y_star = rho_y_star * y_star(-1) + eps_y_star;

[name = 'Choque de preço externo']
p_star = rho_p_star * p_star(-1) + eps_p_star;

end;

%--------------------------------------------------------------------------
% 4. Estado Estacionário e Condições de Blanchard-Kahn
%--------------------------------------------------------------------------

steady;   
check;

%--------------------------------------------------------------------------
% 5. Especificação do choque
%--------------------------------------------------------------------------

shocks;
var eps_a;      stderr 0.01;
var eps_nu;     stderr 0.01;
var eps_y_star; stderr 0.01;
var eps_p_star; stderr 0.01;
end;

%--------------------------------------------------------------------------
% 6. Simulação estocástica
%--------------------------------------------------------------------------

stoch_simul(order = 1, irf = 20);
