clear all
close all
clc

s = tf('s');

%% Sistema de malha aberta
G =(((1*(s^2+20*s+200))/(s*(s+3)*(s+7)*(s+8)*(s^2+20*s+200)+(s+30))));

% Deseja-se
%mp = 0.707;
%csi = -log(mp)/sqrt(pi^2+log(mp)^2)
csi=0.824620157442;

% Lugar das raizes
figure, rlocus(G), 
%sgrid(csi,0)