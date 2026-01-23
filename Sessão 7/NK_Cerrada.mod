%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   Banco Interamericano de Desarrollo                    %
%                                                                         %
%             Modelo Novo-Keynesiano de Economia Fechada                  %
%                           Janeiro de 2026                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------------------------
% 1. Definição de variáveis
%--------------------------------------------------------------------------

% Variáveis endógenas

var pi y_gap y_nat y r_nat r_real i n m_real nu a p w c;     

% Variáveis exógenas

varexo  eps_a eps_nu;

% Parâmetros

parameters beta rho_a rho_nu sigma varphi phi_pi phi_y eta_m epsilon theta psi_n_ya kappa;

%--------------------------------------------------------------------------
% 2. Calibragem
%--------------------------------------------------------------------------

beta     = 0.99;
sigma    = 1;
varphi   = 1;
epsilon  = 9;
theta    = 0.75;
rho_nu   = 0.5;
rho_a    = 0.9;
phi_pi   = 1.5;
phi_y    = 0.125;
eta_m    = 3.77;
psi_n_ya = (1 + varphi) / (sigma + varphi);
kappa    = (1 - theta) * (1 - beta * theta) / theta * (sigma + varphi);

%--------------------------------------------------------------------------
% 3. Modelo
%--------------------------------------------------------------------------

model(linear); 

[name = 'Curva de Phillips Novo-Keynesiana']
pi = beta * pi(+1) + kappa * y_gap;

[name = 'Curva IS dinâmica']
y_gap = y_gap(+1) - 1 / sigma * (i - pi(+1) - r_nat);

[name = 'Regra de Taylor']
i = phi_pi * pi + phi_y * y_gap + nu;

[name = 'Taxa de juros natural']
r_nat = - sigma * psi_n_ya * (1 - rho_a) * a;

[name = 'Taxa de juros real']
r_real = i - pi(+1);

[name = 'Produto natural']
y_nat = psi_n_ya * a;

[name = 'Hiato do produto']
y_gap = y - y_nat;

[name = 'Função de produção']
y = a + n;

[name = 'Oferta de trabalho']
w - p = sigma * c + varphi * n;

[name = 'Restrição de recursos']
y = c;

[name = 'Índice de Preços ao Consumidor']
p = p(-1) + pi;

[name = 'Demanda por encaixes reais']
m_real = y - eta_m * i;

[name = 'Choque de produtividade']
a = rho_a * a(-1) + eps_a;

[name = 'Choque de política monetária']
nu = rho_nu * nu(-1) + eps_nu;

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
var eps_a;  stderr 0.01;
var eps_nu; stderr 0.01;
end;

%--------------------------------------------------------------------------
% 6. Simulação estocástica
%--------------------------------------------------------------------------

stoch_simul(order = 1, irf = 20);
