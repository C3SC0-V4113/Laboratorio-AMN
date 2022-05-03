function y=f2(x)
y=2*pi*(0.5*x.^2-0.25*log(x)).*sqrt(1+(x-1./(4*x)).^2);