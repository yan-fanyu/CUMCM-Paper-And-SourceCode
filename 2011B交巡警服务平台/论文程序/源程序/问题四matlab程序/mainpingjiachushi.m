%%%mainpingjiachushi.mԴ������룺����δ����ǰ�Ը���������ȫ�е�����
for N1=1:7
    %�������۷�ʽ��pjfs=1Ϊ·�����ۡ�pjfs=0Ϊ��������ۡ�
    pjfs=1;
    save N1 N1 pjfs;
    pingjia;
    load jieg1;
    jieg1(N1,:)=jgg(N1,:);
    save jieg1 jieg1;
end
jieg1