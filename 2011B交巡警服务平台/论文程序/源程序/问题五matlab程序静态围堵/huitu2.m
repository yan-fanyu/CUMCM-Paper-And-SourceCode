%%%huitu2.mԴ������룬��70Km/h��100Km/h�ۺϵ�Χ�·���ʾ��ͼ
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
for p=3   
    a2(1,:)=data(2+4*(p-1),1:a(p));
    a2(2,:)=data(3+4*(p-1),1:a(p));
    fangan1(a2);    
    clear a2;
end
for p=7   
    a2(1,:)=data(2+4*(p-1),1:a(p));
    a2(2,:)=data(3+4*(p-1),1:a(p));
    fangan2(a2);    
    clear a2;
end

title(['�ﷸ�����ٶ�Ϊ' num2str(70) '~' num2str(100) 'Km/h']);