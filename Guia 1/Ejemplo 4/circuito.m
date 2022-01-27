%Aplicación en circuitos eléctricos
%Este guión o programa lee valores de resistencia y voltaje
%y calcula las corrientes de malla correspondiente para
%un circuito eléctrico específico
clc
R=input('Introduzca los valores de resistencia en ohms, [R1...R5]= ');
V=input('Introduzca los valores de volatje en volts, [V1...V2]= ');
fprintf('\n');
%Inicializador matriz A y vector B
A=[
    R(1)+R(2),-R(2),0;
    -R(2),R(2)+R(3)+R(4),-R(4);
    0,-R(4),R(4)+R(5)
    ];
B=[
    V(1);0;-V(2)
    ];
if rank(A)==3
    fprintf('Corriente de malla \n');
    i=A\B
else
    fprintf('No existe una solución única');
end