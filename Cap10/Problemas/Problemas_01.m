clear all
clc
close all

K=2.5;
s = tf('s');
%G0=zpk([],[0,-3,-5],K)%G2=zpk([-3,-5],[2,4],K)

G1=((K*(10))/((s)*(s+1)*(s+5)))
%figure,nyquist(G1)

FiSeg=8.5
FiMax=60-3.94+FiSeg
Beta=((1-sind(FiMax)/(1+sind(FiMax))))
%sys=tf(G)
A=1/sqrt(Beta)
figure,bode(G1)
margin(G1);
%grid