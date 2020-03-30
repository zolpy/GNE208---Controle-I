clear all
close all
clc

s = tf('s');

%% Sistema de malha aberta
%Letra a) 
%CONFIGURAÇÃO A
K=1;
zfA=1500;
pfA=1000;
csizA=-0.45;
wza=4500;
csi1A=-0.5;
w1A=995;
csi2A=0.3;
w2A=3500;
G =(K*(s+zfA)*(s^2+2*csizA*wza*s+wza^2))/(((s+pfA)*(s^2-2*csi1A*w1A*s+w1A^2)*(s^2+2*csi2A*w2A*s+w2A^2)));

%mp = 0.707;
%csi = -log(mp)/sqrt(pi^2+log(mp)^2)
csi=0.45;

% Lugar das raizes
figure, rlocus(G), 
%sgrid(csi,0)
