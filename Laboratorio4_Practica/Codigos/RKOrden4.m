function M=RKOrden4(a,b,h,ci,f,fd,cied)%RUNGE-KUTTA ORDEN 4
syms t y
n=int32((b-a)/h);
fexacta = dsolve(fd,cied);
ti=a:h:b;
wi(1)=ci;
exacta=double(subs(fexacta,t,ti));
for i=1:n
    k1=h*(subs(f,[t,y],[ti(i),wi(i)]));
    k2=h*(subs(f,[t,y],[ti(i)+h/2,wi(i)+1/2*k1]));
    k3=h*(subs(f,[t,y],[ti(i)+h/2,wi(i)+1/2*k2]));
    k4=h*(subs(f,[t,y],[ti(i+1),wi(i)+k3]));
    wi(i+1)=wi(i)+1/6*(k1+2*k2+2*k3+k4);
end
M=[ti' wi' exacta'];