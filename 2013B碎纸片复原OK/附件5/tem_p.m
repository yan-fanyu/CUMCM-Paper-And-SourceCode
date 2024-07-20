k=1;
for i=1:22
    for j=1:19
        temp_(k)=plotgehang(i,j);
        k=k+1;
    end
end
temp_=sort(temp_);
juj=[1:418];
for k=1:418

for i=1:418
        if juj(k)==temp_(i);
            juj(k)=0;
            break;
        end
end
end
iui=juj(find(juj));
nun=biaozhun(iui);
iuiui=[iui;nun'];