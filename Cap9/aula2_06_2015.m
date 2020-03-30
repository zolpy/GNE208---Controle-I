clear all
close all
clc

% s = tf('s');
% K=1;
%% Sistema de malha aberta
G1=zpk([],[0,-6,-10],1)

% Deseja-se
mp = 20/100
csi = -log(mp)/sqrt(pi^2+log(mp)^2)

figure, rlocus(G1), 
sgrid(csi,0)

K1= 192;
% G1 = K1/(s*(s+6)*(s+10));
mf1=feedback(K1*G1,1)

% Lugar das raizes
figure, step(mf1)
t=0:0.1:10;
r=t;
figure,lsim(mf1,r,t)

sd= -3.64 +- 7.1*i
G1sd = (freqresp(G1,sd))
tetaRAD= angle(G1sd)
% comletmento= pi+tetaRAD
% TetaGraus= tetaRAD*180/pi
% suplemento= pi+TetaGraus
TetaGraus= rad2deg(tetaRAD)
TETA_C= 180+TetaGraus

x=7.1/tand(57)+3.64

GPD= zpk([-8,25],[],1)
figure,rlocus(GPD*G1)
sgrid(csi,0)

% K2=67
% mf2=feedback(K2*GPD*G1,1)
% figure,step(mf2)


