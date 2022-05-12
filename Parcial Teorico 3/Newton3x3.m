%METODO DE NEWTON PARA SOLUCION DE SISTEMAS DE ECUACIONES NO LINEALES
clear all
syms x1 x2 x3
fprintf('\n- SOLUCION NUMERICA DE SISTEMAS NO LINEALES\n');
for i=1:3
   fprintf('- Introduzca la ecuacion G%0.0f : ',i);
   G(i)=input('');
end
xo = input('- Digite el vector de condiciones iniciales [xo1,xo2,xo3] :');
err = input('- Introduzca la precision : ');
pre=err+1;k=1;

while abs(pre)>err
for i=1:3
   Fxo(i)=subs(G(i),{x1,x2,x3},{xo(1),xo(2),xo(3)});
   Jx(i,1)=diff(G(i),x1);
   Jx(i,2)=diff(G(i),x2);
   Jx(i,3)=diff(G(i),x3);
   Jxo(i,1)=subs(Jx(i,1),{x1,x2,x3},{xo(1),xo(2),xo(3)});
   Jxo(i,2)=subs(Jx(i,2),{x1,x2,x3},{xo(1),xo(2),xo(3)});
   Jxo(i,3)=subs(Jx(i,3),{x1,x2,x3},{xo(1),xo(2),xo(3)});
end
fprintf('\n\n- Iteracion %0.0f----------------------------------------------------\n',k);
Fxi=double(Fxo')
Jx
Jxo=double(Jxo)
X=(double(xo'-inv(Jxo)*Fxo'))
aux=X';
k=1+k;
e1=abs(xo(1)-X(1,1));
e2=abs(xo(2)-X(2,1));
e3=abs(xo(3)-X(3,1));
pre=max([e1,e2,e3]);
xo=X';
fprintf('\n El error es %e\n',pre);
end