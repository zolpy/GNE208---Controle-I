close all
clc;
clear all
numerador = poly ([-0.4 -0.6]);
denominador = poly ([0 -0.0163 -0.5858]);
Gs = tf(numerador, denominador);
rlocus(Gs);
pos=(10);
z=-log(pos/100)/sqrt(pi^2+(log(pos/100))^2);
axis ([-1, 0, -0.5, 0.5]);
sgrid(z,0)
% title([ 'Root Locus with ' , num2str(pos) , ' Percent Overshoot Line' ])
[K1,p]=rlocfind(Gs);
% pause
mf=feedback(K1*Gs,1); %T is the closed-loop TF of the system
mf=minreal(mf);
step(mf);
axis ([0, 20, 0, 1.5]);
grid