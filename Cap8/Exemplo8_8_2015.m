clear all
close all
clc

s = tf('s');

%% Sistema de malha aberta
K = 1;
G = K*(s+1.5)/(s*(s+1)*(s+10));
H = 1;

% Deseja-se
mp = 1.52/100;
csi = -log(mp)/sqrt(pi^2+log(mp)^2)

% Lugar das raizes
figure, rlocus(G), 
 sgrid(csi,0)
K1=39.7;
mf1=feedback(K1*G,H);
figure,step(mf1);

K2=12.7;
mf2=feedback(K2*G,H);
figure,step(mf2);

K3=7.37;
mf3=feedback(K3*G,H);
figure,step(mf3);

zpk(mf1)
zpk(mf2)
zpk(mf3)
% definindo no matlab
% s=tf('s');
mf1a=K1*(1.5/1.796)/(s^2 + 9.205*s + 33.18)
figure,step(mf1,mf1a);

mf2a=K2*(1.5/8.624)/(s^2 + 2.376*s + 2.209)
figure,step(mf2,mf2a);

mf3a=K3*(1.5/9.252)/(s^2 + 1.748*s + 1.195)
figure,step(mf3,mf3a);


