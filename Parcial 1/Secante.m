clc
clear all
syms x
%2 valores cualquier cerca de la ra�z(graficas secantes acordate)
disp('M�TODO DE LA SECANTE')
po = input('Introduzca el valor inicial (po): ');
p1= input('Introduzca el otro valor inicial (p1): ');
f= input('Introduzca la funci�n f: ');
hcon= input('Introduzca la funci�n hcon: ');
criterio = input('Introduzca el valor de presici�n: ');
cont=1;
P=p1-((subs(f,p1))*(p1-po))/((subs(f,p1))-(subs(f,po)));
error = abs(P-p1);
disp(' n          po                  p1              p2             error')
fprintf('%2.0f  %9.15f  %9.15f  %9.15f %2.2e\n',double(cont),double(po),double(p1),double(P),double(error));
while error>criterio
    cont=cont+1;
    po=double(p1);
    p1=double(P);
    P=p1-((subs(f,p1))*(p1-po))/((subs(f,p1))-(subs(f,po)));
    error = abs(P-p1);
    fprintf('%2.0f  %9.15f  %9.15f  %9.15f %2.2e\n',double(cont),double(po),double(p1),double(P),double(error))
end
fprintf('El valor aproximado de r es %9.15f mts \n',double(P))
x=P;
fprintf('El valor aproximado de Altura del Cono (hcon) es %9.15f mts\n',double(subs(hcon,x)))
    