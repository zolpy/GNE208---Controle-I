clear all
close all
clc

s = tf('s');

%% Sistema de malha aberta
%Letra a) 
G =0.00076*(((s^3+26.316*s^2+1317.4*s+78.947))/(s*(s+0.06)*(s^2+7*s+1220)));


% Deseja-se
%mp = 0.707;
%csi = -log(mp)/sqrt(pi^2+log(mp)^2)
csi=0.824620157442;

% Lugar das raizes
figure, rlocus(G), 
%sgrid(csi,0)