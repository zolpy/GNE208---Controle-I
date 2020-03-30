clear all
clc
close all

K=3.5;
K2=583.9;
s = tf('s');
%G0=zpk([],[0,-3,-5],K)%G2=zpk([-3,-5],[2,4],K)
G2=((K2*100)/((s+100)*(s+36)*s))
G1=((K*100)/((s+100)*(s+36)*s))
%figure,nyquist(G1)

%sys=tf(G)
figure,bode(G1,G2)
%margin(G1);
%grid