function y=fun1(x)
load fanan;load fananlv;
for i=1:20    
      fanan(i)=fanan(i)+fananlv.*x((i-1)*140+1:140*i)';
end
y=max(fanan')-min(fanan');

