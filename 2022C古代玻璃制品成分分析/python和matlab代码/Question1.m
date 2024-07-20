NOT_FH_K=xlsread('高钾未风化.xlsx');
NOT_FH_K(isnan(NOT_FH_K))=0;
FH_K=xlsread('高钾风化.xlsx');
FH_K(isnan(FH_K))=0;
NOT_FH_Pb=xlsread('铅钡未风化.xlsx');
NOT_FH_Pb(isnan(NOT_FH_Pb))=0;
FH_Pb=xlsread('铅钡风化.xlsx');
FH_Pb(isnan(FH_Pb))=0;
NOT_FH_K(12,:)=[];NOT_FH_K(10,:)=[];

for j=1:14
    Percent_compare(1,j)=sum(NOT_FH_K(:,j))./12;
end
for j=1:14
    Percent_compare(2,j)=sum(FH_K(:,j))./6;
end
for j=1:14
    Percent_compare(3,j)=sum(NOT_FH_Pb(:,j))./23;
end
for j=1:14
    Percent_compare(4,j)=sum(FH_Pb(:,j))./26;
end

 Percent_K=zeros(1,14);
Percent_Pb=zeros(1,14);
for i=1:14
    Percent_K(i)=(Percent_compare(2,i)-Percent_compare(1,i))./Percent_compare(1,i);
    Percent_Pb(i)=(Percent_compare(4,i)-Percent_compare(3,i))./Percent_compare(3,i);
end       
feature_K=[1 3 4 6 8 11];
feature_Pb=[1 4 8 9 10 11];
Predict_K=[];Predict_Pb=[];
for i=1:6
    Predict_K=[Predict_K;Percent_compare(1,:)];
end
for i=1:26
    Predict_Pb=[Predict_Pb;Percent_compare(3,:)];
end
for i=1:6
    for j=1:6
        Predict_K(i,feature_K(j))=FH_K(i,feature_K(j))./(1+Percent_K(feature_K(j)));
    end
end
for i=1:26
    for j=1:6
        Predict_Pb(i,feature_Pb(j))=FH_Pb(i,feature_Pb(j))./(1+Percent_Pb(feature_Pb(j)));
    end
end

P1=corr([NOT_FH_K ones(12,1);FH_K 2.*ones(6,1)],'type','Spearman');
P2=corr([NOT_FH_Pb ones(23,1);FH_Pb 2.*ones(26,1)],'type','Spearman');
[~,id1]=sort(abs(P1(1:14,15)));
[~,id2]=sort(abs(P2(1:14,15)));


figure
title('高钾、铅钡风化前后各种化学成分含量的对比')
i=1;
subplot(4,7,i) 
 b=bar([Percent_compare(1,i) Percent_compare(2,i)]);
 b.FaceColor = 'flat';
 b.CData(1,:) = [1,0.38,0.27];
 b.CData(2,:) = [0,0.75,1];
    ylim([0 100])
    title(Name(i))
    ylabel('高钾')
 
for i=2:14
    subplot(4,7,i)
    b=bar([Percent_compare(1,i) Percent_compare(2,i)]);
    b.FaceColor = 'flat';
    b.CData(1,:) = [1,0.38,0.27];
    b.CData(2,:) = [0,0.75,1];
    ylim([0 2*max(Percent_compare(1,i),Percent_compare(2,i))])
    title(Name(i))
end
i=15;
subplot(4,7,i) 
 b=bar([Percent_compare(3,i-14) Percent_compare(4,i-14)]);
 b.FaceColor = 'flat';
 b.CData(1,:) = [1,0.38,0.27];
 b.CData(2,:) = [0,0.75,1];
    ylim([0 100])
    title(Name(i-14))
    ylabel('铅钡')
for i=16:28
    subplot(4,7,i)
    b=bar([Percent_compare(3,i-14) Percent_compare(4,i-14)]);
    b.FaceColor = 'flat';
    b.CData(1,:) = [1,0.38,0.27];
    b.CData(2,:) = [0,0.75,1];
    ylim([0 2*max(Percent_compare(3,i-14),Percent_compare(4,i-14))])
    title(Name(i-14))
end

