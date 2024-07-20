function [ ret, fitness ] = Select( individuals, fitness, sizepop )
%本函数对每一代种群中的染色体进行选择，以进行后面的交叉和变异
%individuals    input:种群信息
%fitness        input:适应度
%sizepop        input:种群规模
%ret           outout:经过选择后的种群

% 轮盘赌法

% fitness = 1./fitness;           %初始适应度与所需适应度成对比关系
sumfitness = sum(fitness);      %总体适应度
sumf = fitness./sumfitness;     %个体适应度与总体适应度之比
index = zeros(1,length(sizepop));
for n = 1:sizepop               %转sizepop次轮盘
    while 1
        pick = rand;
        if pick
            break
        end
    end
    for m = 1:sizepop
        pick = pick - sumf(m);
        %寻找适应度较大的个体
        if pick < 0
            index(n) = m;
            break;              %寻找到一个个体后，终止m循环
        end
    end
end
individuals = individuals(index,:);
fitness = fitness(index);
ret = individuals;
end

