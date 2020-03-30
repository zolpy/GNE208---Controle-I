close all
clc;
clear all
numerador = [1 0.6];
denominador = poly ([-0.0163 -0.5858]);
G = tf(numerador, denominador);
rlocus(G);
axis ([-0.8, 0.1, -0.1, 0.1]);
pos=(0);
z=-log(pos/100)/sqrt(pi^2+(log(pos/100))^2);
sgrid(z,0)
% title(['Root Locus with ', num2str(pos) ,' Percent Overshoot Line'])
[K1,p]=rlocfind(G);
mf=feedback(K1*G,1);%Tu is the closed-loop TF of the uncompensated system
mf=minreal(mf);
step(4*mf);
% xlabel ('Time')
% ylabel ('Speed Sensor Output, c(t) in volts')
% title (['Step Response of Uncompensated System at K = ', num2str(K1),' to a 4 volt Input Step'])
% grid