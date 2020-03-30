clear all
clc
close all

K=112;
s = tf('s');
%G0=zpk([],[0,-3,-5],K)%G2=zpk([-3,-5],[2,4],K)

G1=((1.96*(s^2+s+0.25)*(s^2+1.26*s+9.87)/((s^2+0.015*s+0.57)*(s^2+0.083*s+17.2))))

%figure,nyquist(G1)

%sys=tf(G)
figure,bode(G1)
margin(G1);
%grid