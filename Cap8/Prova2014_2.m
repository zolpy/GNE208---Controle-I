clear all
close all
clc
s = tf('s');
K=1;
%% Sistema de malha aberta
G =K/(s*((s+20)*(s+40)));
mp = 0.20;
csi = -log(mp)/sqrt(pi^2+log(mp)^2)

figure, rlocus(G),
sgrid(csi,0)

% G =k*((1/(1+s))*(1/(s+10)));
% Gc =7.69*(s + 18.64)*(1/(s+143.35));

% figure,bode(G);
% figure,bode(Gc);
% figure,bode(G*Gc);
% mf1= feedback(G*Gc,1);
% figure,step(mf1)