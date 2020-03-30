clear all
close all
clc

s = tf('s');

%% Sistema de malha aberta
%Letra a) 
%G =(((-508*(s+1.6))/(((s+14)*(s-1.8)*(s+4.9))-((508)*(s+16)))));
%Quando coloca 508 o ganho é 0.152 e quanod tira é 77
G =(((1*(s+1.6))/(((s+14)*(s-1.8)*(s+4.9)))));

% Deseja-se
%mp = 0.707;
%csi = -log(mp)/sqrt(pi^2+log(mp)^2)
csi=0.45;

% Lugar das raizes
figure, rlocus(G), 
sgrid(csi,0)
%LETRA D 
Ge =(((1*(s+1.6))/(s*((s+1.01)*(s^2+16.088*s+258.8066)))));
figure, rlocus(Ge), sgrid(csi,0)