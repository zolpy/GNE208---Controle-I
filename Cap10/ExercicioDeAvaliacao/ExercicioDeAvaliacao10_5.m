clear all
clc
close all

K=1;
s = tf('s');
%G0=zpk([],[0,-3,-5],K)%G2=zpk([-3,-5],[2,4],K)

G1=((K/(s^2)))

nyquist(G1)
figure, bode(G1)
margin(G1)