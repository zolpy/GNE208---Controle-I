clear all
close all
clc

%% Exemplo 11.3 - compensador avanco
s = tf('s');

% Funcao de transferencia de malha aberta
g = 1/(s*(s+50)*(s+120))

% Especificacoes
Mp = 0.20; % overshoot
kv = 50; % Kv - constante de erro de velocidade
Ts = 0.2; % tempo de pico

%==========================================================================
% Passo 1 - banda passante requerida para malha fechada => wbw
%==========================================================================
csi = -log(Mp)/sqrt(pi^2+log(Mp)^2) % fator de amortecimento
wbw = (4/(Ts*csi))*(sqrt((1-2*csi^2)+sqrt(4*csi^4-4*csi^2+2)))


%==========================================================================
% Passo 2 - ganho K que satisfaz requisito de erro estacionario
%==========================================================================
k = kv/dcgain(g*s)

%==========================================================================
% Passo 3 -  margens de estabilidade inserindo ganho K
%==========================================================================
figure, bode(k*g)

%==========================================================================
% Passo 4 - contribuicao de fase do compensador => PHImax
%==========================================================================
[gm,pm] = margin(k*g) % margens de estabilidade inserindo ganho K
pm_req = 48.1 % margem de fase requerida (100)*csi
pm_seg = 10; % margem de seguranša
phi = (pm_req + pm_seg) - pm % compensacao de fase do compensador - PHImax


%==========================================================================
% Passo 5 - beta
%==========================================================================
beta = (1-sind(phi))/(1+sind(phi))

%==========================================================================
% Passo 6 - magnitude do compensador na fase maxima => A
%==========================================================================
A = 1/sqrt(beta)
AdB = 20*log10(A)

%==========================================================================
% Passo 7 - nova frequencia de margem de fase => wmax
%==========================================================================
figure,
bode(k*g), grid % procurar a amplitude -AdB para obter wmax
wmax = 50;

%==========================================================================
% Passo 8 - T e polos/zeros do compensador
%==========================================================================
T = 1/(wmax*sqrt(beta))
zc = -1/T
pc = -1/(beta*T)

%==========================================================================
% Passo 9 - funcao de trasferencia do compensador
%==========================================================================
kc = 1/beta % compensador deve ter ganho estatico unitario
gc = kc*(s-zc)/(s-pc)
break
%==========================================================================
% Passo 10 - verificar requisitos
%==========================================================================

% Planta, compensador e malha aberta
figure,
bode(gc,k*g,k*g*gc)
legend('G_c(s)','KG(s)','KG_c(s)G(s)')
title('Diagrama de Bode: planta, compensador e malha aberta')

% Malha aberta
figure, 
bode(k*gc*g,k*g,g)
legend('KG_c(s)G(s)','KG(s)','G(s)')
title('Diagrama de Bode de malha aberta')

% Resposta ao degrau
mf = feedback(k*gc*g,1); % malha fechada com ajuste de ganho + compensador
figure, step(mf)
title('Resposta ao degrau - compensacao avanco')

% Resposta a rampa
t = 0:0.01:100;
u = t;
y = lsim(t,u,mf);
figure, plot(t,u,'k-',t,y,'r-'),
legend('Entrada','Saida')
title('Resposta a rampa - compensacao avanco')

% Erro estacionario
kv = dcgain(k*gc*g*s)
ess=1/kv

% Erro estacionario - alternativa
ess=u(end)-y(end) % diferenca entre valores finais da entrada e da saida