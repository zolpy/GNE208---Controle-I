clear all
clc
close all

K=1;
s = tf('s');
G=(((K*(s+10)*(s+11))/((s*(s+3)*(s+6)*(s+9)))))

%figure,nyquist(G1)

%sys=tf(G)
figure,bode(G)
margin(G);
%grid