%%%fangan.m源程序代码：得出一种模拟方案下的追捕路线图。
%%%%%%%给出具体方案%%%%%%%
       %%条件%%%
%%逃跑路线：37→36→39；
%%警察的参与围堵的平台，有些是从其他地方转移过来的；
%%第一次： 2 8 9 16；
%%第二次：2 8 35 16；
%%第三次：40 4 36 38；
%三次后达到围堵的目的，
%%做出图像fangan.m%%
load data;
x=data(:,1)';
y=data(:,2)';
load juli;
juli2=juli;
%%做点图
m=92;
xx=x(1:m);yy=y(1:m);plot(x([21:m]),y([21:m]),'.');hold on;
plot(x([1:20]),y([1:20]),'ro'); hold on;
for i=[1:m]
    for j=[1:m]
        %%绘图
        if juli2(i,j)~=inf
            xl=[x(i) x(j)];yl=[y(i) y(j)];
            plot(xl,yl);
            hold on;
        end
        %%筛选
        %if ju(i,j)<=3000 & i~=j & i<=20
                %shuxing(k,:)=[i j ju(i,j)];
               % k=k+1;
         %end        
    end
end
biaodian2
aa=[37 36 39];
for i=1:2     
    h=arrow([x(aa(i)) y(aa(i))],[x(aa(i+1)) y(aa(i+1))],6,'BaseAngle',60); 
    h2=plot([x(aa(i)) x(aa(i+1))],[y(aa(i)) y(aa(i+1))],'r');
    set(h2,'LineWidth',1.5);
end
a2=[2 8 9 16;2 8 35 16; 40 4 36 38;];
    for i=1:3
        h1(i)=plot(x(a2(i,:)),y(a2(i,:)),'ro');hold on;
        set(h1(i),'linewidth',1.5);
    end
    for j=1:4
        for i=1:2
            if a2(i,j)~=a2(i+1,j)&(a2(i,j)>20||a2(i+1,j)>20)
                aa=[a2(i,j) a2(i+1,j)];      
                h=arrow([x(aa(1)) y(aa(1))],[x(aa(2)) y(aa(2))],6,'BaseAngle',60); 
                h2=plot([x(aa(1)) x(aa(2))],[y(aa(1)) y(aa(2))],'m');
                set(h2,'LineWidth',1.5);
            end
        end
    end
    
    
    
    
    
    
    
    
    
    
    
    
    