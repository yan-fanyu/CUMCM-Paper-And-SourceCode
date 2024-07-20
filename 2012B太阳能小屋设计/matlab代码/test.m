radio5=xlsread('weather.xls','H1:H8760');
broad5(24)=0;
broad5(14)=23;
[COST5,VALUE5]=cost_value(broad5,radio5)