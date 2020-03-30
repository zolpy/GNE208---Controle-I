clear all
close all
clc

K = 0.78;
numerador = K*[1 0.6];
denominador = poly ([-0.0163 -0.5858]);
Gs = tf(numerador, denominador);
bode (Gs);
margin(Gs);

mf = feedback(Gs,1); %T is the closed-loop TF of the P_controlled
mf = minreal(mf);
step(4*mf);
% xlabel ('Time' )
% ylabel ('Speed Sensor Output, c(t) in volts' )
% title ('P-controlled Systems Response to a 4 volt Input Step' )