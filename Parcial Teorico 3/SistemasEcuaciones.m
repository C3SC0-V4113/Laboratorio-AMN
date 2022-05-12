clear variables
clc
disp('Método de Runge-Kutta orden cuatro para sistema de ecuciones diferenciales ordinarias')
m=2;
syms x y z t
fi=cell(1,m);
for i=1:m
    fprintf('Ingrese f%d´: ',i); 
    %(34*x-110*exp(-t)+152*exp(-2*t)-34*sin(t)+21*cos(t))/21
    %(34*y+165*exp(-t)-152*exp(-2*t))/21
    fi{i}=input('');
end
%fprintf('\n');
wi0=zeros(1,m);
for i=1:m
    fprintf('Ingrese w%d0: ',i); % 2
    wi0(i)=input('');
    %Primero x, después y
end
%fprintf('\n');
a = input('Ingrese el valor de a: ');
b = input('Ingrese el valor de b: ');
h = input('Ingrese el valor de h: ');

ts = a:h:b;
n=length(ts);

k1i=zeros(1,m);
k2i=zeros(1,m);
k3i=zeros(1,m);
k4i=zeros(1,m);
wij=zeros(n);
fprintf('\n');
for j=1:n-1
    fprintf('\nj = %d\nt%d = %d\n\n',j-1,j-1, ts(j+1));
  
    for i=1:m
        if j==1
            k1i(i)=h*subs(fi{i},{t,x,y},{ts(j),wi0(1),wi0(2)});
        else
            k1i(i)=h*subs(fi{i},{t,x,y},{ts(j),wij(1,j-1),wij(2,j-1)});
        end
        
        fprintf('k1%d = h*f%d(t%d',i,i,j-1);
        for cont=1:m
            fprintf(',w%d%d',cont,j-1);
        end
        fprintf(') = %.15f\n',k1i(i));
       
    end
    for i=1:m
        if j==1
            k2i(i)=h*subs(fi{i},{t,x,y},{ts(j)+h/2,wi0(1)+1/2*k1i(1),wi0(2)+1/2*k1i(2)});
        else
            k2i(i)=h*subs(fi{i},{t,x,y},{ts(j)+h/2,wij(1,j-1)+1/2*k1i(1),wij(2,j-1)+1/2*k1i(2)});
        end
        %fprintf('K2%d = h*f(t%d+h/2,w%d+1/2*k1)',i,j,j); %rk4 normalito
        fprintf('k2%d = h*f%d(t%d+h/2',i,i,j-1);
        for cont=1:m
            fprintf(',w%d%d+(1/2)*k1%d',cont,j-1,cont);
        end
        fprintf(') = %.15f\n',k2i(i));
        
    end
    for i=1:m
        if j==1
            k3i(i)=h*subs(fi{i},{t,x,y},{ts(j)+h/2,wi0(1)+1/2*k2i(1),wi0(2)+1/2*k2i(2)});
        else
            k3i(i)=h*subs(fi{i},{t,x,y},{ts(j)+h/2,wij(1,j-1)+1/2*k2i(1),wij(2,j-1)+1/2*k2i(2)});
        end
       
        fprintf('k3%d = h*f%d(t%d+h/2',i,i,j-1);
        for cont=1:m
            fprintf(',w%d%d+(1/2)*k2%d',cont,j-1,cont);
        end
        fprintf(') = %.15f\n',k3i(i));
        
    end
    for i=1:m
        if j==1
            k4i(i)=h*subs(fi{i},{t,x,y},{ts(j)+h,wi0(1)+k3i(1),wi0(2)+k3i(2)});
        else
            k4i(i)=h*subs(fi{i},{t,x,y},{ts(j)+h,wij(1,j-1)+k3i(1),wij(2,j-1)+k3i(2)});
        end
        
        fprintf('k4%d = h*f%d(t%d+h',i,i,j-1);
        for cont=1:m
            fprintf(',w%d%d+k3%d',cont,j-1,cont);
        end
        fprintf(') = %.15f\n',k4i(i));
       
    end
    for i=1:m
        if j==1
            wij(i,j)=wi0(i)+1/6*(k1i(i)+2*k2i(i)+2*k3i(i)+k4i(i));
        else
            wij(i,j)=wij(i,j-1)+1/6*(k1i(i)+2*k2i(i)+2*k3i(i)+k4i(i));
        end
        fprintf('w%d%d = w%d%d+(k1%d+2*k2%d+2*k3%d+k4%d)/6 = %.15f\n',i,j,i,j-1, i,i,i,i, wij(i,j));
        
    end
    fprintf('\n');   
end
    fprintf('\t\t\t ti \t\t\t X  \t\t\t Y \n')
    fprintf('%9.15f \t %9.15f \t %9.15f \n',double(ts(1)),double(wi0(1)),double(wi0(2)));
    for i=1:j
    fprintf('%9.15f \t %9.15f \t %9.15f \n',double(ts(i+1)),double(wij(1,i)),double(wij(2,i)));
    end