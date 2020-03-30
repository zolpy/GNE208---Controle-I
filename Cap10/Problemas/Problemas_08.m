numg=[1 5];
deng=conv([1 6 100],[1 4 25]);
G=tf(numg,deng);
'G(s)'
Gzpk=zpk(G)
nyquist(G)
axis([-3e-3,4e-3,-5e-3,5e-3])
w=0:0.1:100;
[re,im]=nyquist(G,w);
for i=1:1:length(w)
M(i)=abs(re(i)+j*im(i));
A(i)=atan2(im(i),re(i))*(180/pi);
if 180-abs(A(i))<=1;
re(i);
im(i);
K=1/abs(re(i));
fprintf('\nw = %g',w(i))
fprintf(', Re = %g',re(i))
fprintf(', Im = %g',im(i))
fprintf(', M = %g',M(i))
fprintf(', Angle = %g',A(i))
fprintf(', K = %g',K)
Gm=20*log10(1/M(i));
fprintf(', Gm = %g',Gm)
break
end
end