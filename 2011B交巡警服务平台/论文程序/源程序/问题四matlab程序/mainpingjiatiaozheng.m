%%%mainpingjiatiaozhengi.mԴ������룺�������������������ȫ�е�����
for N1=1:7
    %�������۷�ʽ��pjfs=1Ϊ·�����ۡ�pjfs=0Ϊ��������ۡ�
    pjfs=1;
    save N1 N1 pjfs;
    pingjia2;
    load jieg;
    jieg(N1,:)=jgg(N1,:);
    save jieg jieg;
end
jieg
    
    