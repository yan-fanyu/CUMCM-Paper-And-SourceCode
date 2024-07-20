%һ����������ϵ���ģ���Ŵ��㷨������
N=400;
M=800; %��Ⱥ��С
%RGV_position=[1,randi(8,1,N-1)];
%RGV_position=random('poisson',4,1,N);
RGV_position = ones(M,N);
RGV_position_son=ones(M/2,N);
RGV_position_selected=ones(M/2,N);
RGV_position_next=ones(M,N);

break_happen_time=zeros(M,20);

v=[8 7 6 5 4 3 2 1];
f=perms(v);
L=length(f);
ran=floor(rand(1,M)*L);
rgv=1;
for j=1:M                    %ȷ����ʼ��Ⱥ
    for i = 1:(N/8)
    %rgv= [rgv, randperm(8,8)];
    rgv= [rgv, f(ran(j),:)];
    end
    RGV_position(j,:)=rgv(2:N+1);
    rgv=1;
end

fit_selected=zeros(1,M/2);
gen=50; %�Ŵ�����

for g=1:gen
    g
for j=1:M
    [fit(j),break_number(j),break_happen_time(j,:)]=fitness_breakdown(RGV_position,N,j);
end
[finished_sort, fit_index]=sort(fit,'descend');
for i=1:M/2
    RGV_position_selected(i,:)=RGV_position(fit_index(i),:);
    fit_selected(i)=fit(fit_index(i));
end
fit_sum=sum(fit_selected);
p=zeros(1,M/2);            %�������̶��б�ѡ��ĸ���
ppx=zeros(1,M/2);     
for i=1:M/2
    p(i)=fit_selected(i)/fit_sum;
    if(i==1)
        ppx(i)=p(i);
    else
        ppx(i)=ppx(i-1)+p(i);
    end
end

for ii=1:2:M/2
father=rand();
mother=rand();
    for i=1:M/2  %�������̶���ʣ�µ���Ⱥ��ȷ�����׺�ĸ��
        if father<=ppx(i)
            SelFather =RGV_position_selected(i,:);
            break
        end

    end
    for i=1:M/2
        if mother<=ppx(i)
           SelMother =RGV_position_selected(i,:);
           break
        end
    end
posCut=floor(rand()*N)+1;   %���ȷ�������
lenCut=floor(rand()*N)+1;   %���ȷ�����г���

if(posCut+lenCut>M/2)
    lenCut=N-posCut;
end
Cut1=SelFather(posCut:posCut+lenCut);
Cut2=SelMother(posCut:posCut+lenCut);

RGV_position_son(ii,:)=SelFather;
RGV_position_son(ii+1,:)=SelMother;

RGV_position_son(ii,posCut:posCut+lenCut)=Cut2;
RGV_position_son(ii+1,posCut:posCut+lenCut)=Cut1;
end
RGV_position=[RGV_position_selected;RGV_position_son];
end
[fit1,break_num,break_time,break_fix_time,break_CNC,break_product,load_time,unload_time]=fitness_breakdown(RGV_position,N,1);
% for j=1:M
%     fit2(j)=fitness(RGV_position_next,N,j,curent_time,CNC_finish_time,finished_num);
% end

