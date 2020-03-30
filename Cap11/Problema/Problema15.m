clear all
clc
close all

K=1440;
syms s
s = tf('s');
G=(((K*100)/((s*(s+36)*(s+100)))))

Mp =0.2
Tp =0.1 
Kv=40
Csi=((-log(Mp)/sqrt(pi^2+ (log(Mp)^2))))

WBw=(((pi)/(Tp*sqrt(1-Csi^2))*(sqrt((1-2*Csi^2)+sqrt(4*Csi^4-4*Csi^2+2)))))
Pm= atand(((2*Csi)/(sqrt(-2*Csi^2+sqrt(1+4*Csi^4)))))
Add=10+Pm
PmGrafico=34.1
FiMax= Add-PmGrafico
Beta= ((1-sind(FiMax))/(1+sind(FiMax)))
FiMax=asind((1-Beta)/(1+Beta))
Mmax=(1/sqrt(Beta))
Fre=1/Mmax 
Fre2=20*log(Fre)

Wmax=53.3
T=1/(Wmax*sqrt(Beta))
Zc=1/T
Pc=1/(Beta*T)
Kc=Pc/Zc
Gc= Kc*[(s+Zc)/(s+Pc)]

%figure,nyquist(G1)

%sys=tf(G)
figure,bode(G)
margin(G);
%grid