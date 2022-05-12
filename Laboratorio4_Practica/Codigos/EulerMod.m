function M=EulerMod(a,b,h,ci,f,fd,cied)%EULERMOD GERARDO ORELLANA
syms t y
n=int32((b-a)/h);
fexacta = dsolve(fd,cied);
ti=a:h:b;
wi(1)=ci;
exacta=double(subs(fexacta,t,ti));
for i=1:n
    wi(i+1)=wi(i)+h/2*(subs(f,[t,y],[ti(i),wi(i)]))+h/2*(subs(f,[t,y],[ti(i+1),wi(i)+h*(subs(f,[t,y],[ti(i),wi(i)]))]));
end
M=[ti' wi' exacta'];