
s = tf('s');
G = (100/(s^2+10*s))
H = 1/(s+5)

Geq = feedback(G,H-1)

K = G/(1+G*(H-1))

Kp = dcgain(Geq)

Erro = 1/(1+Kp)

RdC = minreal(Geq/(1+Geq))

Gmf = feedback (Geq,1) % ou Gmf2

Gmf2 = feedback(G,H)  

figure,step(Gmf)
