function [ flag ] = Test( lenchrom, bound, ret ,alps,gams)
%lenchrom   input:Ⱦɫ�峤��
%bound      input:������ȡֵ��Χ
%code       input:Ⱦɫ��ı���ֵ
%flag      output:�����Ա�־����
%��ʼ����
flag = 0;
%1:����
%0:������
R = ret(:,1 : lenchrom / 4); %�������
L = ret(:,lenchrom / 4 + 1:lenchrom / 2); %����ڸ�
R = sort(R);
L = sort(L);
ret = [R,L,ret(lenchrom / 2 + 1:end)];
for n = 1:lenchrom
    if ret(n) > bound(n,1) && ret(n) < bound(n,2) && E_limit(lenchrom,bound,ret,alps,gams) && ret(:,1) * sin(pi/25) >= 5 && H_limit(ret,lenchrom)
        flag = 1;
        break
    end
end
end

