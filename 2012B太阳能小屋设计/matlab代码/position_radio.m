function Sradio=position_radio(broad,radiation,area,efficiency,W)
%本函数用于计算某个面一年的总辐射量
%broad表示第i种板的数量
%radiation代表每平方米辐射量
%area代表第i种板的面积
%efficiency代表第i板的转化效率
%SradioAB代表AB类板转化后的能量
%SradioC代表C类板转化后的能量，单位：WH
%W代表第i板的功率
[m,n]=size(broad);
[u,v]=size(radiation);
SradioAB(n)=0;SradioC(n)=0;
efficiency=xlsread('classical.xls','G3:G26');
W=xlsread('classical.xls','C3:C26');
for i=1:n
    if i<=6&broad(i)>0
        for j=1:u
            if radiation(j)>=80&radiation(j)<200
                SradioAB(i)=SradioAB(i)+radiation(j)*broad(i)*area(i)*efficiency(i)*0.05;
            elseif radiation(j)>=200&radiation(j)<=1000
                SradioAB(i)=SradioAB(i)+radiation(j)*broad(i)*area(i)*efficiency(i);
            elseif radiation(j)>1000
                SradioAB(i)=SradioAB(i)+W(i);
            end
        end
    elseif i>6&i<=13&broad(i)>0
        for j=1:u
            if radiation(j)>=80&radiation(j)<=1000
                SradioAB(i)=SradioAB(i)+radiation(j)*broad(i)*area(i)*efficiency(i);
            elseif radiation(j)>1000
                SradioAB(i)=SradioAB(i)+W(i);
            end
        end
    elseif i>13&broad(i)>0&i<=15
        for j=1:u
            if radiation(j)>=30&radiation(j)<=1000
                SradioC(i)=SradioC(i)+radiation(j)*broad(i)*area(i)*(efficiency(i)+0.01);
            elseif radiation(j)>1000
                SradioAB(i)=SradioAB(i)+W(i);
            end
        end
     elseif i>15&broad(i)>0
        for j=1:u
            if radiation(j)>=30&radiation(j)<=1000
                SradioC(i)=SradioC(i)+radiation(j)*broad(i)*area(i)*(efficiency(i));
            elseif radiation(j)>1000
                SradioAB(i)=SradioAB(i)+W(i);
            end
        end
    end
end
Sradio=sum(SradioAB)+sum(SradioC);