%一道工序调度模型遗传算法求解程序
N=400;%染色体长度
M=800; %初始种群大小
%RGV_position=[1,randi(8,1,N-1)];
%RGV_position=random('poisson',4,1,N);
RGV_position = ones(M,N);
RGV_position_son=ones(M/2,N);
RGV_position_selected=ones(M/2,N);
RGV_position_next=ones(M,N);
load_time=0;         %加工CNC上料时间
unload_time=0;       %加工CNC下料开始时间

v=[8 7 6 5 4 3 2 1];
f=perms(v);
L=length(f);
ran=floor(rand(1,M)*L);
rgv=1;
for j=1:M                    %确定初始种群
    for i = 1:(N/8)
    %rgv= [rgv, randperm(8,8)];
    rgv= [rgv, f(ran(j),:)];
    end
    RGV_position(j,:)=rgv(1:N);
    rgv=1;
end
fit=zeros(1,M);
fit_selected=zeros(1,M/2);
gen=100; %遗传代数

for g=1:gen
    M=size(RGV_position,1);
    m=floor(M/2);
for j=1:M
    fit(j)=fitness(RGV_position,N,j);
end
[finished_sort fit_index]=sort(fit,'descend');
for i=1:m                %淘汰适应度排在后半段的个体
    RGV_position_selected(i,:)=RGV_position(fit_index(i),:);
    fit_selected(i)=fit(fit_index(i));
end
fit_sum=sum(fit_selected);
p=zeros(1,m);            %计算轮盘赌中被选择的概率
ppx=zeros(1,m);     
for i=1:m
    p(i)=fit_selected(i)/fit_sum;
    if(i==1)
        ppx(i)=p(i);
    else
        ppx(i)=ppx(i-1)+p(i);
    end
end

for ii=1:2:m           %交叉产生M/2个个体
father=rand();
mother=rand();
    for i=1:m  %根据轮盘赌在剩下的种群中确定父亲和母亲
        if father<=ppx(i)
            SelFather =RGV_position_selected(i,:);
            break
        end

    end
    for i=1:m
        if mother<=ppx(i)
           SelMother =RGV_position_selected(i,:);
           break
        end
    end
posCut=floor(rand()*N)+1;   %随机确定交叉点
lenCut=floor(rand()*N)+1;   %随机确定剪切长度

if(posCut+lenCut>N)
    lenCut=N-posCut;
end
Cut1=SelFather(posCut:posCut+lenCut);  %交叉染色体
Cut2=SelMother(posCut:posCut+lenCut);

RGV_position_son(ii,:)=SelFather;
RGV_position_son(ii+1,:)=SelMother;

RGV_position_son(ii,posCut:posCut+lenCut)=Cut2;
RGV_position_son(ii+1,posCut:posCut+lenCut)=Cut1;

end
%产生变异
by=[];
while ~length(by)
    by=find(rand(1,M)<0.001);      %产生变异操作的染色体位置
end
B=RGV_position(by,:);            %产生变异操作的初始染色体
for i=1:length(by)
    bw=sort(floor(1+N*rand(1,3)));   %产生变异操作的3个地址
    B(i,:)=B(1,[1:bw(1)-1,bw(2)+1:bw(3),bw(1):bw(2),bw(3)+1:N]);  %交换位置
end

RGV_position=[RGV_position_selected;RGV_position_son;B];
end

[fit1,load_time,unload_time,m]=fitness(RGV_position,N,1)


