clear all
close all
clc

syms s N KLSS KHSS KG JR JG tel s
numGdt=3.92*N^2*KLSS*KHSS*KG*s;
denGdt=(N^2*KHSS*(JR*s^2+KLSS)*(JG*s^2*(tel*s+1)+KG*s)+JR*s^2*KLSS*((JG*s^2+KHSS)*(tel*s+1)+KG*s));
Gdt=numGdt/denGdt;
%Gdt in General Terms'
pretty(Gdt)
%Values to Substitute'
KLSS=12.6e6;
KHSS=301e3;
KG=668;
JR=190120;
JG=3.8;
tel=20e-3;
numGdt=3.92*N^2*KLSS*KHSS*KG*s;
numGdt=vpa(numGdt,4);
denGdt=(N^2*KHSS*(JR*s^2+KLSS)*(JG*s^2*(tel*s+1)*KG*s)+JR*s^2*KLSS*((JG*s^2+KHSS)*(tel*s+1)+KG*s));
denGdt=vpa(denGdt,4);
%'Gdt with Values Substituted'
Gdt=numGdt/denGdt;
pretty(Gdt);
Gdt=expand(Gdt);
Gdt=vpa(Gdt,4);
%'Gdt Different Form 1'
pretty(Gdt);
denGdt=collect(denGdt,N^2);
%'Gdt Different Form 2'
Gdt=collect(Gdt,N^2);
pretty(Gdt)
[numGdt,denGdt]=numden(Gdt);
numGdt=numGdt/0.4349e10;
denGdt=denGdt/0.4349e10;
denGdt=expand(denGdt);
denGdt=collect(denGdt,N^2);
Gdt=vpa(numGdt/denGdt,4);
%'Gdt Different Form 3'
pretty(Gdt)
%'Putting into Form for RL as a Function of N^2 using previous results'
numGH=[1 49.99 8855 3313 582400];
denGH=[41.87 2094 0.3684e7 0.1658e9 0];
denGH=denGH/denGH(1);
GH=tf(numGH,denGH);
GHzpk=zpk(GH);
%'Zeros of GH'
rootsnumGH=roots(numGH);
%'Poles of GH'
rootsdenGH=roots(denGH);
K=0:1:10000;
rlocus(GH,K), sgrid(0.5,0);
pause
axis([-10,0,-20,20])
[K,P]=rlocfind(GH);