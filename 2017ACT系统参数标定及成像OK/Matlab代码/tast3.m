%% ��Ա�Ե�������Ķ��δ���ű�
BW0 = ~BW(:,:,4) ;
for m = 3:1:510
    for n = 3:1:178
        s = sum( BW0((m-2):1:(m+2),n) ) ;
        if (s==5)||(s==3)
            BW0((m-2):1:(m+2),n)=[0;0;1;0;0];
        end
        if (s==4)
            if BW0((m-2):1:(m+2),n)==[1 1 1 1 0]
                BW0((m-2):1:(m+2),n) = [0 1 1 0 0];
            else
                BW0((m-2):1:(m+2),n) = [0 0 1 1 0];
            end
        end
    end
end
clear m n s
imshow(~BW0)
%% ��������������ֹ�����������
% xlswrite('data.xls',uint8(BW0),6)
%% ���ֹ����������������
BW0=xlsread('data.xls',6);
imshow(~BW0)
%% �������ߵľ�ȷ��λѡ��
[ z(:,1),z(:,2) ] = find(BW0==1) ;
lines=zeros(5,180);
for m = 1:1:180
    [black1,n]=find(z(:,2)==m);
    p = z(n,1);
    lines(5,m)=m;
    q=size(n);
    %��1
end
