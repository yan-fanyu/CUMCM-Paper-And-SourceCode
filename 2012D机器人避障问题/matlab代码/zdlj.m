clear
clc
load D11
%*****************************�г����п��е�·������Ӧ�Ķ���******************
sykxlj=[yykxlj];
for i=1:size(dykxlj,1)
    sykxlj=[sykxlj dykxlj{i}];
end
ddzb=[yxzb [0;0;10] [300;300;10] [100;700;10] [700;640;10]];   %�������꺬O��A��B��C
sykxd0=[sykxlj([1:2 5],:) sykxlj([3:4 6],:)];
sykxd=unique(sykxd0','rows');sykxd=sykxd';
%*********************Folyd�㷨����OA��OB��OC�����·����·��******************
dis=ones(length(sykxd),length(sykxd))*inf;
for i=1:length(sykxlj)
    C=find((ismember(sykxd',(sykxlj([1:2 5],i))','rows'))');
    D=find((ismember(sykxd',(sykxlj([3:4 6],i))','rows'))');
    dis(C,D)=sqrt((sykxlj(1,i)-sykxlj(3,i))^2+(sykxlj(2,i)-sykxlj(4,i))^2);
    dis(D,C)=dis(C,D);
end
for i=1:length(sykxd)
    for j=i+1:length(sykxd)
        if sykxd(3,i)==sykxd(3,j)
            dis(i,j)=huchang(sykxd(1:2,i),sykxd(1:2,j),ddzb(1:2,sykxd(3,i)),ddzb(3,sykxd(3,i)));
        end
        dis(j,i)=dis(i,j);
    end
end
dis=real(dis);
[LOA,ROA]=FLOYD1(dis,1,107);
[LOB,ROB]=FLOYD1(dis,1,20);
[LOC,ROC]=FLOYD1(dis,1,198);
[LAB,RAB]=FLOYD1(dis,107,20);
[LBC,RBC]=FLOYD1(dis,20,198);
disp('O-->A�����·��Ϊ��')
xslj(yxzb,sykxd,ROA)
disp(['�ܳ���Ϊ��' num2str(LOA(end))])
disp('O-->B�����·��Ϊ��')
xslj(yxzb,sykxd,ROB)
disp(['�ܳ���Ϊ��' num2str(LOB(end))])
disp('O-->C�����·��Ϊ��')
xslj(yxzb,sykxd,ROC)
disp(['�ܳ���Ϊ��' num2str(LOC(end))])
disp('O-->A-->B-->C-->O�����·��Ϊ��')
xslj(yxzb,sykxd,[ROA(1:end-1) RAB(1:end-1) RBC(1:end-1) rot90(ROC,2)])
disp(['�ܳ���Ϊ��' num2str(LOA(end)+LAB(end)+LBC(end)+LOC(end))])
hold on
plot(sykxd(1,ROA),sykxd(2,ROA),'b-') ;
plot(sykxd(1,ROB),sykxd(2,ROB),'r-') ;
plot(sykxd(1,ROC),sykxd(2,ROC),'g-') ;
plot(sykxd(1,[ROA RAB RBC]),sykxd(2,[ROA RAB RBC]),'k-') ;hold off
