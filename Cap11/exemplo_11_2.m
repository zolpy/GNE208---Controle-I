clear all, close all, clc

%% Exemplo 11.2 - compensador atraso
s = tf('s');

% Funcao de transferencia de malha aberta
g = (100/(s+100))*(1/(s+36))*(1/s);

% Requisito
Mp = 9.5/100; % sobressinal requerido
ke = 10; % fator de melhora do erro estacionário

%==========================================================================
% Passo 1 - ganho K que garante requisito de erro estacionario
%==========================================================================
k1 = 562.34 % ganho para margem de fase conforme overshoot especificado (Exemplo 11.1)
k = ke*k1 % novo ganho para garantir Kv maior

% kv1 = dcgain(k1*g*s) % Kv quando ganho é k1
% kv2 = dcgain(k*g*s) % Kv com novo ganho

%==========================================================================
% Passo 2 - frequencia de margem de fase requerida => wpm
%==========================================================================

csi = -log(Mp)/sqrt(pi^2+log(Mp)^2); % fator de amortecimento requerido
pm = 100*csi % margem de fase requerida

phi_seg = 10; % valor de segurança => entre 5 e 12 graus
phi = -180 + (pm+phi_seg) % fase na nova freq. de margem de fase (wpm)

figure,
bode(k*g,'r-',k1*g,'b--') % procurar wpm em k*g
legend('Ajuste de ganho que reduz erro','Ajuste de ganho para transiente')
title('Diagrama de Bode da malha aberta')
grid
wpm = 9.8; % frequencia na fase phi

%==========================================================================
% Passo 3 - compensador para garantir magnitude 0dB na frequencia wpm
%==========================================================================

% Assintota de alta frequencia do compensador
kpm = -24; % magnitude (com valor negativo) na frequencia wpm 

% Zero do compensador (zc)
zc = -wpm/10; % aproximadamente uma decada abaixo da freq. wpm 

%--------------------------------------------------------------------------
% Polo do compensador (pc)
%--------------------------------------------------------------------------
% polo => frequencia na qual a reta de inclinacao -20dB/decada, 
% que passa por wpm/10, cruza a magnitude 0 dB

% eq. da reta de inclinacao -20dB/decada que passa por wpm/10
w = 1e-3:1e-3:1e3; % vetor de frequencias
B = (kpm+20*log10(wpm/10)); % coef. linear tal que a reta passa por wpm/10 com ganho -kpm
R20dB = -20*log10(w) + B; % eq. da reta 

% grafico para determinar pc
figure,
semilogx(w,kpm*ones(size(w)),'r--',w,R20dB,'r--',w,0*ones(size(w)),'k-') 
grid

pc = -0.062; % polo do compensador (valor aproximado)

%==========================================================================
% Passo 4 - funcao de transferencia compensador Gc = Kc(s-zc)/(s-pc)
%==========================================================================

kc = pc/zc; % ganho para impor compensador com ganho estatico unitario
gc = kc*(s-zc)/(s-pc) % funcao de transferencia do compensador

%==========================================================================
% Passo 5 - verificacao
%==========================================================================

% Diagramas de Bode de malha aberta
figure, 
bode(k*gc*g,k*g,k1*g) % verifica margens do sistema compensado
legend('KG_c(s)G(s)','KG(s)','K_1G(s)')
title('Diagrama de Bode da malha aberta')

% Resposta ao degrau
mf = feedback(k*gc*g,1); % malha fechada com ajuste de ganho para erro estacionario + compensador
figure, step(mf) 
title('Resposta ao degrau - compensacao atraso')

% Resposta a rampa
t = 0:0.01:10;
u = t;
figure, lsim(t,u,mf)
title('Resposta a rampa - compensacao atraso')
