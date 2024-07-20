function [COST,value]=cost_value(broad,radio)
%本函数用于计算价值和成本
area=[1.58*0.808 1.966*0.991 1.58*0.808 1.651*0.991 1.65*0.991 1.956*0.991 1.65*0.991 1.956*0.991 1.482*0.992 1.64*0.992 1.956*0.992 1.956*992 1.668*1 1.3*1.1 1.321*0.711 1.414*1.114 1.4*1.1 1.4*1.1 0.310*0.355 0.615*0.180 0.615*0.355 0.92*0.355 0.818*0.355 1.645*0.712];
Sradio=position_radio(broad,radio,area);%调用辐射量函数
value=Sradio/1000*0.5;%计算出一年所发电的钱
W=xlsread('classical.xls','C3:C26');
%计算每块板的价格
for i=1:24
    if i<=6
        cost(i)=W(i)*14.9;
    elseif i>6&i<=13
        cost(i)=W(i)*12.5;
    else
        cost(i)=W(i)*4.8;
    end
end
COST=sum(cost.*broad);