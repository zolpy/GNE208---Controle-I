clear all
close all
clc

s = tf('s');

%% Sistema de malha aberta
%Letra a) 
G =1*(((s))/((s^2+1)));


% Deseja-se
%mp = 0.707;
%csi = -log(mp)/sqrt(pi^2+log(mp)^2)
csi=0.824620157442;

% Lugar das raizes
figure, rlocus(G), 
sgrid(csi,0)