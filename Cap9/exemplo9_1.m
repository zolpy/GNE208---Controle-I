%% Exemplo 9-1
% Cap. 9, livro Nise, 5a ed.

clear all, close all, clc

%% Planta
s = tf('s');
g = 1/((s+1)*(s+2)*(s+10));

% Ganho sem compensador
figure, rlocus(g),
sgrid(0.174,0)
k1 = 161; % retirado do grafico

% Erro estacionario sem compensador
kp = dcgain(k1*g); 
ess_degrau = 1/(1+kp)

% Malha fechada sem compensador
mf1 = feedback(k1*g,1);

%% Compensador PI
zc = -0.1; % zero do compensador (escolha arbitraria)
gc = (s-zc)/s;

% Ganho no sistema compensado
figure,rlocus(gc*g),
sgrid(0.174,0)
k2 = 155; % retirado do grafico

% Malha fechada com compensador
mf2 = feedback(k2*gc*g,1);

%% Simulacao da resposta ao degrau
figure,step(mf1,mf2)
legend('sem compensador','com compensador')
