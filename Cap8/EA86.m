clear all
close all
clc

s = tf('s');
K=1;
%% Sistema de malha aberta
G = K/((s+2)*(s+4)*(s+6));
H = 1;

% Deseja-se
mp = 10/100
csi = -log(mp)/sqrt(pi^2+log(mp)^2)

% Lugar das raizes
figure, rlocus(G), 
sgrid(csi,0)