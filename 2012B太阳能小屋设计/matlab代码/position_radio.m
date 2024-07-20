function Sradio=position_radio(broad,radiation,area,efficiency,W)
%���������ڼ���ĳ����һ����ܷ�����
%broad��ʾ��i�ְ������
%radiation����ÿƽ���׷�����
%area�����i�ְ�����
%efficiency�����i���ת��Ч��
%SradioAB����AB���ת���������
%SradioC����C���ת�������������λ��WH
%W�����i��Ĺ���
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