clear all
close all
clc

s = tf('s');

%% Exemplos retirados do livro do Nise, quinta edicao

%% Exemplo 11.1 - ajuste de ganho
k = 3.6
% Funcao de transferencia de malha aberta
g = (100*k/(s+100))*(1/(s+36))*(1/s);

% Requisito
Mp = 9.5/100; % sobressinal requerido

%==========================================================================
% Passo 1 - escolha do ganho inicial
%==========================================================================
% k = 3.6

%==========================================================================
% Passo 2 - margem de fase requerida
%==========================================================================
csi = -log(Mp)/sqrt(pi^2+log(Mp)^2) % fator de amortecimento requerido
pm = 100*csi % margem de fase requerida
% pm = atand(2*csi/sqrt(-2*csi^2+sqrt(1+4*csi^4))) % margem de fase mais precisa

%==========================================================================
% Passo 3 - nova frequencia de margem de fase
%==========================================================================
figure, bode(k*g) % procurar nova frequencia de margem de fase - wpm
margin(g)
title('Diagrama de Bode da malha aberta sem ajuste de ganho')
wpm = 14.3; % nova freq. de margem de fase na qual magnitude deve ser 0 dB

%==========================================================================
% Passo 4 - ganho exigido
%==========================================================================
A = 55; % ganho necessario: diferenca entre 0 dB e a magnitude em wpm
k1 = 10^(A/20) % valor absoluto do ganho

%==========================================================================
% Verificacao do resultado
%==========================================================================
figure, bode(k1*g) % margem de fase deve ser pm e ganho em wpm deve ser 0
title('Diagrama de Bode da malha aberta com ajuste de ganho')

% Malha fechada
mf1 = feedback(k1*g,1); % malha fechada com ajuste de ganho

% Resposta ao degrau
figure, step(mf1)
title('Resposta ao degrau da malha fechada com ajuste de ganho')

% Resposta a rampa
t = 0:0.01:10;
u = t;
figure, lsim(t,u,mf1)
title('Resposta a rampa da malha fechada com ajuste de ganho')
