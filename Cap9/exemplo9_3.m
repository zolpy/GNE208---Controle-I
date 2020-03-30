%% Exemplo 9-3
% Cap. 9, livro Nise, 5a ed.

clear all, close all, clc

%% Planta
s = tf('s');
g = 1/(s*(s+4)*(s+6))

% Ganho do sistema sem compensador
mp = 0.16
csi = -log(mp)/sqrt(pi^2+log(mp)^2)
figure, rlocus(g),
sgrid(csi,0)


k = 43.2 % retirado do grafico
wn = 2.38 % frequencia natural - retirado do grafico

% Tempo de estabilizacao sem compensador
Ts = 4/(csi*wn)

% Malha fechada sem compensador
mf = feedback(k*g,1)

%% Compensador PD

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
Gw = freqresp(g,s_desejado)
theta_c = pi - angle(Gw)

% Posição do zero - zc
sigma = real(s_desejado) % parte real do polo desejado
wd = imag(s_desejado) % parte imaginaria do polo desejado
 
zc = -(abs(sigma) - abs(wd)/tan(pi-theta_c)) % geometria define posicao do zero

% Compensador PD
gc = s - zc % funcao de transferencia do compensador

% Ganho no sistema compensado
figure, rlocus(gc*g) % procurar ganho relativo ao csi (ou Mp) desejado
sgrid(csi,0)
kc = 47.3 % retirado do grafico

% Malha fechada com compensador
mf_pd = feedback(kc*gc*g,1)

%% Simulacao da resposta ao degrau
figure, step(mf,mf_pd)
legend('Sem compensador','Com compensador PD')

fprintf(['============================================',...
    '\nFizemos rlocus(G_c(s)*G(s)) e selecionamos',...
    '\num ganho que deveria garantir overshoot 0,16.',...
    '\nPor que na simulacao o overshoot foi outro?',...
    '\n============================================\n'])