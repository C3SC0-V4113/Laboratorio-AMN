function P=Ejemplo5(t,w)
P=zeros(3,1);
P(1)=w(2);
P(2)=w(3);
P(3)=2*w(1)+w(2)-2*w(3)-exp(t);

%Solución aproximada
%[t yuv]=ode45(@Ejemplo5,t,[1;2;0])

%Solución exacta
%exacta_y=dsolve('D3y+2*D2y-Dy-2*y=exp(t)','y(0)=1','Dy(0)=2','D2y(0)=0')
%Y=double(subs(exacta_y,t))

%Error
%error_y=norm(Y-yuv(:,1),inf)