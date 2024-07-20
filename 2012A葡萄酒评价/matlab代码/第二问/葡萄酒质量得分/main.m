%通过评酒员评酒时的分数对酒进行排名，并将每种酒依据排名高低给予质量得分
clear all
clc
load clhsjfile red2 white2

hjjz=sum(red2,2)';
bjjz=sum(white2,2)';
%对葡萄酒质量进行按照从小到大进行排序并给予分数
[hj,hjpm]=sort(hjjz);
[bj,bjpm]=sort(bjjz);
hjdf=linspace(0,1,27);
bjdf=linspace(0,1,28);

%对于红酒和白酒，按照样品升序排列给予分数
[hjsx,hji]=sort(hjpm);
[bjsx,bji]=sort(bjpm);
%以下对于红酒给予分数
for i=1:27
    hjzldf(i)=hjdf(hji(i));
end
%以下对于白酒给予分数
for i=1:28
    bjzldf(i)=bjdf(bji(i));
end
disp('以下为红葡萄酒按照质量得到的分数：')
hjzldf
disp('以下为白葡萄酒按照质量得到的分数：')
bjzldf
%绘出红酒按照样品对质量排名的走势图
plot(hjsx,hjzldf,'r*-')
title('红葡萄酒质量排名走势图')
xlabel('红葡萄酒样品代码')
ylabel('红葡萄酒按照质量排名得分')
%绘出白酒按照样品对质量排名的走势图
figure
plot(bjsx,bjzldf,'bo-')
title('白葡萄酒质量排名走势图')
xlabel('白葡萄酒样品代码')
ylabel('白葡萄酒按照质量排名得分')
%保存各葡萄酒的质量得分
save zldffile hjzldf bjzldf