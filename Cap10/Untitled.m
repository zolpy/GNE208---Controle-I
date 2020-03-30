clear all
close all
clc

s = tf('s');

%% Sistema de malha aberta
%Sistema nao compensado
K=1;
H=1;
%G =K/(s*(s+3)*(s+5));
G =zpk([],[0,-3,-5],100);
nyquist(G*H);
mf=feedback(G,H);
zpk(mf)
pole(mf)
%1/sobre o valor que dá
bode(G*H)%magnitute/20 = resultado // resultado^10
margin(G*H);

figure,step(mf)
