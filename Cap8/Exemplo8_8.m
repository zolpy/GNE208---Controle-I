clear all
close all
clc

s = tf('s');

%% Sistema de malha aberta
G = 1*(s+1.5)/(s*(s+1)*(s+10));
H = 1;

% Deseja-se
mp = 10/100;
csi = -log(mp)/sqrt(pi^2+log(mp)^2)

% Lugar das raizes
figure, rlocus(G), 
sgrid(csi,0)