function y=secc(x)
%Este programa se utiliza para graficar la siguiente función
%a trozos (o seccionada)
if x<1
    y=4-x^2;
elseif 1<=x && x<3
    y=3;
else
    y=2*x-3;
end