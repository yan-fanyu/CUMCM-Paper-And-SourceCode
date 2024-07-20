%以下将两者葡萄的两个指标的得分花在一起进行对比
clc
clf
load lhzbdffile
load zldffile
plot(1:27,hjzldf,'r*-',1:27,hptlhdf,'bo-');
title('酿酒红葡萄的理化指标和酒质量的比较')
legend('酿酒红葡萄的理化指标得分','红葡萄酒的质量得分')
figure
plot(1:28,bjzldf,'r*-',1:28,bptlhdf,'bo-');
title('酿酒白葡萄的理化指标和酒质量的比较')
title('酿酒白葡萄的理化指标和酒质量的比较')
legend('酿酒白葡萄的理化指标得分','白葡萄酒的质量得分')