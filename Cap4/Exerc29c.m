clear all
close all
clc

K=0.669

s=tf('s'); 
G=K*1/(s^2+0.458*s+0.669 ) 

figure,step(G);
grid on;
%s=tf('s'); 
%g=K/S(S+5)
%H=1
%T=feedback(G,H)
%figure,step(T)