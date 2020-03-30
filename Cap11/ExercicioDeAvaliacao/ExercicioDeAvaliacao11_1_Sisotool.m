clear all
clc
close all
pos=20
z=(-log(pos/100))/sqrt((pi^2+log(pos/100)^2))
Pm=atan(2*z/(sqrt(-2*z^2+sqrt(1+4*z^4))))*(180/pi)
G=zpk([],[0 ,-50,-120],1)
sisotool