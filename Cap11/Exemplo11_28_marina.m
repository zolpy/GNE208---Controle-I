clear all 
clc 
 
 
s=tf('s')
 
 
k= 2.5
G1 =  k*10/((s+1)*(s+5)*s)
G2 = (s+0.9)/(0.05*(s+18))*G1
bode(G1,G2)
 
%Determinar fimax 
 
fimax =  48.06 
a = 20 *ln(4.4)
steep
