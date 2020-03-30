clear all
close all
clc

%MF=60º e Kv=5
%Kv = lim G com s -> 0
%K = 2,5

s = tf('s');
k = 2.5;
G = 10*k/(s*(s+1)*(s+5));

bode(G)

%MF=3.94;
%5º<FIseg<12º
FIseg = 8.5;
FImax=60-3.94+FIseg;
beta = (1-sind(FImax))/(1+sind(FImax));
A = 1/sqrt(beta)
AdB = 20*log10(A);
Wmax=4;
T=1/(Wmax*sqrt(beta));
z=-1/T;
p=-1/(beta*T);

Gc = (1/beta)*(s+1/T)/(s+1/(beta*T));
bode(Gc*G)


