load xinghao.txt
load data_CK
N=size(xinghao);
data=zeros(N(1),5);
for i=1:N(1)
   data(i,1)= xinghao(i,1);
   data(i,2)= xinghao(i,2);
   data(i,3)= xinghao(i,3);
   data(i,4)= ceil(sqrt(xinghao(i,2)^2+xinghao(i,3)^2));%高宽对角线
   data(i,5)= ceil(sqrt(xinghao(i,1)^2+xinghao(i,2)^2));%长高对角线
end
Kg_min=min(xinghao(:,2));
Kg_max=max(xinghao(:,2));

sum_rongyu=0;
C_G=[53 72 104 129];

num_C=4;
j=1;
while( j<=num_C)
    if(j==1)
        Cg_min=Kg_min;
    else
        Cg_min=Cg_max+1;
    end
	Cg_max=C_G(j)-4;
    index=[];
    for i=1:N(1)
        if (data(i,2)<=Cg_max) &&  (data(i,2)>=Cg_min) 
            index=[index i];
        end
    end
%     index%输出药槽宽度对应的药盒编号
    num=size(index) %输出药槽宽度对应药盒的数量
    C_G(j) %输出药槽高度
    %计算平面冗余
    rongyu=0;
    for k=1:num(2)
        if ( (C_G(j)-data(index(k),2))>4 ) && ( (data_CK(index(k),1)-data(index(k),3))>4 )
             rongyu=rongyu+(C_G(j)-data(index(k),2)-4)*(data_CK(index(k),1)-data(index(k),3)-4);
         end
    end
    rongyu
    

    %分裂为2，均分
    temp=floor((Cg_max-Cg_min)/2);
    Cg_min_1=Cg_min;
	Cg_max_1=Cg_min_1+temp;
    C_G_1=Cg_max_1+4;
    Cg_min_2=Cg_max_1+1;
	Cg_max_2=Cg_max;
    C_G_2=Cg_max_2+4;
    index_1=[];
    for i=1:N(1)
        if (data(i,2)<=Cg_max_1) &&  (data(i,2)>=Cg_min_1) 
            index_1=[index_1 i];
        end
    end
%     index_1%输出药槽宽度对应的药盒编号
    num=size(index_1) %输出药槽宽度对应药盒的数量
    C_G_1 %输出药槽宽度
    %计算平面冗余
    rongyu_1=0;
    for k=1:num(2)
        if ( (C_G_1-data(index_1(k),2))>4 ) && ( (data_CK(index_1(k),1)-data(index_1(k),3))>4 )
             rongyu_1=rongyu_1+(C_G_1-data(index_1(k),2)-4)*(data_CK(index_1(k),1)-data(index_1(k),3)-4);
         end
    end
    rongyu_1
    index_2=[];
    for i=1:N(1)
        if (data(i,2)<=Cg_max_2) &&  (data(i,2)>=Cg_min_2) 
            index_2=[index_2 i];
        end
    end
%     index_1%输出药槽宽度对应的药盒编号
    num=size(index_2) %输出药槽宽度对应药盒的数量
    C_G_2 %输出药槽高度
    %计算平面冗余
    rongyu_2=0;
    for k=1:num(2)
        if ( (C_G_2-data(index_2(k),2))>4 )&& ( (data_CK(index_2(k),1)-data(index_2(k),3))>4 )
             rongyu_2=rongyu_2+(C_G_2-data(index_2(k),2)-4)*(data_CK(index_2(k),1)-data(index_2(k),3)-4);
         end
    end
    rongyu_2
    
    %计算总冗余
    sum_rongyu=0;
    num_CC=size(C_G);
    for p=1:num_CC(2)
        if(p==1)
            Cg_min_S=Kg_min;
        else
            Cg_min_S=Cg_max_S+1;
        end
        Cg_max_S=C_G(p)-4;
        index=[];
        for i=1:N(1)
            if (data(i,2)<=Cg_max_S) &&  (data(i,2)>=Cg_min_S) 
                index=[index i];
            end
        end
    %     index%输出药槽宽度对应的药盒编号
        num=size(index) %输出药槽宽度对应药盒的数量
        C_G(p) %输出药槽宽度
        %计算平面冗余
        rongyu_t=0;
        for k=1:num(2)
            if ( (C_G(p)-data(index(k),2))>4 )&& ( (data_CK(index(k),1)-data(index(k),3))>4 )
                 rongyu_t=rongyu_t+(C_G(p)-data(index(k),2)-4)*(data_CK(index(k),1)-data(index(k),3)-4);
             end
        end
        sum_rongyu=sum_rongyu+rongyu_t;%总冗余
    end
    
    dec_rongyu=rongyu-(rongyu_1+rongyu_2);
    if (dec_rongyu/sum_rongyu)>0.04%冗余降低超过10%，保持分裂
        C_G=[C_G(1:j-1) C_G_1 C_G(j:num_C)]
        num_C=num_C+1;
        j=j-1;
        if(j>=1)
            Cg_max=C_G(j)-4;
        end
    end
    j=j+1;
end


%分裂完成，计算总冗余
sum_rongyu=0;
num_C=size(C_G);
for j=1:num_C(2)
    if(j==1)
        Cg_min=Kg_min;
    else
        Cg_min=Cg_max+1;
    end
	Cg_max=C_G(j)-4;
    index=[];
    for i=1:N(1)
        if (data(i,2)<=Cg_max) &&  (data(i,2)>=Cg_min) 
            index=[index i];
        end
    end
%     index%输出药槽宽度对应的药盒编号
    num=size(index) %输出药槽宽度对应药盒的数量
    C_G(j) %输出药槽宽度
    %计算宽度冗余
    rongyu=0;
    for k=1:num(2)
        if ( (C_G(j)-data(index(k),2))>4 )&& ( (data_CK(index(k),1)-data(index(k),3))>4 )
             rongyu=rongyu+(C_G(j)-data(index(k),2)-4)*(data_CK(index(k),1)-data(index(k),3)-4);
         end
    end
    rongyu
    sum_rongyu=sum_rongyu+rongyu;
    %保存每种药品的储药槽高
    for k=1:num(2)
        data_CG(index(k),1)=C_G(j);
        
    end
end
sum_rongyu
save data_CG;%保存每种药品的储药槽宽



