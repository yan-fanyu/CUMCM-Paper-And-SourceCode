load pingt;
pingt=pingt';
nt=size(jd3,2);
for i=1:nt
r=find(pingt==jg(1,i));
pingt(r)=jd3(i);
end
pingt=pingt';
save pingt pingt pingt1;

