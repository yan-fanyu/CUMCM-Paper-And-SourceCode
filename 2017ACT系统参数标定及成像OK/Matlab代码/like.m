function [ retu ] = like( a,b )
% �����������ʼ��㺯��
% retu a b ����������
% �˴���ʾ��ϸ˵��
    in_type = 255 ;% ����ֵ��Χ
    long = size(a,1);
    if long ~= size(b,1) % �����������ĳ���Ӧ���ȳ�
        retu = 0;
        disp('Error:Fun like,different long size.')
    else
        retu = 1 - sum((a-b)+(b-a))/long/in_type ;
    end
end

