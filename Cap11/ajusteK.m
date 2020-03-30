clear all;
close all;
clc;

%% Determine K para overshoot de 9.5%
% CSI = 0.6
% PM = 59.6°
% k = 3.6 (dado inicial)

Mp = 0.095;
CSI = - logm(Mp)/sqrt((pi^2) + (logm(Mp)^2))
PM = atand (2*CSI/sqrt(-2*CSI^2 + sqrt(1+4*CSI^4)))
PM2 = 100*CSI

% Como PM 60, temos que subir o diagrama de fase em 60°. Assim temos que
% 180-60 = 120. Logo quando a fase e 120° a frequencia de fase e 14.4,
% olhando acima deste ponto vemos que a magnitude e -55dB, e queremos zerar
% a magnitude nesse ponto para que a fase seja 120.

s = tf('s');
G = zpk([],[0,-100,-36],100)
H = 1;
%figure, rlocus(G*H)
%sgrid(0.504,0)
k = 3.6;
ganhoAbsoluto = 10^(44/20);
ganhoNovo = k*ganhoAbsoluto

%% Bode de malha aberta, o qual devemos analisar.
figure, bode(ganhoNovo*G)
% margin(G)
figure, nyquist(ganhoNovo*G)

mf1 = feedback(ganhoNovo*G,H)
figure, step(mf1)