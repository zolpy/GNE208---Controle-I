clear all
clc
close all

K1=1e4;
s = tf('s');
%G0=zpk([],[0,-3,-5],K)
%G2=zpk([-3,-5],[2,4],K)
%G2=zpk([],[-5,-18,-30],K)

% G1=((K/((s+5)*(s+20)*(s+50))))
G1=((K1/((s+5)*(s+18)*(s+30))))

%sys=tf(G)
figure,bode(G1) %LETRA A
margin(G1);
figure,nyquist(G1) %LETRA B
%grid
%malha fechada agora e fazer
mf1=feedback(G1,1);
figure,step(mf1)
%%%%%

K2=3.8e4;
s = tf('s');
%G0=zpk([],[0,-3,-5],K)
%G2=zpk([-3,-5],[2,4],K)
%G2=zpk([],[-5,-18,-30],K)

% G1=((K/((s+5)*(s+20)*(s+50))))
G2=((K2/((s+5)*(s+18)*(s+30))))

PM=100*csi
%sys=tf(G)
figure,bode(G2) %LETRA A
margin(G2);
figure,nyquist(G2) %LETRA B
%grid
%malha fechada agora e fazer
mf2=feedback(G2,1);
figure,step(mf2)