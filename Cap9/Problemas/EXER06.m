clear all
close all
clc

s = tf('s');

%% Sistema de malha aberta
%Sistema nao compensado
G =(s+6)/((s+2)*(s+3)*(s+5));

%mp = 0.1;
%mp1=powe(8);

%csi = -log(mp)/sqrt(pi^2+log(mp)^2);
csi=0.707;
Beta= acosd(csi);
Alfa=180-Beta;

fprintf('Beta: ');
disp(Beta);
fprintf('Alfa: ');
disp(Alfa);
fprintf('Csi: ');
disp(csi);

% Lugar das raizes
figure, rlocus(G), 
sgrid(csi,0);

%Sistema compensado
Ge =(s+0.238449)/((s+0.01)*(s+3)*(s+5)*(s+7));

% Deseja-se
mp = 0.1;
csi = -log(mp)/sqrt(pi^2+log(mp)^2);
%csi=0.5;

% Lugar das raizes
%figure, rlocus(Ge), 
%sgrid(csi,0);