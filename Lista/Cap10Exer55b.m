clear all
close all
clc


numg = [0.78 0.78 0.1872];
deng = poly ([0 -0.0163 -0.5858]);
G = tf(numg, deng);
bode (G);
margin(G);
% grid
% pause
% T = feedback(G,1); %T is the closed-loop TF of the PI-controlled
% % system
% T = minreal(T);
% step(4*T);
% grid
% xlabel ('Time' )
% ylabel ('Speed Sensor Output, c(t) in volts' )
% title ('PI-controlled Systems Response to a 4 volt Input Step' 