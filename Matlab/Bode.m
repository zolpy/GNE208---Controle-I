clear all
close all
clc
s = tf('s');
K = 1;
G = K*(100)/((s+1)*(s+10))
H = 1;
L = G*H;
%grid on;
figure, bode(L);
break
w = 0.1;
M = 1/(sqrt((8*w-w^3)^2+(6*w^2)^2))

gan = 20*log(w)