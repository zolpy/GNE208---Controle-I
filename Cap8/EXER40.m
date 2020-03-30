clear all
close all
clc
numg=1;
deng=poly([0 -3 -7 -8]);
numh=[1 30];
denh=[1 20 200];
G=tf(numg,deng)
Gzpk=zpk(G)
H=tf(numh,denh)
rlocus(G*H)
pause
K=0:10:1e4;
rlocus(G*H,K)
sgrid(0.707,0)
axis([-2,2,-5,5]);
pause
for i=1:1:3;
[K,P]=rlocfind(G*H)
end
T=feedback(K*G,H)
step(T)