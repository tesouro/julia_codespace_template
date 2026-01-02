
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 Banco Interamericano de Desarrollo                      %
%                                                                         %
%                           Modelo de Ramsey                              %
%                               Nov 2025                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------------------------
% 1. Definição de variáveis
%--------------------------------------------------------------------------

% Variáveis endógenas

var c k w r A y beta;

% Variáveis exógenas

varexo e_A e_beta;

% Parâmetros

parameters alpha delta sigma rho rho_beta A_ss beta_ss k_ss c_ss w_ss r_ss y_ss;

%--------------------------------------------------------------------------
% 2. Calibragem
%--------------------------------------------------------------------------

alpha = 0.448;
beta_ss = 0.989;
delta = 0.015;
sigma = 1.3;
rho   = 0.91;
rho_beta = 0.70;
A_ss  = 1;
k_ss  = (alpha*A_ss*beta_ss/(1-beta_ss*(1-delta)))^(1/(1-alpha));
c_ss  = A_ss*k_ss^alpha-delta*k_ss;
w_ss  = (1-alpha)*A_ss*k_ss^alpha;
r_ss  = alpha*A_ss*k_ss^(alpha-1)-delta;
y_ss  = A_ss*k_ss^alpha;

%--------------------------------------------------------------------------
% 3. Modelo
%--------------------------------------------------------------------------

model;

[name = 'Salário']
w = (1-alpha)*A*k(-1)^alpha;

[name = 'Taxa de retorno do capital']
r = alpha*A*k(-1)^(alpha-1)-delta;

[name = 'Lei de movimento do capital']
k/k(-1) = 1-delta+A*k(-1)^(alpha-1)-c/k(-1);

[name = 'Trajetória de consumo']
c(+1)/c = (beta*(alpha*A(+1)*k^(alpha-1)+1-delta))^(1/sigma);

[name = 'Função de produção']
y = A*k(-1)^alpha;

[name = 'Produtividade']
log(A) = rho*log(A(-1))+(1-rho)*log(A_ss)+e_A;

[name = 'Fator de desconto subjetivo']
log(beta) = rho_beta*log(beta(-1))+(1-rho_beta)*log(beta_ss)+e_beta;

end;

%--------------------------------------------------------------------------
% 4. Valores iniciais de estado estacionário
%--------------------------------------------------------------------------

initval;
c = c_ss;
k = k_ss;
w = w_ss;
r = r_ss;             
A = A_ss;
y = y_ss;
beta = beta_ss;
end;

%--------------------------------------------------------------------------
% Estado estacionário e resíduos do modelo
%--------------------------------------------------------------------------

steady;   
check;

%--------------------------------------------------------------------------
% 5. Especificação do choque
%--------------------------------------------------------------------------

shocks;
var e_A;    stderr 0.01;
var e_beta; stderr 0.01;
end;

%--------------------------------------------------------------------------
% 6. Simulação estocástica
%--------------------------------------------------------------------------

stoch_simul(order=1, irf=50);
