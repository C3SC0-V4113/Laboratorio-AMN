%Ckto RL Ldi/dt+Ri=E(t)
%VL=Ldi/dt;   VR=Ri    Vc=q/c
%Taylor de Orden Superior
syms t y
disp('Taylor de Orden Superior (t,y)');
N=input('Ingrese el Orden: ');
d=input('Ingrese la ED (texto): ');
cond=input('Ingrese la condicion inicial (texto): ');
w0=input('Ingrese la Condicion Inicial: ');
a=input('Ingrese el valor de a: ');
b=input('Ingrese el valor de b: ');
h=input('Ingrese el valor de h: ');
disp('Desea Aproximar t, con Neville: ');
opc=input('1)Si  2)No   :');
if opc==1
 ti=input('Ingrese el Valor ti: '); 
end
for i=1:N
    fprintf('\nIngrese la Derivada Implicita %1.0f: ',i);
    f(i)=input('');
end
T=(a:h:b); n=fix((b-a)/h);

m=dsolve(d,cond,'t');
ye=subs(m,T);
w=zeros(n+1); w(1)=w0;
fprintf('i      t                  wi+1               y(t)\n');
fprintf('0  %9.15f   %9.15f   %9.15f\n',double(a),double(w0),double(ye(1)));
for i=1:length(T)-1
  w(i+1)=w(i);
  for j=1:N
     w(i+1)=w(i+1)+((h^j)/factorial(j))*subs(f(j),{t,y},{T(i),w(i)}); 
  end
  fprintf('%1.0f  %9.15f   %9.15f   %9.15f\n',double(i),double(T(i+1)),double(w(i+1)),double(ye(i+1)));
end
if opc==1
x=T;
n=length(T);
Q=zeros(n,n);
for i=1:n
    Q(i,1)=w(i);
end
fprintf('\n************PROCESANDO NEVILE*********\n');
%PROCESO PINCIPAL
for i=1:n
  fprintf('Q(%1.0f,0)=%9.15f\n',double(i-1),double(Q(i,1)));  
end
for j=2:n %j=Columnas
    for i=j:n %i=Filas
        Q(i,j)=((ti-x(i-j+1))*Q(i,j-1)-(ti-x(i))*Q(i-1,j-1))/(x(i)-x(i-j+1));
        fprintf('Q(%1.0f,%1.0f) = ((x-x%1.0f)*Q(%1.0f,%1.0f)-(x-x%1.0f)*Q(%1.0f,%1.0f))/(x%1.0f-x%1.0f) = %3.15f \n',double(i-1),double(j-1), double(i-j), double(i-1), double(j-2), double(i-1), double(i-2), double(j-2), double(i-1), double(i-j), double(Q(i,j)));
    end
end
yexa=subs(m,ti);
fprintf('\nLa respuesta es: %9.15f\n',double(Q(n,n)));
fprintf('El Valor exacto es: %9.15f\n',double(yexa));
fprintf('Error: %3.3e\n',double(abs(Q(n,n)-yexa)));
end