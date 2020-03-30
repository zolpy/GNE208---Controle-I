clear all
clc
close all

K=1;
s = tf('s');
%G0=zpk([],[0,-3,-5],K)%G2=zpk([-3,-5],[2,4],K)

G1=1/s
G2=1/(s+2)
G3=1/(s+4)
G4=((K*(s+5)/((s+2)*(s+4))))
%figure,nyquist(G1)

%sys=tf(G)

figure,bode(G1,G2,G3,G4)
%margin(G4);
%grid