%% Exemplo 9-2
% Cap. 9, livro Nise, 5a ed.

clear all, close all, clc

%% Planta
s = tf('s');
g = 1/((s+1)*(s+2)*(s+10))
figure, rlocus(g),

% Ganho sem compensador
sgrid(0.174,0)
k_sc = 161 % retirado do grafico

% Erro estacionario sem compensador
kp_sc = dcgain(k_sc*g); 
ess_sc = 1/(1+kp_sc) 

% Malha fechada sem compensador
mf_sc = feedback(k_sc*g,1);

%% Compensador atraso
ess_ca = ess_sc/10 % erro 10 vezes menor
kp_ca = (1-ess_ca)/ess_ca % nova constante de erro

pc = -0.01 % polo do compensador (escolha arbitraria)
zc = pc*(kp_ca/kp_sc)

gc = (s-zc)/(s-pc) % funcao de transferencia do compensador

% Ganho no sistema compensado
figure, rlocus(gc*g)
sgrid(0.174,0)
k_ca = 156; % retirado do grafico

% Malha fechada com compensador
mf_ca = feedback(k_ca*gc*g,1)

%% Compensador atraso - polo em outra posicao arbitraria

pc2 = -0.001 % polo do compensador (escolha arbitraria)
zc2 = pc2*(kp_ca/kp_sc)

gc2 = (s-zc2)/(s-pc2) % funcao de transferencia do compensador

% Ganho no sistema compensado
figure, rlocus(gc2*g)
sgrid(0.174,0)
k_ca2 = 162;

% Malha fechada com compensador
mf_ca2 = feedback(k_ca2*gc2*g,1)

%% Simulacao da resposta ao degrau
figure, step(mf_sc,mf_ca,mf_ca2)
legend('Sem compensador','Compensador atraso 1','Compensador atraso 2')

% 'Zoom' na resposta transitoria
figure, step(mf_sc,mf_ca,mf_ca2,25)
legend('Sem compensador','Compensador atraso 1','Compensador atraso 2')


fprintf(['==============================================',...
    '\nQual a diferenca entre os dois compensadores?',...
    '\n==============================================\n'])