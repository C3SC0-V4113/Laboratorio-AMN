function [media,destip]=est(x)
%Este programa calcula la media aritmetica y
%la desviación típica de un conjunto de datos
n=length(x);
media=sum(x)/n;
destip=sqrt(sum((x-media).^2/n));
bar(x)