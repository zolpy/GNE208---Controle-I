clear all
clc
close all

K=70;
s = tf('s');
%G0=zpk([],[0,-3,-5],K)%G2=zpk([-3,-5],[2,4],K)

G1=((K*(s+20))/((s+7)*(s+70)*(s^2+2*s+25)))
figure,nyquist(G1)

%sys=tf(G)
figure,bode(G1)
margin(G1);
%grid