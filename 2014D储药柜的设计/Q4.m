load xinghao.txt
load data_CK%ÿ��ҩ�Ĵ�ҩ�ۿ� 12��
load data_CG%ÿ��ҩ�Ĵ�ҩ�۸� 13��

N=size(xinghao);
data=zeros(N(1),5);
C_number=zeros(N(1),1);
num_Yaogui=1;
% *******************************
for i=1:N(1)
   data(i,1)= xinghao(i,1);%��
   data(i,2)= xinghao(i,2);%��
   data(i,3)= xinghao(i,3);%��
   data(i,4)= ceil(sqrt(xinghao(i,2)^2+xinghao(i,3)^2));%�߿�Խ���
   data(i,5)= ceil(sqrt(xinghao(i,1)^2+xinghao(i,3)^2));%����Խ���
end

load liang.txt
for i=1:N(1)
   n=floor(1500/data(i,1));%��
   C_number(i)=ceil(liang(i)/n);%ÿ��ҩƷ��ҩ������
end

%���������ҩ���Ȱڷţ�ͬһ��ҩ��ҩ�۷���һ��ͬһ�����ڰڷţ���ͬ���ߵ�ҩ�۷���ͬһ��
sum_CK=zeros(N(1),1);
for i=1:N(1)
    sum_CK(i)=data_CK(i)*C_number(i);%���i��ҩ��ҩ���ܿ�
end
index_already=[];
i=1;
num_already=0;
CG_all=0;%����ҩ�۸߶��ۼ�
CG_sum=0;%��������ҩ���ۼƵ��ܸ߶�
while( num_already<N(1) )%����С��ŵ�ҩ��ʼ�����ԽС������Խ��
   index_sameline=[];   
   index_sameline=[index_sameline i];
   sum_long=0;
   num_line=1;
   if sum_CK(i)<2500%��ҩ����Ϊ2500mm
       sum_long=sum_CK(i);
       CG_temp=data_CG(i);
       data_CG(i)=0;
       for j=2:N(1)
           if CG_temp==data_CG(j);%Ѱ����ͬ�۸ߵ���С��ŵ�ҩ����С��ŵ�ҩ���������
              sum_long=sum_long+sum_CK(j);
              if sum_long<=2500%��ҩ����Ϊ2500mm
                  index_sameline=[index_sameline j];
                  num_line=num_line+1;%��һ������һ��ҩ
                  data_CG(j)=0;%���Ϊ0����������һ�ΰڷ�
              else
                  sum_long=sum_long-sum_CK(j);
              end
           end
       end    
   end
   index_sameline %���һ��ҩ�ı��
   CG_temp%���һ�еĸ߶�
   index_already=[index_already index_sameline];
   num_already=size(index_already);
   data_CG(i)=0;%���Ϊ0����������һ�ΰڷ�;
   k=1;
   while(k<num_already(2))
       for k=1:num_already(2)      
           if i==index_already(k)
               i=i+1;
               break;
           end
       end
   end
   
   CG_sum=CG_sum+CG_temp;
   CG_all=CG_all+CG_temp;
   if CG_all>1500%��ҩ����Ч�߶�Ϊ1500mm
       CG_all=CG_temp;
       num_Yaogui=num_Yaogui+1;
   end
   if CG_all==1500
       CG_all=0;
       num_Yaogui=num_Yaogui+1;
   end

end
CG_sum%���ҩ�۰ڷź���ܸ߶�
num_Yaogui%�����ҩ������


