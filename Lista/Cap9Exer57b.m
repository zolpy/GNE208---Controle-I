clear all
close all
clc

numerador = [48.83 29.3];
denominador = poly ([0 -0.5858]);
Gs = tf(numerador, denominador);
mf = feedback(Gs,1);%T is the closed-loop TF of the PI_compensated system
mf = minreal(mf);
step(4*mf);
% xlabel ('Time')
% ylabel ('Speed Sensor Output, c(t) in volts')
% title ('PI-compensated Systems Response to a 4 volt Input Step')

NumeradorR = 1;
DennominadorR = poly (0);
R = tf(NumeradorR, DennominadorR);
T2 = R*mf;
E= R-T2;%E = Ramp error of PI_compensated system
step(T2,'b', R,'g', E,'r');
% axis ([0, 5, 0, 5]);
% grid
% xlabel ('Time')
% ylabel ('Output Rate, dc(t)/dt, V/s (Blue); Unit Ramp (Green); Error (Red)');
% title ('Response of PI-compensated System to a Unit-ramp Input')