clear all
clc
close all

K=1;
%syms s
s = tf('s');
G=(((K)/((s*(s+2)*(s+5)))))

Mp =0.2
Tp =2 
Kv=10
Csi=((-log(Mp)/sqrt(pi^2+ (log(Mp)^2))))

WBw=(((pi)/(Tp*sqrt(1-Csi^2))*(sqrt((1-2*Csi^2)+sqrt(4*Csi^4-4*Csi^2+2)))))
PmGrafico=22.5
PmRequerido= atand(((2*Csi)/(sqrt(-2*Csi^2+sqrt(1+4*Csi^4)))))
Add=20+PmRequerido

FiMax= Add-PmGrafico
Beta= ((1-sind(FiMax))/(1+sind(FiMax)))
FiMax=asind((1-Beta)/(1+Beta))
Mmax=(1/sqrt(Beta))
Fre1=1/Mmax 
Fre2= 20*log(Fre1) %-10.31

Wmax=11.4
T=1/(Wmax*sqrt(Beta))
Zc=1/T
Pc=1/(Beta*T)
Kc=Pc/Zc
%Gc= Kc*((s+Zc)/(s+Pc))

%figure,nyquist(G1)

%sys=tf(G)
figure,bode(G)
margin(G);
%grid