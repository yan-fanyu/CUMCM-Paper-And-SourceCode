%根据求出的各理化指标所占比重并将附件二中数据量化后的值得到各酿酒葡萄的理化指标得分
clear all
clc
%导入各理化指标所占的权重
load lhzbqzfile
%导入红白葡萄量化后的各理化指标的值
load hbptlhhsjfile
%首先求27种红葡萄的理化指标得分（分数越高越好）
for i=1:27
    hptlhdfys(i)=0;
    for j=1:30
        hptlhdfys(i)=hptlhdfys(i)+hlhqz(j)*lhhj(i,j);
    end
end
hptlhdfmax=max(hptlhdfys);
hptlhdf=hptlhdfys/hptlhdfmax;
disp('27种酿酒红葡萄的理化指标得分为：')
hptlhdf
plot(1:27,hptlhdf,'r*-')
title('27种酿酒红葡萄的理化指标得分走势图')
xlabel('27种酿酒红葡萄')
ylabel('各红葡萄的得分')

%首先求28种白葡萄的理化指标得分（分数越高越好）
for i=1:28
    bptlhdfys(i)=0;
    for j=1:30
        bptlhdfys(i)=bptlhdfys(i)+blhqz(j)*lhbj(i,j);
    end
end
bptlhdfmax=max(bptlhdfys);
bptlhdf=bptlhdfys/bptlhdfmax;
disp('28种酿酒白葡萄的理化指标得分为：')
bptlhdf
figure
plot(1:28,bptlhdf,'bo-')
title('28种酿酒白葡萄的理化指标得分走势图')
xlabel('28种酿酒白葡萄')
ylabel('各白葡萄的得分')
save lhzbdffile hptlhdf bptlhdf