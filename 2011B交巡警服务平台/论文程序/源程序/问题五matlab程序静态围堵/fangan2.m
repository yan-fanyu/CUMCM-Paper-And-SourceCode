function fangan2(a2)
load data;
x=data(:,1)';
y=data(:,2)';
load juli;
juli2=juli;
%%×öµãÍ¼
m=582;
xx=x(1:m);yy=y(1:m);plot(x([21:m]),y([21:m]),'.');hold on;
%plot(x([1:20 170:173]),y([1:20 170:173]),'ro'); hold on;
for i=[1:m]
    for j=[1:m]
        %%»æÍ¼
        if juli2(i,j)~=inf
            xl=[x(i) x(j)];yl=[y(i) y(j)];
            plot(xl,yl);%text((x(i)+x(j))/2,(y(i)+y(j))/2,num2str(floor(juli2(i,j)/100)));
            hold on;
        end
        %%É¸Ñ¡
        %if ju(i,j)<=3000 & i~=j & i<=20
                %shuxing(k,:)=[i j ju(i,j)];
               % k=k+1;
         %end        
    end
end
%aa=[37 36 39];
%for i=1:2     
    %h=arrow([x(aa(i)) y(aa(i))],[x(aa(i+1)) y(aa(i+1))],6,'BaseAngle',60); 
    %h2=plot([x(aa(i)) x(aa(i+1))],[y(aa(i)) y(aa(i+1))],'r');
    %set(h2,'LineWidth',1.5);%set(h1,'facecolor','r')
%end

    for i=1:2
        h1(i)=plot(x(a2(i,:)),y(a2(i,:)),'ro');hold on;
        set(h1(i),'linewidth',1.5);
    end
    an=size(a2,2);
    for j=1:an
        for i=1:1
            if a2(i,j)~=a2(i+1,j)%&(a2(i,j)>20||a2(i+1,j)>20)
                aa=[a2(i,j) a2(i+1,j)];    
                h=arrow([x(aa(1)) y(aa(1))],[x(aa(2)) y(aa(2))],6,'BaseAngle',60);
                h2=plot([x(aa(1)) x(aa(2))],[y(aa(1)) y(aa(2))],'r');
                set(h2,'LineWidth',1.5);%set(h1,'facecolor','m');
            end
        end
    end
  
    
    
    
    
    
    
    
    
    
    
    
    