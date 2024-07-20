function [zbest, y, E] = GA(alps,gams)
%%
%������ʼ��
popsize = 5;                             %��Ⱥ��ģ
lenchrom = 58;                               %������Ⱦɫ����������վ���ȷ���Ĳ�����
maxgen = 10;                              %��������

pc = 0.7;                                   %���ý�����ʣ���������Ϊ�仯��
pm = 0.5;                                   %���ñ�����ʣ�ͬ��Ҳ��������Ϊ�仯��
%%
%��Ⱥ
bound = repmat([100,350],55,1);
bound = [bound;2,8;2,8;2,6];
%������Χ
%%
%������ʼ���Ӻ���Ӧ��
GApop = zeros(popsize,lenchrom);
fitness = zeros(popsize,1);
for n = 1:popsize
    %�������һ����Ⱥ
    GApop(n,:) = Code(lenchrom,bound,alps,gams);      %�����������
    %������Ӧ��
    fitness(n) = Fun(GApop(n,:));
end
%����õ�Ⱦɫ��
[bestfitness, bestindex] = max(fitness);    %��󻯵�λ����ȹ���
zbest = GApop(bestindex,:);                 %ȫ�����
fitnesszbest = bestfitness;                 %ȫ�������Ӧ��ֵ
y = zeros(1,maxgen);
%%
%����Ѱ��
for n = 1:maxgen
    %��Ⱥ���� GAѡ�����
    GApop = Select(GApop, fitness, popsize);
    %�������
    GApop = Cross(pc,lenchrom,GApop,popsize,bound,alps,gams);
    %�������
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