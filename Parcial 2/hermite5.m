function [A] = hermite5(vx,vy,dvy,int,f)
syms x;
n=length(vx);
A=zeros(n,n);
A(:,1)=vy';
for j=2:n
    for i=j:n
        if (vx(i)-vx(i-j+1)~=0)
            A(i,j)=(A(i,j-1)-A(i-1,j-1))/(vx(i)-vx(i-j+1));
        else
            A(i,j)=dvy(i);
        end
    end
end
P=A(1,1);
for j=2:n
    factor=1;
    for i=1:j-1
        factor=factor*(x-vx(i));
    end
    P=P+A(j,j)*factor;
end
P
valorAproximado=double(subs(P,int))
valorExacto=double(subs(f,int))
error=abs(valorAproximado-valorExacto)