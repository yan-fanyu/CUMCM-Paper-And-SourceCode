%�����������ģ���Ŵ��㷨������
N=800;
M=800; %��Ⱥ��С
%RGV_position=[1,randi(8,1,N-1)];
%RGV_position=random('poisson',4,1,N);

%��һ��
first_step=[7 6 5 2];        %��һ������Ļ������
second_step=[8 4 3 1];       %�ڶ�������Ļ������

%�ڶ���
% first_step=[7 5 1];        %��һ������Ļ������
% second_step=[8 6 4 3 2];       %�ڶ�������Ļ������

%������
% first_step=[5 3 2];        %��һ������Ļ������
% second_step=[8 7 6 4 1];       %�ڶ�������Ļ������


len_fir=length(first_step);  %��һ�������������
len_sec=length(second_step); %�ڶ�����������

RGV_position1 = ones(M,N/2);   %��һ������RGV����
RGV_position2 = ones(M,N/2);   %�ڶ�������RGV����
RGV_position_son1=ones(M/2,N/2);
RGV_position_son2=ones(M/2,N/2);
RGV_position_selected1=ones(M/2,N/2);
RGV_position_selected2=ones(M/2,N/2);
rgv1=[2];
rgv2=[1];

f1=perms(first_step);   %��һ��������ȫ����
f2=perms(second_step);  %�ڶ���������ȫ����
L1=length(f1);
L2=length(f2);
ran1=floor(rand(1,M)*L1+1);
ran2=floor(rand(1,M)*L2+1);

for j=1:M                    %ȷ����ʼ��Ⱥ
    while(length(rgv1)<N/2+1)
        rgv1= [rgv1, f1(ran1(j),:)];
    end
        RGV_position1(j,:)=rgv1(2:N/2+1);
        
    while(length(rgv2)<N/2+1)
        rgv2= [rgv2, f2(ran2(j),:)];
    end
        RGV_position2(j,:)=rgv2(2:N/2+1);
        
    rgv1=[2];
    rgv2=[1];
end

fit=zeros(1,M);               %��Ӧ�Ⱦ���
fit_selected=zeros(1,M/2);
gen=100; %�Ŵ�����

for g=1:gen
    M=size(RGV_position1,1);
    m=floor(M/2);
for j=1:M
    fit(j)=fitness_2steps(RGV_position1,RGV_position2,N,j);
end
[finished_sort fit_index]=sort(fit,'descend');
for i=1:m                %��̭��Ӧ�����ں��εĸ���
    RGV_position_selected1(i,:)=RGV_position1(fit_index(i),:);
    RGV_position_selected2(i,:)=RGV_position2(fit_index(i),:);
    fit_selected(i)=fit(fit_index(i));
end
fit_sum=sum(fit_selected);
p=zeros(1,m);            %�������̶��б�ѡ��ĸ���
ppx=zeros(1,m);     
for i=1:m
    p(i)=fit_selected(i)/fit_sum;
    if(i==1)
        ppx(i)=p(i);
    else
        ppx(i)=ppx(i-1)+p(i);
    end
end

for ii=1:2:m           %�������M/2������
father=rand();
mother=rand();
SelFather=zeros(2,N/2);
SelMother=zeros(2,N/2);
    for i=1:m  %�������̶���ʣ�µ���Ⱥ��ȷ�����׺�ĸ��
        if father<=ppx(i)
            SelFather(1,:) =RGV_position_selected1(i,:);
            SelFather(2,:) =RGV_position_selected2(i,:);
            break
        end
            
    end
    for i=1:m
        if mother<=ppx(i)
           SelMother(1,:) =RGV_position_selected1(i,:);
           SelMother(2,:) =RGV_position_selected2(i,:);
           break
        end
    end
posCut=floor(rand()*(N/2))+1;   %���ȷ�������
lenCut=floor(rand()*(N/2))+1;   %���ȷ�����г���

if(posCut+lenCut>N/2)
    lenCut=N/2-posCut;
end

CutF1=SelFather(1,posCut:posCut+lenCut);  %����Ⱦɫ��
CutF2=SelFather(2,posCut:posCut+lenCut); 
CutM1=SelMother(1,posCut:posCut+lenCut);
CutM2=SelMother(2,posCut:posCut+lenCut);

RGV_position_son1(ii,:)=SelFather(1,:);
RGV_position_son2(ii,:)=SelFather(2,:);

RGV_position_son1(ii+1,:)=SelMother(1,:);
RGV_position_son2(ii+1,:)=SelMother(2,:);

RGV_position_son1(ii,posCut:posCut+lenCut)=CutM1;
RGV_position_son2(ii,posCut:posCut+lenCut)=CutM2;
RGV_position_son1(ii+1,posCut:posCut+lenCut)=CutF1;
RGV_position_son2(ii+1,posCut:posCut+lenCut)=CutF2;

end

RGV_position1=[RGV_position_selected1;RGV_position_son1];
RGV_position2=[RGV_position_selected2;RGV_position_son2];
end
[fit1,load_time1,load_time2,unload_time1,unload_time2,m]=fitness_2steps(RGV_position1,RGV_position2,N,1);


