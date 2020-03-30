clear all
close all
clc

s = tf('s');

%% Sistema de malha aberta
G =1/((s+1)*(s+3)*(s+10));
%mp = 0.2;
%csi = -log(mp)/sqrt(pi^2+log(mp)^2);
csi=0.5;
% Lugar das raizes
figure, rlocus(G), 
sgrid(csi,0);

Ge =1*(s+0.1)/(s*(s+1)*(s+3)*(s+10));

% Deseja-se
%mp = 0.2;
%csi = -log(mp)/sqrt(pi^2+log(mp)^2);
csi=0.5;

% Lugar das raizes
figure, rlocus(Ge), 
sgrid(csi,0);