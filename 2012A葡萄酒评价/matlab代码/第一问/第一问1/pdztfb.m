%判断评价结果数据是否符合正态分布
clc
load clhsjfile
r1=sum(red1,2)';
r2=sum(red2,2)';
w1=sum(white1,2)';
w2=sum(white2,2)';
%通过normplot函数判断四个打分值是否符合正态分布
subplot(2,2,1)
normplot(r1)
title('第一组评酒员对红葡萄酒的打分')
subplot(2,2,2)
normplot(r2)
title('第二组评酒员对红葡萄酒的打分')
subplot(2,2,3)
normplot(w1)
title('第一组评酒员对白葡萄酒的打分')
subplot(2,2,4)
normplot(w2)
title('第二组评酒员对白葡萄酒的打分')