clear all
close all
clc

s = tf('s');

%% Sistema de malha aberta
G =1*(((s+10)*(s+20))/((s+30)*(s^2-20*s+200)));
H = 1;

% Deseja-se
%mp = 0.707;
%csi = -log(mp)/sqrt(pi^2+log(mp)^2)
csi=0.707;

% Lugar das raizes
figure, rlocus(G), 
sgrid(csi,0)