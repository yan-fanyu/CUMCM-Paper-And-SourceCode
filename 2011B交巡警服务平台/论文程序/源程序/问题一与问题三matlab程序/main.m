%%问题三、问题一模型 
%%若要解决问题三时给pingtai加一些相应的点 如 29 39 88.。。
clear;
%%建立所有可行的路线
sj2;load data;
[m,n]=size(link);
link1=sort(link,2);k=1;
for i=1:m
    if  (link1(i,2)<=92) 
        luxian(k,:)=link1(i,:);k=k+1;
    end
end
save luxian luxian;
%%% 解决问题三时给pingtai加一些相应的点 如 29 39 88.。。
pingtai=[1:20 29 39 88];num=size(pingtai,2);save pingtai pingtai;
%%初始运算
load fananlv2;
load ju;
%%找出路得属性并作图
jieg=luu(ju,luxian,pingtai);
load juli;load zuobiao;juli1=juli(1:92,1:92);
zuotu(juli1,x,y,jieg,pingtai);biaodian2
%%增添中点，给属性，作图，给出新路的犯案率
jieg1=zhongdian(jieg);
load juli2;load zuobiao2;load ju2;
jieg2=luu(ju2,jieg1(:,[1 2]),pingtai);
fananlv=fanan1(jieg2);
figure(2)
zuotu(juli2,x,y,jieg2,pingtai);biaodian;
%%0-1线性规划得到分配方案
jieg3=juliw(jieg2,ju2,pingtai);
%%给一些分配了路线的付初值
fanan=zeros(num,1);
[mm,nn]=size(jieg3);
for i=1:mm
   fanan(jieg3(i,1),1)=[fanan(jieg3(i,1),1)+fananlv(jieg3(i,4),4)];
end
save fanan fanan
%%退火算法第二次规划
[jieg4 fanan Sum]=tuih(jieg2,pingtai,1.5);
%%做出最终的结果图像
jieguo
figure(3)
zuitu(jieg4,jieg3,pingtai)
