%%%fangz.mԴ������룺�ó��ﷸ�����ٶ�Ϊ60Km/hʱ��һ��ģ������Χ�·���
%%%�ı�m�ļ��е�V�����ɸı��ﷸ�������ٶȣ����õ���Ӧ��Χ�·���
%%����������
%function xunjing=fangz
%����������
clear;
%�����ﷸ�ٶ�
v=60;
%��������
N=1;
%������ִ���
N1=3;
%
load pingt;
pingt=pingt1;
save pingt pingt pingt1;
jd=kaist(32,v,3,1);
jd1=xuanz1(jd,N,[0,0,0]);
jj=0;
k1=1;
k2=1;
k=1;
xunjing.jdfrom(1,[1:30])=zeros(1,30);jdto(1,1:30)=zeros(1,30); 
while jj==0
    taofangform=jd1
    zuifrom(k1)=jd1;k1=k1+1;
    [jd2,t]=xuanz2(jd1,N,v,zuifrom);
    taofangto=jd2
    zuifto(k2)=jd2;k2=k2+1;
    if t==0
        break;jj=1;
    end
    [jj,nn,jg]=daoda(jd2,t,N1);
    aaa=size(jg,2);
    xunjing.jdfrom(k,1:aaa)=jg(1,:);
    jingchaform=jg(1,:)
    k=k+1; 
    jd3=xuanz3(jg(1,:),jd2,t);
    jingchato=jd3
    bbb=size(jd3,2);
    jdto(1,1:bbb)=jd3;    
    if jj==0
    chuchun;
    jd1=jd2;
    end
end
