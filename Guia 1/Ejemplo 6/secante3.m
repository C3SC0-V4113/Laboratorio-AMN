function F=secante3(po,p1,r,Re,delta)
disp('M�todo de la secante')
syms f
g=input('Introduzca la funci�n g: ');
pk=p1-subs(g,p1)*(p1-po)/subs(g,p1)-subs(g,po);
cont=1;
tol=abs(pk-p1);
disp(' n    po    p1    f    error')
fprintf('%3.0f %9.9f   %9.9f  %9.9f  %e\n',double(cont),double(po),double(p1),double(pk),double(tol))
while tol>delta
    cont=cont+1;
    po=p1;
    p1=pk;
    pk=p1-subs(g,p1)*(p1-po)/(subs(g,p1)-subs(g,po));
    tol=abs(pk-p1);
    fprintf('%3.0f %9.9f   %9.9f  %9.9f  %e\n',double(cont),double(po),double(p1),double(pk),double(tol))
end
fprintf('Coeficiente de fricci�n en tuberias f=%9.9f\n',double(pk))