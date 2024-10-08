clc,clear
%第二问分月份的主函数
%本程序运行时间半小时以上
X=xlsread('weather.xls','B1:D8760');
Y=xlsread('weather.xls','I1:J8760');
ts=Y(:,1)+1;
n=ceil((Y(:,2)+1)/24);
level_radio=X(:,1);
scattering_radio=X(:,2);
vertical_radio=X(:,3);
[m,o]=size(X);
max1=0;max2=0;max3=0;max4=0;max5=0;max6=0;max7=0;max8=0;max9=0;max10=0;max11=0;max12=0;
a(m)=0;A(m)=0;c(m)=0;C(m)=0;cant_radio(m)=0;
broad(24)=0;
area=[1.58*0.808 1.966*0.991 1.58*0.808 1.651*0.991 1.65*0.991 1.956*0.991 1.65*0.991 1.956*0.991 1.482*0.992 1.64*0.992 1.956*0.992 1.956*992 1.668*1 1.3*1.1 1.321*0.711 1.414*1.114 1.4*1.1 1.4*1.1 0.310*0.355 0.615*0.180 0.615*0.355 0.92*0.355 0.818*0.355 1.645*0.712];
broad(3)=42;
for i=1:m
    if vertical_radio(i)>0
       u=ts(i);
       v=n(i);
       [j,k]=sun_azimuth(u,v);
       a(i)=j;A(i)=k;
    end
