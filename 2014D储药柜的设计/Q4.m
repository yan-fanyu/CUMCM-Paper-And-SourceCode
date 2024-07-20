load xinghao.txt
load data_CK%每种药的储药槽宽 12类
load data_CG%每种药的储药槽高 13类

N=size(xinghao);
data=zeros(N(1),5);
C_number=zeros(N(1),1);
num_Yaogui=1;
% *******************************
for i=1:N(1)
   data(i,1)= xinghao(i,1);%长
   data(i,2)= xinghao(i,2);%高
   data(i,3)= xinghao(i,3);%宽
   data(i,4)= ceil(sqrt(xinghao(i,2)^2+xinghao(i,3)^2));%高宽对角线
   data(i,5)= ceil(sqrt(xinghao(i,1)^2+xinghao(i,3)^2));%长宽对角线
end

load liang.txt
for i=1:N(1)
   n=floor(1500/data(i,1));%长
   C_number(i)=ceil(liang(i)/n);%每种药品的药槽数量
end

%需求量大的药优先摆放，同一种药的药槽放在一起（同一行相邻摆放），同样高的药槽放在同一行
sum_CK=zeros(N(1),1);
for i=1:N(1)
    sum_CK(i)=data_CK(i)*C_number(i);%编号i的药的药槽总宽
end
index_already=[];
i=1;
num_already=0;
CG_all=0;%计算药槽高度累加
CG_sum=0;%计算所有药槽累计的总高度
while( num_already<N(1) )%从最小编号的药开始（编号越小需求量越大）
   index_sameline=[];   
   index_sameline=[index_sameline i];
   sum_long=0;
   num_line=1;
   if sum_CK(i)<2500%储药柜宽度为2500mm
       sum_long=sum_CK(i);
       CG_temp=data_CG(i);
       data_CG(i)=0;
       for j=2:N(1)
           if CG_temp==data_CG(j);%寻找相同槽高的最小编号的药（最小编号的药需求量最大）
              sum_long=sum_long+sum_CK(j);
              if sum_long<=2500%储药柜宽度为2500mm
                  index_sameline=[index_sameline j];
                  num_line=num_line+1;%这一行增加一种药
                  data_CG(j)=0;%清除为0，不参与下一次摆放
              else
                  sum_long=sum_long-sum_CK(j);
              end
           end
       end    
   end
   index_sameline %输出一行药的编号
   CG_temp%输出一行的高度
   index_already=[index_already index_sameline];
   num_already=size(index_already);
   data_CG(i)=0;%清除为0，不参与下一次摆放;
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
   if CG_all>1500%储药柜有效高度为1500mm
       CG_all=CG_temp;
       num_Yaogui=num_Yaogui+1;
   end
   if CG_all==1500
       CG_all=0;
       num_Yaogui=num_Yaogui+1;
   end

end
CG_sum%输出药槽摆放后的总高度
num_Yaogui%输出储药柜数量


