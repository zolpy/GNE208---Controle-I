close all
clc;
clear all
numerado = [1 0.6];
dennominador = poly ([-0.0163 -0.5858]);
Gs = tf(numerado, dennominador);
rlocus(Gs);
pos=(0);
z=-log(pos/100)/sqrt(pi^2+(log(pos/100))^2);
sgrid(z,0)
% title([ 'Root Locus with ' , num2str(pos) , ' Percent Overshoot Line' ])
[K1,p]=rlocfind(Gs);
% pause
mf=feedback(K1*Gs,1); %T is the closed-loop TF of the system
mf=minreal(mf);
 step(mf);

% figure,step(T);
axis ([0, 8, 0, 1]);
grid