end
%一月份
for cita=0.01:0.1:1.57 
    for i=1:744
        %c为直线与法向量的余弦值，即直线与平面的正弦值
        c(i)=(1+tan(cita)*tan(a(i))*sqrt(1+tan(A(i))^2))/sqrt(1+tan(cita)^2)/sqrt(1+tan(A(i))^2+tan(a(i))^2*(1+tan(A(i))^2));
        cant_direct(i)=abs(c(i))*vertical_radio(i);
        cant_radio(i)=cant_direct(i)+scattering_radio(i);
    end
   [COST1,VALUE1]=cost_value(broad,cant_radio(1:744)');
    if max1<VALUE1;
        max1=VALUE1;
        CI1=cita;
    end
end
%二月份
for cita=0.01:0.1:1.57 
    for i=745:1416
        %c为直线与法向量的余弦值，即直线与平面的正弦值
        c(i)=(1+tan(cita)*tan(a(i))*sqrt(1+tan(A(i))^2))/sqrt(1+tan(cita)^2)/sqrt(1+tan(A(i))^2+tan(a(i))^2*(1+tan(A(i))^2));
        cant_direct(i)=abs(c(i))*vertical_radio(i);
        cant_radio(i)=cant_direct(i)+scattering_radio(i);
    end
    [COST2,VALUE2]=cost_value(broad,cant_radio(745:1416)');
    if max2<VALUE2;
        max2=VALUE2;
        CI2=cita;
    end
end
%三月份
for cita=0.01:0.1:1.57 
    for i=1417:2160
        %c为直线与法向量的余弦值，即直线与平面的正弦值
        c(i)=(1+tan(cita)*tan(a(i))*sqrt(1+tan(A(i))^2))/sqrt(1+tan(cita)^2)/sqrt(1+tan(A(i))^2+tan(a(i))^2*(1+tan(A(i))^2));
        cant_direct(i)=abs(c(i))*vertical_radio(i);
        cant_radio(i)=cant_direct(i)+scattering_radio(i);
    end
    [COST3,VALUE3]=cost_value(broad,cant_radio(1417:2160)');
    if max3<VALUE3;
        max3=VALUE3;
        CI3=cita;
    end
end
%四月份
for cita=0.01:0.1:1.57 
    for i=2161:2880
        %c为直线与法向量的余弦值，即直线与平面的正弦值
       c(i)=(1+tan(cita)*tan(a(i))*sqrt(1+tan(A(i))^2))/sqrt(1+tan(cita)^2)/sqrt(1+tan(A(i))^2+tan(a(i))^2*(1+tan(A(i))^2));
        cant_direct(i)=abs(c(i))*vertical_radio(i);
        cant_radio(i)=cant_direct(i)+scattering_radio(i);
    end
    [COST4,VALUE4]=cost_value(broad,cant_radio(2161:2880)');
    if max4<VALUE4;
        max4=VALUE4;
        CI4=cita;
    end
end
%五月份
for cita=0.01:0.1:1.57 
    for i=2881:3624
        %c为直线与法向量的余弦值，即直线与平面的正弦值
        c(i)=(1+tan(cita)*tan(a(i))*sqrt(1+tan(A(i))^2))/sqrt(1+tan(cita)^2)/sqrt(1+tan(A(i))^2+tan(a(i))^2*(1+tan(A(i))^2));
        cant_direct(i)=abs(c(i))*vertical_radio(i);
        cant_radio(i)=cant_direct(i)+scattering_radio(i);
    end
   [COST5,VALUE5]=cost_value(broad,cant_radio(2881:3624)');
    if max5<VALUE5;
        max5=VALUE5;
        CI5=cita;
    end
end
%六月份
for cita=0.01:0.1:1.57 
    for i=3625:4344
        %c为直线与法向量的余弦值，即直线与平面的正弦值
        c(i)=(1+tan(cita)*tan(a(i))*sqrt(1+tan(A(i))^2))/sqrt(1+tan(cita)^2)/sqrt(1+tan(A(i))^2+tan(a(i))^2*(1+tan(A(i))^2));
        cant_direct(i)=abs(c(i))*vertical_radio(i);
        cant_radio(i)=cant_direct(i)+scattering_radio(i);
    end
    [COST6,VALUE6]=cost_value(broad,cant_radio(3625:4344)');
    if max6<VALUE6;
        max6=VALUE6;
        CI6=cita;
    end
end
%七月份
for cita=0.01:0.1:1.57 
    for i=4345:5088
        %c为直线与法向量的余弦值，即直线与平面的正弦值
        c(i)=(1+tan(cita)*tan(a(i))*sqrt(1+tan(A(i))^2))/sqrt(1+tan(cita)^2)/sqrt(1+tan(A(i))^2+tan(a(i))^2*(1+tan(A(i))^2));
        cant_direct(i)=abs(c(i))*vertical_radio(i);
        cant_radio(i)=cant_direct(i)+scattering_radio(i);
    end
  [COST7,VALUE7]=cost_value(broad,cant_radio(4345:5088)');
    if max7<VALUE7;
        max7=VALUE7;
        CI7=cita;
    end
end
%八月份
for cita=0.01:0.1:1.57 
    for i=5089:5832
        %c为直线与法向量的余弦值，即直线与平面的正弦值
        c(i)=(1+tan(cita)*tan(a(i))*sqrt(1+tan(A(i))^2))/sqrt(1+tan(cita)^2)/sqrt(1+tan(A(i))^2+tan(a(i))^2*(1+tan(A(i))^2));
        cant_direct(i)=abs(c(i))*vertical_radio(i);
        cant_radio(i)=cant_direct(i)+scattering_radio(i);
    end
    [COST8,VALUE8]=cost_value(broad,cant_radio(5089:5832)');
    if max8<VALUE8;
        max8=VALUE8;
        CI8=cita;
    end
end
%九月份
for cita=0.01:0.1:1.57 
    for i=5833:6552
        %c为直线与法向量的余弦值，即直线与平面的正弦值
        c(i)=(1+tan(cita)*tan(a(i))*sqrt(1+tan(A(i))^2))/sqrt(1+tan(cita)^2)/sqrt(1+tan(A(i))^2+tan(a(i))^2*(1+tan(A(i))^2));
        cant_direct(i)=abs(c(i))*vertical_radio(i);
        cant_radio(i)=cant_direct(i)+scattering_radio(i);
    end
    [COST9,VALUE9]=cost_value(broad,cant_radio(5833:6552)');
    if max9<VALUE9;
        max9=VALUE9;
        CI9=cita;
    end
end
%十月份
for cita=0.01:0.1:1.57 
    for i=6553:7296
        %c为直线与法向量的余弦值，即直线与平面的正弦值
        c(i)=(1+tan(cita)*tan(a(i))*sqrt(1+tan(A(i))^2))/sqrt(1+tan(cita)^2)/sqrt(1+tan(A(i))^2+tan(a(i))^2*(1+tan(A(i))^2));
        cant_direct(i)=abs(c(i))*vertical_radio(i);
        cant_radio(i)=cant_direct(i)+scattering_radio(i);
    end
    [COST10,VALUE10]=cost_value(broad,cant_radio(6553:7296)');
    if max10<VALUE10;
        max10=VALUE10;
        CI10=cita;
    end
end
%十一月份
for cita=0.01:0.1:1.57 
    for i=7297:8016
        %c为直线与法向量的余弦值，即直线与平面的正弦值
        c(i)=(1+tan(cita)*tan(a(i))*sqrt(1+tan(A(i))^2))/sqrt(1+tan(cita)^2)/sqrt(1+tan(A(i))^2+tan(a(i))^2*(1+tan(A(i))^2));
        cant_direct(i)=abs(c(i))*vertical_radio(i);
        cant_radio(i)=cant_direct(i)+scattering_radio(i);
    end
    [COST11,VALUE11]=cost_value(broad,cant_radio(7297:8016)');
    if max11<VALUE11;
        max11=VALUE11;
        CI11=cita;
    end
end
%十二月份
for cita=0.01:0.1:1.57 
    for i=8017:8760
        %c为直线与法向量的余弦值，即直线与平面的正弦值
        c(i)=(1+tan(cita)*tan(a(i))*sqrt(1+tan(A(i))^2))/sqrt(1+tan(cita)^2)/sqrt(1+tan(A(i))^2+tan(a(i))^2*(1+tan(A(i))^2));
        cant_direct(i)=abs(c(i))*vertical_radio(i);
        cant_radio(i)=cant_direct(i)+scattering_radio(i);
    end
    [COST12,VALUE12]=cost_value(broad,cant_radio(8017:8760)');
    if max12<VALUE12;
        max12=VALUE12;
        CI12=cita;
    end
end
CI=[CI1 CI2 CI3 CI4 CI5 CI6 CI7 CI8 CI9 CI10 CI11 CI12]/pi*180 
VALUE=max1+max2+max3+max4+max5+max6+max7+max8+max9+max10+max11+max12