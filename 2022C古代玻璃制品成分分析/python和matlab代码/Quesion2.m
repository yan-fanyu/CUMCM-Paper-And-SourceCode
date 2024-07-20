%决策树
Total=xlsread('总表_编码.xlsx');
t=fitctree(Total(1:55,[5 7:20]),Total(1:55,3));
view(t,'Mode','graph')
t=fitctree(Total(1:55,[5 7:14 16:20]),Total(1:55,3));
view(t,'Mode','graph')
t=fitctree(Total(1:55,[5 7:14 17:20]),Total(1:55,3));
view(t,'Mode','graph')
t=fitctree(Total(1:55,[5 7:14 17 19 20]),Total(1:55,3));
view(t,'Mode','graph')
t=fitctree(Total(1:55,[5 7:8 10:14 17 19 20]),Total(1:55,3));
view(t,'Mode','graph')

%K均值聚类
NOT_FH_K=xlsread('高钾未风化.xlsx');
NOT_FH_K(isnan(NOT_FH_K))=0;
FH_K=xlsread('高钾风化.xlsx');
FH_K(isnan(FH_K))=0;
NOT_FH_Pb=xlsread('铅钡未风化.xlsx');
NOT_FH_Pb(isnan(NOT_FH_Pb))=0;
FH_Pb=xlsread('铅钡风化.xlsx');
FH_Pb(isnan(FH_Pb))=0;
NOT_FH_K(12,:)=[];NOT_FH_K(10,:)=[];
%一级亚类划分
K=[FH_K;NOT_FH_K];
Pb=[FH_Pb;NOT_FH_Pb];
C_Pb=Pb(:,[1 3 4 9 10 11 12]);
[IDX,C]=kmeans(C_Pb,2);
C_K=K(:,[1 3 4 9 10 11 12]);
[IDX,C]=kmeans(C_K,2);
%二级亚类划分
Classify_Pb=NOT_FH_Pb(:,[1 3 4 9 10 11 12]);
[IDX,C]=kmeans(Classify_Pb,2);
[IDX,C]=kmeans(Classify_Pb,3);
[IDX,C]=kmeans(Classify_Pb,4);
[IDX,C]=kmeans(Classify_Pb,5);

Classify_K=NOT_FH_K(:,[1 3 4 9 10 11 12]);
[IDX,C]=kmeans(Classify_K,2);
[IDX,C]=kmeans(Classify_K,3);
[IDX,C]=kmeans(Classify_K,4);
[IDX,C]=kmeans(Classify_K,5);
%敏感性
y=[92.85 92.85 100*ones(1,10)];
plot(1:12,y,'-o')
ylim([85 100])
xlim(1:12)
ax = gca;
ax.XTickLabel = {'','-30%','-25%','-20%','-15%','-10%','-5%','5%','10%','15%','20%','25%','30%'}
ylabel('准确看(%)')
title('二氧化硅最大值变化与准确率的关系')

y=[100*ones(1,10) 92.85 92.85];
bar(1:12,y)
ylim([85 100])
ax = gca;
ax.XTickLabel = {'-30%','-25%','-20%','-15%','-10%','-5%','5%','10%','15%','20%','25%','30%'}
ylabel('准确看(%)')
title('二氧化硅最小值变化与准确率的关系')

y=100*ones(1,12);
bar(1:12,y)
ylim([85 100])
ax = gca;
ax.XTickLabel = {'-30%','-25%','-20%','-15%','-10%','-5%','5%','10%','15%','20%','25%','30%'}
ylabel('准确看(%)')
title('氧化钾最小值变化与准确率的关系')