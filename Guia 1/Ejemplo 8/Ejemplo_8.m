syms t
fplot('0.78-0.05*t*exp(-0.4*t)-0.23*exp(-0.4*t)-0.663',[2.8,3])
grid on

po=input('Introduzca el valor inicial p0: ');
c=input('Introduzca el valor del reactante C');
g=input('Introduzca la función g(x): ');
e=input('Introduzca el valor de la precisión: ');
cont=1;
p1=subs(g,po);
p2=subs(g,p1);
poo=po-((p1-po)^(2)/(p2-2*p1+po));
error=abs(poo-po);
disp('  n     po      p1         p2         poo        error')
fprintf('%3.0f %9.15f %9.15f %9.15f %9.15f %e\n',double(cont),double(po),double(p1),double(p2),double(poo),double(error))
while error > e
    cont=cont+1;
    po=poo;
    p1=subs(g,po);
    p2=subs(g,p1);
    poo=po-((p1-po)^(2)/(p2-2*p1+po));
    error=abs(poo-po);
    fprintf('%3.0f %9.15f %9.15f %9.15f %9.15f %e\n',double(cont),double(po),double(p1),double(p2),double(poo),double(error))
end
fprintf('El valor aproximado es: %9.15f\n',double(poo))