clear all
close all
clc

K=160.95

s=tf('s'); 
G=K*1/(s^2+3.056*s+14.59) 

figure,step(G);
grid on;
%s=tf('s'); 
%g=K/S(S+5)
%H=1
%T=feedback(G,H)
%figure,step(T)