%Metodo de Broyden para ecua no lineales
%x^(k)=x^(k-1)-(J(x^(k-1))^(-1)*F(x^(k-1))


% Para este ejemplo se uso: 
% x1^3 + (x1^2)*x2 - x1*x3 = -6
% exp(x1) + exp(x2) = x3
% x2^2 - 2*x1*x3 = 4
% x^(0)= (-1.45,-1.66,0.42)^T


%                    ---------------------------------------------------
%                    MÉTODO DE BROYDEN PARA 3 ECUACIONEs NO LINEALES    
%                    ---------------------------------------------------
% 
% Introduzca la funcion fx(1)= x1^3 + (x1^2)*x2 - x1*x3 + 6
% Introduzca la funcion fx(2)= exp(x1) + exp(x2) - x3
% Introduzca la funcion fx(3)= x2^2 - 2*x1*x3 - 4
% Introduzca el valor de x1^(0)= -1.45
% Introduzca el valor de x2^(0)= -1.66
% Introduzca el valor de x3^(0)= 0.42
% Introduzca la precision= 1e-6

clear all
clc
format_dec=15; %Setea la cantidad de decimales a emplear en las respuestas
syms x1 x2 x3
A=0; F=0; x=0; Y=0; S=0; F1=0; xk=0;
fprintf('MÉTODO DE BROYDEN     \n')
fprintf('---------------------------------------------------\n')
f1=input('   Funcion fx(1)= ');
f2=input('   Funcion fx(2)= ');
f3=input('   Funcion fx(3)= ');
f1_text=char(f1);
f2_text=char(f2);
f3_text=char(f3);

%Primero se sacan las derivadas y asi se evaluan las constantes
f11=diff(f1,x1);
f11_text=char(f11);
f12=diff(f1,x2);
f12_text=char(f12);
f13=diff(f1,x3);
f13_text=char(f13);
f21=diff(f2,x1);
f21_text=char(f21);
f22=diff(f2,x2);
f22_text=char(f22);
f23=diff(f2,x3);
f23_text=char(f23);
f31=diff(f3,x1);
f31_text=char(f31);
f32=diff(f3,x2);
f32_text=char(f32);
f33=diff(f3,x3);
f33_text=char(f33);
x1=input('   Ingrese x1^(0)= ');
x2=input('   Ingrese x2^(0)= ');
x3=input('   Ingrese x3^(0)= ');
error=input('   Introduzca la precision: ');


A(1,1)=subs(f11,{'x1','x2','x3'},{x1,x2,x3});
A(1,2)=subs(f12,{'x1','x2','x3'},{x1,x2,x3});
A(1,3)=subs(f13,{'x1','x2','x3'},{x1,x2,x3});
A(2,1)=subs(f21,{'x1','x2','x3'},{x1,x2,x3});
A(2,2)=subs(f22,{'x1','x2','x3'},{x1,x2,x3});
A(2,3)=subs(f23,{'x1','x2','x3'},{x1,x2,x3});
A(3,1)=subs(f31,{'x1','x2','x3'},{x1,x2,x3});
A(3,2)=subs(f32,{'x1','x2','x3'},{x1,x2,x3});
A(3,3)=subs(f33,{'x1','x2','x3'},{x1,x2,x3});
F1(1,1)=subs(f1,{'x1','x2','x3'},{x1,x2,x3});
F1(2,1)=subs(f2,{'x1','x2','x3'},{x1,x2,x3});
F1(3,1)=subs(f3,{'x1','x2','x3'},{x1,x2,x3});
x=[x1 x2 x3]';

fprintf('\n\nF(x)= \n');
fprintf('\t %s\n',f1_text);
fprintf('\t %s\n',f2_text);
fprintf('\t %s\n',f3_text);

fprintf('\n\nJ(x)= \n');
fprintf('\t %s\t\t',f11_text);
fprintf('%s\t\t ',f12_text);
fprintf('%s\n ',f13_text);
fprintf('\t %s\t\t',f21_text);
fprintf('%s\t\t ',f22_text);
fprintf('%s\n ',f23_text);
fprintf('\t %s\t\t',f31_text);
fprintf('%s\t\t ',f32_text);
fprintf('%s\n ',f33_text);


k=1;

fprintf('\n\n----------\n');
fprintf('k=%d',k);

fprintf('\n\nF(x^0)=\n')
F1(1:3,1)  %#ok<NOPTS>
%for i=1:3
%    fprintf('     %3.*f\n',format_dec,F1(i,1))
%end
fprintf('\n')
fprintf('\nJ(x^0)=\n')
A(1:3,1:3) %#ok<NOPTS>
%for i=1:3
%    for j=1:3
%        fprintf('     %10.*f',format_dec,A(i,j))
%    end
%    fprintf('\n')
%end
A=inv(A);

fprintf('\nA^(-1)(x^0) = J^(-1)(x^0)=\n')
for i=1:3
    for j=1:3
        fprintf('  %10.*f',format_dec,A(i,j))
    end
    fprintf('\n')
end


fprintf('\n\nx^0=\n')
for i=1:3
    fprintf('     %10.*f\n',format_dec,x(i,1))
end


xk=x-A*F1;
fprintf('\nx^1=x^0 - A^(-1)(x^0)*F(x^0)\n')
for i=1:3
    fprintf('     %10.*f\n',format_dec,xk(i,1))
end
tol=norm(xk-x,inf);
fprintf('\n\nError=|x^1 - x^0|= %e\n',tol)



while tol>error
    k=k+1;
    x1=xk(1,1);
    x2=xk(2,1);
    x3=xk(3,1);
    F(1,1)=subs(f1,{'x1','x2','x3'},{x1,x2,x3});
    F(2,1)=subs(f2,{'x1','x2','x3'},{x1,x2,x3});
    F(3,1)=subs(f3,{'x1','x2','x3'},{x1,x2,x3});
    Y=F-F1;
    F1=F;
    S=xk-x;
    ST=S';
    A=A+((S-A*Y)*ST*A)/(ST*A*Y);
    x=[x1 x2 x3]';
    fprintf('\n\n----------\n');
    fprintf('k=%d',k)
    
    fprintf('\nF(x^%d)=\n',k-1)
    for i=1:3
       fprintf('     %10.*f\n',format_dec,F(i,1))
    end  
     
    
    fprintf('\nY%d=F(x^%d) - F(x^%d)=\n',k-1,k-1,k-2)
    for i=1:3
       fprintf('     %10.*f\n',format_dec,Y(i,1))
    end
    fprintf('\nS%d=x^%d - x^%d=\n',k-1,k-1,k-2)
    for i=1:3
       fprintf('     %10.*f\n',format_dec,S(i,1))
    end
    
    
    fprintf('\nA%d^(-1)= A%d^(-1) + ( ( S%d - A%d^(-1)*Y%d )*S%d^T*A%d^(-1) ) / ( | S%d^T*A%d^(-1)*Y%d | )\n',k-1,k-2,k-1,k-2,k-1,k-1,k-2,k-1,k-2,k-1)
    for i=1:3
      for j=1:3
          fprintf('     %10.*f',format_dec,A(i,j))
      end
      fprintf('\n')
    end
    
    fprintf('\n\nx^%d=\n',k-1)
    for i=1:3
       fprintf('     %10.*f\n',format_dec,x(i,1))
    end
    
    
    xk=x-A*F;
    fprintf('\nx^%d=x^%d - A^(-1)(x^%d)*F(x^%d)\n',k,k-1,k-1,k-1)
    for i=1:3
       fprintf('     %10.*f\n',format_dec,xk(i,1))
    end
    tol=norm(xk-x,inf);
    fprintf('\n\nError=|x^%d - x^%d|= %e\n',k,k-1,tol)
end

fprintf('\n\n----------\n');
fprintf('\nx1= %10.*f',format_dec,xk(1,1))
fprintf('\nx2= %10.*f',format_dec,xk(2,1))
fprintf('\nx3= %10.*f',format_dec,xk(3,1))
fprintf('\n');