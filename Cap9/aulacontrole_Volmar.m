clc
clear all
close all

%a
G1=zpk([],[0,-6,-10],1);

figure, rlocus(G1)

sgrid(0.456,0)

K1=192;
mf1=feedback(K1*G1,1)
figure, step(mf1)

t=0:0.1:10;
r=t;

figure,lsim(mf1,r,t)

%b
qsi=0.456;
Ts=1.10;
Sigmad=4/Ts

wn=4/(qsi*Ts);

Omegad=wn*sqrt(1-qsi^2)

Sd= 3.64 +- 7.1i;
G1Sd= freqresp(G1,Sd)
teta=angle(G1Sd)

teta2=180*2.1497/pi

tetac= 180 - teta2

%x=(omegad/tgtetac)+omegad

x=7.1/tand(57)+3.64

%Compensador
Gpd= zpk([-8.25],[],1)
figure,rlocus(Gpd*G1)
sgrid(0.456,0)

%interseção com o qsi
K2=67
mf2=feedback(K2*Gpd*G1,1)
figure, step(mf2)

% PI
Gpi = zpk([-0.1],[0],1)  
% assustar o ganho de nobo
figure, rlocus(Gpi*Gpd*G1)
sgrid(0.456,0)
% achho o novo valor de k no grafico
K3=59;
mf3=feedback(K3*Gpi*Gpd*G1,1)
figure,step(mf3)
figure,lsim(mf3,r,t)









