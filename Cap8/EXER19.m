clear all
close all
clc
s = tf('s');
K=1;
%% Sistema de malha aberta
G =K*(s+1)/(s*(s+2)*((s+3)*(s+4)));
% mp = 0.40;
% csi = -log(mp)/sqrt(pi^2+log(mp)^2)

figure, rlocus(G),
% sgrid(0.4,0)

