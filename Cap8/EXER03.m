clear all
close all
clc

s = tf('s');

%% Sistema de malha aberta
%Letra a) G =1*(((s+2)*(s+6))/(s^2+8*s+25));
%Letra b) G =1*(((s^2+4))/(s^2+1));
%Letra c) G =1*(((s^2+1))/(s^2));
%Letra d) 
G =(1/(((s+1)^3)*(s+4)));

% Deseja-se
%mp = 0.707;
%csi = -log(mp)/sqrt(pi^2+log(mp)^2)
csi=0.824620157442;

% Lugar das raizes
figure, rlocus(G), 
%sgrid(csi,0)