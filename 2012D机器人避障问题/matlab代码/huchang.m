function z=huchang(A,B,C,r)
%CΪԲ������
%A,BΪԲ���˵�����,rΪ�뾶
D=dot(A-C,B-C)/(norm(A-C)*norm(B-C));%�����������
theta=acos(D);%���ȱ�ʾ
z=theta*r;
