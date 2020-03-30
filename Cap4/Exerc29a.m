clear all
close all
clc

K=81.967

s=tf('s'); 
G=K/(s+40.984) 

figure,step(G);
grid on;
%s=tf('s'); 
%g=K/S(S+5)
%H=1
%T=feedback(G,H)
%figure,step(T)