load xinghao.txt
N=size(xinghao);
data=zeros(N(1),5);
for i=1:N(1)
   data(i,1)= xinghao(i,1);
   data(i,2)= xinghao(i,2);
   data(i,3)= xinghao(i,3);
   data(i,4)= ceil(sqrt(xinghao(i,2)^2+xinghao(i,3)^2));%�߿�Խ���
   data(i,5)= ceil(sqrt(xinghao(i,1)^2+xinghao(i,2)^2));%���߶Խ���
end
Kg_min=min(xinghao(:,2));
Kg_max=max(xinghao(:,2));
Cg_min=Kg_min;
C_G=2*Cg_min-1;
Cg_max=C_G-4;

while(Cg_max<Kg_max)
    index=[];
    data_temp=[];
    for i=1:N(1)
       if (data(i,2)<=Cg_max) &&  (data(i,2)>=Cg_min) 
           index=[index i];
           data_temp=[data_temp;data(i,5)];%ֻ���㳤�߶Խ���
       end
    end
    DJ=min(data_temp());
          
    if (C_G > DJ)
           C_G=DJ-1;
           Cg_max=C_G-4;
    else
        index%���ҩ�ۿ�ȶ�Ӧ��ҩ�б��
        num=size(index) %���ҩ�ۿ�ȶ�Ӧҩ�е�����
        C_G %���ҩ�ۿ��
        %����������
        rongyu=0;
        for k=1:num(2)
            if ( (C_G-data(index(k),2))>4 )
                rongyu=rongyu+(C_G-data(index(k),2)-4);
            end
        end
        rongyu
        
        Cg_min=Cg_max+1;
        C_G=2*Cg_min-1;
        if(C_G>Kg_max+4)
            C_G=Kg_max+4;
            Cg_max=Kg_max;
            index=[];
            data_temp=[];
               for i=1:N(1)
                   if (data(i,2)<=Cg_max) &&  (data(i,2)>=Cg_min) 
                       index=[index i];
                       data_temp=[data_temp;data(i,5)];
                   end
               end
               DJ=min(data_temp());
                if (C_G > DJ)
                       C_G=DJ-1;
                       Cg_max=C_G-4;
                else
                    index%���ҩ�ۿ�ȶ�Ӧ��ҩ�б��
                    num=size(index) %���ҩ�ۿ�ȶ�Ӧҩ�е�����
                    C_G %���ҩ�ۿ��
                     %����������
                     rongyu=0;
                    for k=1:num(2)
                        if ( (C_G-data(index(k),2))>4 )
                            rongyu=rongyu+(C_G-data(index(k),2)-4);
                        end
                    end
                    rongyu
                end
        else
            Cg_max=C_G-4;
        end
        
    end
 
end

