clear all
clc
close all

K=40;
s = tf('s');
%G0=zpk([],[0,-3,-5],K)%G2=zpk([-3,-5],[2,4],K)

G1=((K/((s+2)*(s+4)*(s+5))))

figure,nyquist(G1)

%sys=tf(G)
figure,bode(G1)
grid