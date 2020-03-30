numg=[0 50];
deng=conv([1 6 100],[1 4 25]);
G=tf(numg,deng);
'G(s)'
Gzpk=zpk(G)
nyquist(G)
