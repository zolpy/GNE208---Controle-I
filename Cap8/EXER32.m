clear all
close all
clc

s = tf('s');
k=1000;
K=1;
%% Sistema de malha aberta
G =K/(s*((s+3)*(s+4)*(s+8)));
csi=0.5912;
figure, rlocus(G),
sgrid(csi,0)

% G =k*((1/(1+s))*(1/(s+10)));
% Gc =7.69*(s + 18.64)*(1/(s+143.35));

% figure,bode(G);
% figure,bode(Gc);
% figure,bode(G*Gc);
% mf1= feedback(G*Gc,1);
% figure,step(mf1)