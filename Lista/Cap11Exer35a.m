clear all
close all
clc

% K=61.02;
K=40.68;

numera = K*[1 0.6];
denominador = poly ([0 -0.5858]);
Gs = 48.82*tf(numera, denominador);
bode (Gs);
mf = feedback(Gs,1); %T is the closed-loop TF of the PI-controlled system
mf = minreal(mf);
step(4*mf);
axis

% xlabel ('Time')
% ylabel ('Speed Sensor Output, c(t) in volts')
% title ('PI-controlled Systems Response to a 4 volt Input Step')