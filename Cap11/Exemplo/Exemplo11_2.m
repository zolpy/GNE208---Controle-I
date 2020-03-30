clear all
clc
close all

K1=1;
K2=1000;
s = tf('s');
%G0=zpk([],[0,-3,-5],K)%G2=zpk([-3,-5],[2,4],K)

G1=(((K1)*(s+4)*(s+6))/(K1+((s+2)*(s+4)*(s+6))))


G2=(((K2)*(s+4)*(s+6))/(K2+((s+2)*(s+4)*(s+6))))

%figure,nyquist(G1)

%sys=tf(G)

figure,bode(G1,G2)
%margin(G1,G2);
%grid