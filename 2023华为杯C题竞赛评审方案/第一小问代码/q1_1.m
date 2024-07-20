%% 作图代码，用于画标准差，以及计算两个专家相同的文章

n_k=3000./[1:25]; %计算分成k组每组有多少文章
mN=120^2./n_k;    %期望 计算两个专家相同的文章
s2N=120^2*(n_k-120).^2./(n_k.^2.*(n_k-1));    %方差
sN=sqrt(s2N);   %标准差
scatter([1:25],sN)   %作图 以分组数为横坐标 
% scatter(n_k,sN) %作图 以作品数为横坐标 用的话去掉%，这是注释
%% 计算两篇文章的相同专家

m_k=ceil(125./[1:25]); %(向上取整)计算k组每组有多少专家
for i=1:25
    mk=m_k(i);
    p1=5*5*(mk-5)*(mk-6)*(mk-7)*(mk-8)/(mk)/(mk-1)/(mk-2)/(mk-3)/(mk-4);
    p2=(5*4)^2/2*(mk-5)*(mk-6)*(mk-7)/(mk)/(mk-1)/(mk-2)/(mk-3)/(mk-4);
    p3=(5*4*3)^2/6*(mk-5)*(mk-6)/(mk)/(mk-1)/(mk-2)/(mk-3)/(mk-4);
    p4=(5*4*3*2)^2/24*(mk-5)/(mk)/(mk-1)/(mk-2)/(mk-3)/(mk-4);
    p5=(5*4*3*2)/(mk)/(mk-1)/(mk-2)/(mk-3)/(mk-4);
    e(i)=p1+2*p2+3*p3+4*p4+5*p5;  %计算两篇文章的相同专家
end