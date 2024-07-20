function [y fanan]=manyi(x)
load fanan;load fananlv2;load pingtai
a=size(x,2);b=size(pingtai,2);
for i=1:b
    fanan(i,1)=x((i-1)*(a/b)+1:i*(a/b))*fananlv2+fanan(i);
end
y=var(fanan');