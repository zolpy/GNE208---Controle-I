clear all
clc
close all
pos=20
Ts=0.2
z=(-log(pos/100))/sqrt((pi^2+log(pos/100)^2))
Pm=atan(2*z/(sqrt(-2*z^2+sqrt(1+4*z^4))))*(180/pi)
Wbw=(4/(Ts*z))*sqrt(1-2*z^2+sqrt(4*z^4-4*z^2+2))
K=1942000
G=zpk([],[0 ,-50,-120],K)
sisotool(G,1)