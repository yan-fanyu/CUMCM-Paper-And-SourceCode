load xinghao.txt
N=size(xinghao);
data=zeros(N(1),5);
for i=1:N(1)
   data(i,1)= xinghao(i,1);
   data(i,2)= xinghao(i,2);
   data(i,3)= xinghao(i,3);
   data(i,4)= ceil(sqrt(xinghao(i,2)^2+xinghao(i,3)^2));
   data(i,5)= ceil(sqrt(xinghao(i,1)^2+xinghao(i,3)^2));
end
K_min=min(xinghao(:,3));
K_max=max(xinghao(:,3));
C_min=K_min;
C_K=2*C_min-1;
C_max=C_K-4;

while(C_max<K_max)
    index=[];
    data_temp=[];
    for i=1:N(1)
       if (data(i,3)<=C_max) &&  (data(i,3)>=C_min) 
           index=[index i];
           data_temp=[data_temp;data(i,4:5)];
       end
    end
    DJ=min(min(data_temp()));
          
    if (C_K > DJ)
           C_K=DJ-1;
           C_max=C_K-4;
    else
        index%输出药槽宽度对应的药盒编号
        num=size(index) %输出药槽宽度对应药盒的数量
        C_K %输出药槽宽度
        %计算宽度冗余
        rongyu=0;
        for k=1:num(2)
            if ( (C_K-data(index(k),3))>4 )
                rongyu=rongyu+(C_K-data(index(k),3)-4);
            end
        end
        rongyu
        
        C_min=C_max+1;
        C_K=2*C_min-1;
        if(C_K>56+4)
            C_K=60;
            C_max=56;
            index=[];
            data_temp=[];
               for i=1:N(1)
                   if (data(i,3)<=C_max) &&  (data(i,3)>=C_min) 
                       index=[index i];
                       data_temp=[data_temp;data(i,4:5)];
                   end
               end
               DJ=min(min(data_temp()));
                if (C_K > DJ)
                       C_K=DJ-1;
                       C_max=C_K-4;
                else
                    index%输出药槽宽度对应的药盒编号
                    num=size(index) %输出药槽宽度对应药盒的数量
                    C_K %输出药槽宽度
                     %计算宽度冗余
                     rongyu=0;
                    for k=1:num(2)
                        if ( (C_K-data(index(k),3))>4 )
                            rongyu=rongyu+(C_K-data(index(k),3)-4);
                        end
                    end
                    rongyu
                end
        else
            C_max=C_K-4;
        end
        
    end
 
end

