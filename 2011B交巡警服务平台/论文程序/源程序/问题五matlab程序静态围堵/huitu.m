%%%huitu.mԴ������룺�ò�ͬ�ٶ��µ�Χ�·���ʾ��ͼ
clear;load tt;clf;
data(:,34)=1000000;
k=1;
for i=2:4:42    
    j=1;    
    while data(i,j)<10000
        j=j+1;
    end    
    a(k)=j-1;k=k+1;
end
for p=1:k-1
    figure(p);
    a2(1,:)=data(2+4*(p-1),1:a(p));
    a2(2,:)=data(3+4*(p-1),1:a(p));
    fangan1(a2);
    title(['�ﷸ�����ٶ�Ϊ' num2str(data(1+4*(p-1),1)) 'Km/h']);
    clear a2;
end
    