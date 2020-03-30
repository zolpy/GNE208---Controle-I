clear all
close all
clc

s = tf('s');

%% Sistema de malha aberta
%Letra a) 
%G =(((-508*(s+1.6))/(((s+14)*(s-1.8)*(s+4.9))-((508)*(s+16)))));
%Quando coloca 508 o ganho È 0.152 e quanod tira È 77
G =((1/((s*(s+7)))));

% Deseja-se
mp = 0.15;
csi = -log(mp)/sqrt(pi^2+log(mp)^2);
%csi=0.45;

% Lugar das raizes
figure, rlocus(G), 
sgrid(csi,0);


k = 45.89 % retirado do grafico
wn = 6.77 % frequencia natural - retirado do grafico

% Tempo de estabilizacao sem compensador
Ts = 4/(csi*wn)

% Malha fechada sem compensador
mf = feedback(k*G,1)

%% Compensador AVAN«O DE FASE

% Deseja-se
Ts_desejado = Ts/3
Re= 4/Ts_desejado
wn_desejado = 4/(csi*Ts_desejado) % nova frequencia natural

% Polo desejado
s_desejado = -csi*wn_desejado+1i*wn_desejado*sqrt(1-csi^2)
hold on, plot(s_desejado,'rx') % plota no lugar das raizes anterior (nao 
                               % compensado) o polo desejado
hold off

% Calculo do angulo de compensacao
Gw = freqresp(G,s_desejado)
theta_c = pi - angle(Gw)

% Posi√ß√£o do zero - zc
sigma = real(s_desejado) % parte real do polo desejado
wd = imag(s_desejado) % parte imaginaria do polo desejado
 
zc = -(abs(sigma) - abs(wd)/tan(pi-theta_c)) % geometria define posicao do zero

% Compensador PD
gc = s - zc % funcao de transferencia do compensador

% Ganho no sistema compensado
figure, rlocus(gc*G) % procurar ganho relativo ao csi (ou Mp) desejado
sgrid(csi,0)
kc = 47.3 % retirado do grafico

% Malha fechada com compensador
mf_pd = feedback(kc*gc*G,1)

%% Simulacao da resposta ao degrau
figure, step(mf,mf_pd)
legend('Sem compensador','Com compensador PD')

fprintf(['============================================',...
    '\nFizemos rlocus(G_c(s)*G(s)) e selecionamos',...
    '\num ganho que deveria garantir overshoot 0,16.',...
    '\nPor que na simulacao o overshoot foi outro?',...
    '\n============================================\n'])