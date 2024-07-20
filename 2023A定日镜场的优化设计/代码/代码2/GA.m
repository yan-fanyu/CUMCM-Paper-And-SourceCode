function [zbest, y, E] = GA(alps,gams)
%%
%参数初始化
popsize = 5;                             %种群规模
lenchrom = 58;                               %基因中染色体个数（定日镜待确定的参数）
maxgen = 10;                              %进化次数

pc = 0.7;                                   %设置交叉概率，可以设置为变化的
pm = 0.5;                                   %设置变异概率，同理也可以设置为变化的
%%
%种群
bound = repmat([100,350],55,1);
bound = [bound;2,8;2,8;2,6];
%变量范围
%%
%产生初始粒子和适应度
GApop = zeros(popsize,lenchrom);
fitness = zeros(popsize,1);
for n = 1:popsize
    %随机产生一个种群
    GApop(n,:) = Code(lenchrom,bound,alps,gams);      %随机产生个体
    %计算适应度
    fitness(n) = Fun(GApop(n,:));
end
%找最好的染色体
[bestfitness, bestindex] = max(fitness);    %最大化单位面积热功率
zbest = GApop(bestindex,:);                 %全局最佳
fitnesszbest = bestfitness;                 %全局最佳适应度值
y = zeros(1,maxgen);
%%
%迭代寻优
for n = 1:maxgen
    %种群更新 GA选择更新
    GApop = Select(GApop, fitness, popsize);
    %交叉操作
    GApop = Cross(pc,lenchrom,GApop,popsize,bound,alps,gams);
    %变异操作
    GApop = Mutation(pm,lenchrom,GApop,popsize,[n,maxgen],bound,alps,gams);
    disp(n);
    for m = 1:popsize
        fitness(m) = Fun(GApop(m,:));
        if fitness(m) > fitnesszbest
            zbest = GApop(m,:);
            fitnesszbest = fitness(m);
        end
    end
    y(n) = fitnesszbest;
end
y = y(end);
E = E_show(lenchrom,bound,zbest,alps,gams);
result(zbest);
end