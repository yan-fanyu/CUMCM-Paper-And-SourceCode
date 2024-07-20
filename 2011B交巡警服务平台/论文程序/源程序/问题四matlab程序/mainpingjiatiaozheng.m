%%%mainpingjiatiaozhengi.m源程序代码：给出调整后各分区包括全市的评价
for N1=1:7
    %给定评价方式：pjfs=1为路程评价、pjfs=0为满意度评价。
    pjfs=1;
    save N1 N1 pjfs;
    pingjia2;
    load jieg;
    jieg(N1,:)=jgg(N1,:);
    save jieg jieg;
end
jieg
    
    