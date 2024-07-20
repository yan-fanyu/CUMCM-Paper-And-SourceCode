function [jieg]=luu(ju,luxian,pingtai)
%load ju;
%load luxian2;
[a,b]=size(luxian);
shuxing.lu=luxian;
for i=1:a
    shuxing.flage(i)=0;
    for j=1:20        
        if ju(j,luxian(i,1))<3000 &ju(j,luxian(i,2))<3000
            shuxing.flage(i)=2;shuxing.pingtai(i,:)=[j j];
        end
    end
    for j=1:20
        if ju(j,luxian(i,1))>3000 &ju(j,luxian(i,2))<3000&shuxing.flage(i)==0
            shuxing.flage(i)=1;shuxing.pingtai(i,:)=[luxian(i,2) j];            
        end
    end
    for j=1:20
        if ju(j,luxian(i,1))<3000 &ju(j,luxian(i,2))>3000&shuxing.flage(i)==0
            shuxing.flage(i)=1;shuxing.pingtai(i,:)=[luxian(i,1) j];break;
        end
    end 
end
jieg=[shuxing.lu shuxing.flage'];
%save jieg2 jieg2_1 jieg2_2 jieg2_0