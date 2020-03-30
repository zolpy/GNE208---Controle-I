clear all;
close all;
clc;

s = tf('s');
G = zpk([],[-5,-18,-30],10000);
H = 1;
%figure, rlocus(G*H)
%sgrid(0.504,0)
k = 1; % para valores maior que 3.8 o sistema fica instavel. No diagramde de Nyquist veremos que -1/a < -1
%% Bode de malha aberta, o qual devemos analisar.
figure
bode(G)
margin(G)
% margin(G)
figure
nyquist(k*G)


% Resultados:

% Pelo Bode e Nyquist foi oberservado os mesmo valores.
% Margem de fase: 52.3°
% Frequencia de margem de fase: 12.9 rad/s
% Margem de ganho: 11.7 dB -> 10^(11.7/20) = 3.8 // Para fica no limite de
% estabilidade, (-1 no Nyquist, a = 1)
% Frequencia de margem de ganho: 27.9 rad/s
% Malha fechada estavel.

% Estas maggens indicam o quanto pode colocar de ganho para o controlador.

% Magnitude: 11.4dB
% Kp: 3.7     // 10^(11.4/20)   -> 11.4 = 20 log Kp 
% ou Kp= 10000/(5*18*30) = 3.71 // w -> 0 assim G(s) -> Kp

% ess: 0.21

%%

mf1 = feedback(k*G,H)
figure
step(mf1)

% CSI = 0.3527
% Magem de fase = 100*CSI
% ou PM = tg^-1 (2CSI/sqrt(-2*CSI + sqrt(1+4+CSI^4)))
CSI = 0.3527;
PM = atand (2*CSI/sqrt(-2*CSI^2 + sqrt(1+4*CSI^4)))
PM2 = 100*CSI

%% Colocar ganho maior que a MG e menor para ver o que acontece:

% Aumentando o ganho diminui GM e PM e diminuindo o ganho aumenta a GM e
% PM.

% GM é o tanto que o sistema pode varia e fica estavel.