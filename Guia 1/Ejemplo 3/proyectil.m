%Este script ,gráfica el movimiento de un proyectil con una velocidad
%inicial Vo y un ángulo inicial 0o.
%Además,calcula la altura máxima y el alcance máximo del proyectil

clc
vo=input('Introduzca la velocidad inicial en mts/seg v0 = ');
theta=input('Introduzca el ángulo inicial en grados, theta0 = ');
theta0=theta*pi/180; %Convierte de grados a radianes
tf=2*vo*sin(theta0)/9.81; %Tiempo final
t=0:tf/1000:tf; %Vector de datos desde cero hasta tiempo final en secciones de 1000
x=vo*cos(theta0)*t; %Formula de alcance
y=vo*sin(theta0)*t-0.5*9.81*t.^2; %Formula de tiro vertical
hmax=max(y);
rmax=max(x);
fprintf('\n');
fprintf('Altura máxima= %6.2f \n',hmax);
fprintf('Alcance máxima= %6.2f \n',rmax);
plot(x,y,'r:');
axis([0 rmax+1 0 hmax+1]);
xlabel('Posición en x del proyectil');
ylabel('Posición en y del proyectil');
title('Movimiento del proyectil');
text(0.5*rmax-1,hmax+0.2,'hmax');
text(rmax+.2,0,'rmax');
grid on