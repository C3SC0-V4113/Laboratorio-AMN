function M=PuntoMedio(a,b,h,ci,f,ed,ya)
syms t y
n=int32((b-a)/h);
ti=a:h:b;
fexacta = dsolve(ed,ya);
exacta=double(subs(fexacta,t,ti));
wi(1)=ci;
for i=1:n
    wi(i+1)=wi(i)+h*(subs(f,[t,y],[ti(i)+h/2,wi(i)+h/2*(subs(f,[t,y],[ti(i),wi(i)]))]));
end
fprintf('        ti                  wi             exacta ');
fprintf('\n');
M=[ti' wi' exacta'];