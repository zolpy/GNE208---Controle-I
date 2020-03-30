clear all
clc
close all

K=1440;
s = tf('s');
G=(((K*100))/((s*(s+36)*(s+120))))

%figure,nyquist(G1)

%sys=tf(G)
figure,bode(G)
margin(G);
%grid