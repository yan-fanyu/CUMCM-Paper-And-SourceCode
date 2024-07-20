Percent=xlsread('附件.xlsx','表单3');
[m,~]=size(Percent);
Predict_Q3=zeros(m,1);
for i=1:m
    Predict_Q3(i)=classify(Percent(i,:));
end
Percent_ep=[];
for i=1:9
    Percent_ep=Percent;
    for j=1:8
    Percent_ep(j,11)=Percent_ep(j,11)*(1+(i-5)*0.05);
    C(j,i)=classify(Percent_ep(j,:));
    end
end