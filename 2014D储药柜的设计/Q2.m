fid=fopen('F:\��ѧ��ģ\2014\D\index.txt','w');
fclose(fid);

load xinghao.txt
N=size(xinghao);
data=zeros(N(1),5);
data_CK=zeros(N(1),2);%����ÿ��ҩƷ�Ĵ�ҩ�ۿ�
for i=1:N(1)
   data(i,1)= xinghao(i,1);
   data(i,2)= xinghao(i,2);
   data(i,3)= xinghao(i,3);
   data(i,4)= ceil(sqrt(xinghao(i,2)^2+xinghao(i,3)^2));%�߿�Խ���
   data(i,5)= ceil(sqrt(xinghao(i,1)^2+xinghao(i,3)^2));%����Խ���
end
K_min=min(xinghao(:,3));
K_max=max(xinghao(:,3));

sum_rongyu=0;
C_K=[19 31 39 50 60]
% C_min=(C_K(1)+1)/2;
% C_max=C_K(1)-4;
% index=[];
% for i=1:N(1)
%     if (data(i,3)<=C_max) &&  (data(i,3)>=C_min) 
%         index=[index i];
%     end
% end
% % index%���ҩ�ۿ�ȶ�Ӧ��ҩ�б��
% num=size(index) %���ҩ�ۿ�ȶ�Ӧҩ�е�����
% C_K(1) %���ҩ�ۿ��
% %����������
% rongyu=0;
% for k=1:num(2)
%     if ( (C_K(1)-data(index(k),3))>4 )
%          rongyu=rongyu+(C_K(1)-data(index(k),3));
%      end
% end
% rongyu
% sum_rongyu=sum_rongyu+rongyu;  



num_C=5;
j=1;
while( j<=num_C)
    if(j==1)
        C_min=K_min;
    else
        C_min=C_max+1;
    end
	C_max=C_K(j)-4;
    index=[];
    for i=1:N(1)
        if (data(i,3)<=C_max) &&  (data(i,3)>=C_min) 
            index=[index i];
        end
    end
%     index%���ҩ�ۿ�ȶ�Ӧ��ҩ�б��
    num=size(index) %���ҩ�ۿ�ȶ�Ӧҩ�е�����
    C_K(j) %���ҩ�ۿ��
    %����������
    rongyu=0;
    for k=1:num(2)
        if ( (C_K(j)-data(index(k),3))>4 )
             rongyu=rongyu+(C_K(j)-data(index(k),3)-4);
         end
    end
    rongyu
    

    %����Ϊ2������
    temp=floor((C_max-C_min)/2);
    C_min_1=C_min;
	C_max_1=C_min_1+temp;
    C_K_1=C_max_1+4;
    C_min_2=C_max_1+1;
	C_max_2=C_max;
    C_K_2=C_max_2+4;
    index_1=[];
    for i=1:N(1)
        if (data(i,3)<=C_max_1) &&  (data(i,3)>=C_min_1) 
            index_1=[index_1 i];
        end
    end
%     index_1%���ҩ�ۿ�ȶ�Ӧ��ҩ�б��
    num=size(index_1) %���ҩ�ۿ�ȶ�Ӧҩ�е�����
    C_K_1 %���ҩ�ۿ��
    %����������
    rongyu_1=0;
    for k=1:num(2)
        if ( (C_K_1-data(index_1(k),3))>4 )
             rongyu_1=rongyu_1+(C_K_1-data(index_1(k),3)-4);
         end
    end
    rongyu_1
    index_2=[];
    for i=1:N(1)
        if (data(i,3)<=C_max_2) &&  (data(i,3)>=C_min_2) 
            index_2=[index_2 i];
        end
    end
%     index_1%���ҩ�ۿ�ȶ�Ӧ��ҩ�б��
    num=size(index_2) %���ҩ�ۿ�ȶ�Ӧҩ�е�����
    C_K_2 %���ҩ�ۿ��
    %����������
    rongyu_2=0;
    for k=1:num(2)
        if ( (C_K_2-data(index_2(k),3))>4 )
             rongyu_2=rongyu_2+(C_K_2-data(index_2(k),3)-4);
         end
    end
    rongyu_2
    
    %����������
    sum_rongyu=0;
    num_CC=size(C_K);
    for p=1:num_CC(2)
        if(p==1)
            C_min_S=K_min;
        else
            C_min_S=C_max_S+1;
        end
        C_max_S=C_K(p)-4;
        index=[];
        for i=1:N(1)
            if (data(i,3)<=C_max_S) &&  (data(i,3)>=C_min_S) 
                index=[index i];
            end
        end
    %     index%���ҩ�ۿ�ȶ�Ӧ��ҩ�б��
        num=size(index) %���ҩ�ۿ�ȶ�Ӧҩ�е�����
        C_K(p) %���ҩ�ۿ��
        %����������
        rongyu_t=0;
        for k=1:num(2)
            if ( (C_K(p)-data(index(k),3))>4 )
                 rongyu_t=rongyu_t+(C_K(p)-data(index(k),3)-4);
             end
        end
        sum_rongyu=sum_rongyu+rongyu_t;%������
    end
    
    dec_rongyu=rongyu-(rongyu_1+rongyu_2);
    if (dec_rongyu/sum_rongyu)>0.07%���ཱུ�ͳ���10%�����ַ���
        C_K=[C_K(1:j-1) C_K_1 C_K(j:num_C)]
        num_C=num_C+1;
        j=j-1;
        if(j>=1)
            C_max=C_K(j)-4;
        end
    end
    j=j+1;
end


%������ɣ�����������
sum_rongyu=0;
num_C=size(C_K);
for j=1:num_C(2)
    if(j==1)
        C_min=K_min;
    else
        C_min=C_max+1;
    end
	C_max=C_K(j)-4;
    index=[];
    for i=1:N(1)
        if (data(i,3)<=C_max) &&  (data(i,3)>=C_min) 
            index=[index i];
        end
    end
%     index%���ҩ�ۿ�ȶ�Ӧ��ҩ�б��
    num=size(index) %���ҩ�ۿ�ȶ�Ӧҩ�е�����
    C_K(j) %���ҩ�ۿ��
    fid=fopen('F:\��ѧ��ģ\2014\D\index.txt','a');
    fprintf(fid,'%d  ',index);
    fprintf(fid,'\n');
    fclose(fid);
    %����������
    rongyu=0;
    for k=1:num(2)
        if ( (C_K(j)-data(index(k),3))>4 )
             rongyu=rongyu+(C_K(j)-data(index(k),3)-4);
         end
    end
    rongyu
    sum_rongyu=sum_rongyu+rongyu;
    
    %����ÿ��ҩƷ�Ĵ�ҩ�ۿ�
    for k=1:num(2)
        data_CK(index(k),1)=C_K(j);
        
    end
    
end
sum_rongyu
save data_CK;%����ÿ��ҩƷ�Ĵ�ҩ�ۿ�


