clear all
clc
close all

s = tf('s');
PM=100*0.6
K2=3.6;
% G1=((K/((s+5)*(s+20)*(s+50))))
G2=((K2/(s*(s+100)*(s+36))))

%PM=100*csi
%sys=tf(G)
figure,bode(G2) %LETRA A
margin(G2);
% grid
 figure,nyquist(G2) %LETRA B

%malha fechada agora e fazer
% mf2=feedback(G2,1);
% figure,step(mf2)