function [ ret ] = Code( lenchrom, bound,alps,gams)
%�����������������Ⱦɫ�壬���������ʼ��һ����Ⱥ
%lenchrom   input:Ⱦɫ�峤��
%bound      input:������ȡֵ��Χ
%ret       output:Ⱦɫ��ı���ֵ

while 1
    pick = rand(1,lenchrom);
    ret = bound(:,1)' + (bound(:,2) - bound(:,1))'.*pick;   %���Բ�ֵ
    %����Ⱦɫ��Ŀ�����
    flag = Test(lenchrom, bound, ret,alps,gams);
    if flag                                      %��Ⱦɫ��ȫ�����У�����ѭ��
        break
    end
end
end

