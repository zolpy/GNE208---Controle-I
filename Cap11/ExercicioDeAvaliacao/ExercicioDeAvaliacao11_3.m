clear all
clc
close all

K=3E5;
s = tf('s');
G=(((K))/((s*(s+50)*(s+120))))

%figure,nyquist(G1)

%sys=tf(G)
figure,bode(G)
margin(G);
%grid