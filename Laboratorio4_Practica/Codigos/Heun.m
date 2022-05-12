function M=Heun(a,b,h,ci,f)
syms t y
n=int32((b-a)/(h));
ti=a:h:b;
wi(1)=ci;
for i=1:n
    wi(i+1)=wi(i)+h/4*(subs(f,[t,y],[ti(i),wi(i)]))+(3*h)/4*(subs(f,[t,y],[ti(i)+(2*h)/3,wi(i)+(2*h)/3*(subs(f,[t,y],[ti(i),wi(i)]))]));
end
fprintf('        ti                  wi            ');
fprintf('\n');
M=[ti' wi'];