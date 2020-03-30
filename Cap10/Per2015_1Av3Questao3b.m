clear all
clc
close all
% o intuito aqui ´verificar atravez do graficos de bode  quantos polos tem
% o sitema

K=1;
s = tf('s');
%G0=zpk([],[0,-3,-5],K)
%G2=zpk([-3,-5],[2,4],K)

G1=(((K)/((s+3)*(s+4)*(s+5))));

figure,bode(G1)
margin(G1);
% nyquist(G1);