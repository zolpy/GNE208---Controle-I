clear all
close all
clc

s = tf('s');

%% Sistema de malha aberta
%Letra a) 
%G =(((-508*(s+1.6))/(((s+14)*(s-1.8)*(s+4.9))-((508)*(s+16)))));
%Quando coloca 508 o ganho é 0.152 e quanod tira é 77
G =(s+8)/((s+7)*(s+6)*(s+10));

% Deseja-se
mp = 0.2;
csi = -log(mp)/sqrt(pi^2+log(mp)^2);
%csi=0.45;

% Lugar das raizes
figure, rlocus(G), 
sgrid(csi,0);