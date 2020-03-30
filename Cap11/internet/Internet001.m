clear all
clc
close all

K1=1;
K2=1000;
s = tf('s');
%G0=zpk([],[0,-3,-5],K)%G2=zpk([-3,-5],[2,4],K)

G1=(((5*s+1))/((50*s+1)))



%figure,nyquist(G1)

%sys=tf(G)

figure,bode(G1)
margin(G1);
sisotool
%grid