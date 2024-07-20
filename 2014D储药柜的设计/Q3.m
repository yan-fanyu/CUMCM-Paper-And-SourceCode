load xinghao.txt
load data_CK
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
%     index%���ҩ�ۿ�ȶ�Ӧ��ҩ�б��
    num=size(index) %���ҩ�ۿ�ȶ�Ӧҩ�е�����
    C_G(j) %���ҩ�۸߶�
    %����ƽ������
    rongyu=0;
    for k=1:num(2)
        if ( (C_G(j)-data(index(k),2))>4 ) && ( (data_CK(index(k),1)-data(index(k),3))>4 )
             rongyu=rongyu+(C_G(j)-data(index(k),2)-4)*(data_CK(index(k),1)-data(index(k),3)-4);
         end
    end
    rongyu
    

    %����Ϊ2������
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
%     index_1%���ҩ�ۿ�ȶ�Ӧ��ҩ�б��
    num=size(index_1) %���ҩ�ۿ�ȶ�Ӧҩ�е�����
    C_G_1 %���ҩ�ۿ��
    %����ƽ������
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
%     index_1%���ҩ�ۿ�ȶ�Ӧ��ҩ�б��
    num=size(index_2) %���ҩ�ۿ�ȶ�Ӧҩ�е�����
    C_G_2 %���ҩ�۸߶�
    %����ƽ������
    rongyu_2=0;
    for k=1:num(2)
        if ( (C_G_2-data(index_2(k),2))>4 )&& ( (data_CK(index_2(k),1)-data(index_2(k),3))>4 )
             rongyu_2=rongyu_2+(C_G_2-data(index_2(k),2)-4)*(data_CK(index_2(k),1)-data(index_2(k),3)-4);
         end
    end
    rongyu_2
    
    %����������
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
    %     index%���ҩ�ۿ�ȶ�Ӧ��ҩ�б��
        num=size(index) %���ҩ�ۿ�ȶ�Ӧҩ�е�����
        C_G(p) %���ҩ�ۿ��
        %����ƽ������
        rongyu_t=0;
        for k=1:num(2)
            if ( (C_G(p)-data(index(k),2))>4 )&& ( (data_CK(index(k),1)-data(index(k),3))>4 )
                 rongyu_t=rongyu_t+(C_G(p)-data(index(k),2)-4)*(data_CK(index(k),1)-data(index(k),3)-4);
             end
        end
        sum_rongyu=sum_rongyu+rongyu_t;%������
    end
    
    dec_rongyu=rongyu-(rongyu_1+rongyu_2);
    if (dec_rongyu/sum_rongyu)>0.04%���ཱུ�ͳ���10%�����ַ���
        C_G=[C_G(1:j-1) C_G_1 C_G(j:num_C)]
        num_C=num_C+1;
        j=j-1;
        if(j>=1)
            Cg_max=C_G(j)-4;
        end
    end
    j=j+1;
end


%������ɣ�����������
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
%     index%���ҩ�ۿ�ȶ�Ӧ��ҩ�б��
    num=size(index) %���ҩ�ۿ�ȶ�Ӧҩ�е�����
    C_G(j) %���ҩ�ۿ��
    %����������
    rongyu=0;
    for k=1:num(2)
        if ( (C_G(j)-data(index(k),2))>4 )&& ( (data_CK(index(k),1)-data(index(k),3))>4 )
             rongyu=rongyu+(C_G(j)-data(index(k),2)-4)*(data_CK(index(k),1)-data(index(k),3)-4);
         end
    end
    rongyu
    sum_rongyu=sum_rongyu+rongyu;
    %����ÿ��ҩƷ�Ĵ�ҩ�۸�
    for k=1:num(2)
        data_CG(index(k),1)=C_G(j);
        
    end
end
sum_rongyu
save data_CG;%����ÿ��ҩƷ�Ĵ�ҩ�ۿ�



