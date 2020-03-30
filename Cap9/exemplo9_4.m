%% Exemplo 9-4
% Cap. 9, livro Nise, 5a ed.

clear all, close all, clc


%% Planta
s = tf('s');
g = 1/(s*(s+4)*(s+6));

% Ganho do sistema sem compensador
mp = 0.30;
csi = -log(mp)/sqrt(pi^2+log(mp)^2)
figure, rlocus(g),
sgrid(csi,0)
k = 63.1; % retirado do grafico
wn = 2.81; % frequencia natural - retirado do grafico

% Tempo de estabilizacao sem compensador
Ts = 4/(csi*wn)

% Malha fechada sem compensador
mf = feedback(k*g,1);

%% Compensador Avanço
Ts_desejado = Ts/2
wn_desejado = 4/(csi*Ts_desejado) % nova frequencia natural desejada

% Polo desejado
s_desejado = -csi*wn_desejado+1i*wn_desejado*sqrt(1-csi^2);
sigma = real(s_desejado); 
wd = imag(s_desejado);

hold on, plot(s_desejado,'rx') % plota no lugar das raizes anterior (nao 
                               % compensado) o polo desejado
text(sigma,wd,['s=',num2str(s_desejado),' '],...
    'VerticalAlignment','bottom','HorizontalAlignment','right')
hold off

%% Compensador (a)
zca = -5; % zero do compensador avanco - escolha arbitraria
ngca = s - zca; % numerador da funcao de transferencia do compensador

% Calculo do angulo de compensacao
gwa = freqresp(g*ngca,s_desejado);
phi = pi - angle(gwa)

% Posição do polo
pca = -(abs(sigma) + abs(wd)/abs(tan(phi)))  % geometria

% Funcao de transferencia do compensador
gca = ngca/(s-pca);

% Ganho no sistema com compensador avanco (a)
figure, rlocus(gca*g) 
sgrid(csi,0);
ka = 1.37e3;

% Malha fechada com compensador (a)
mfa = feedback(ka*gca*g,1);

%% Compensador (b)
zca = -4; % zero do compensador avanco - escolha arbitraria
ngcb = s - zca; % numerador da funcao de transferencia do compensador

% Calculo do angulo de compensacao
gwb = freqresp(g*ngcb,s_desejado);
phi = pi - angle(gwb)

% Posição do polo
pcb = -(abs(sigma) + abs(wd)/abs(tan(phi))) % geometria

% Funcao de transferencia do compensador
gcb = ngcb/(s-pcb);

% Ganho no sistema com compensador avanco (b)
figure, rlocus(gcb*g) 
sgrid(csi,0)
kb = 680;

% Malha fechada com compensador (b)
mfb = feedback(kb*gcb*g,1);

%% Compensador (c)
zca = -2; % zero do compensador avanco - escolha arbitraria
ngcc = s - zca; % numerador da funcao de transferencia do compensador

% Calculo do angulo de compensacao
gwc = freqresp(g*ngcc,s_desejado);
phi = pi - angle(gwc)

% Posição do polo
pcc = -(abs(sigma) + abs(wd)/abs(tan(phi)))

% Funcao de transferencia do compensador
gcc = ngcc/(s-pcc);

% Ganho no sistema com compensador avanco (c)
figure, rlocus(gcc*g) 
sgrid(csi,0)
kc = 346;

% Malha fechada com compensador (c)
mfc = feedback(kc*gcc*g,1);

%% Simulacao da resposta ao degrau
figure, step(mf,mfa,mfb,mfc), 
legend('Sem compensador','Com compensador (a)','Com compensador (b)','Com compensador (c)')

fprintf(['============================================',...
    '\nQual o melhor compensador?',...
    '\n============================================\n'])
