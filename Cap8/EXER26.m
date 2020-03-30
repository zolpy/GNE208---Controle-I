clear all
close all
clc
s = tf('s');
K=1;
%% Sistema de malha aberta
G =K/((s+1)*((s+2)*(s+3)));
 mp = 0.20;
 csi = -log(mp)/sqrt(pi^2+log(mp)^2)

figure, rlocus(G),
 sgrid(csi,0)

