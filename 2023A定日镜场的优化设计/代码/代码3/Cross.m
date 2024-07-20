function [ ret ] = Cross( pcross,lenchrom,chrom,sizepop,bound,alps,gams)
%本函数完成交叉操作
%pcross     input:交叉概率
%lenchrom   input:染色体的长度
%chrom      inout:染色体群/种群
%sizepop    input:种群规模
%ret       output:交叉后的染色体
for n = 1:sizepop
    %随机选择两个染色体进行交叉
    while 1
        pick = rand(1,2);
        if prod(pick)
            break
        end
    end
    index = ceil(pick*sizepop);
    %交叉概率决定是否交叉
    while 1
        pick = rand;
        if pick
            break
        end
    end
    if pick > pcross
        continue;
    end
    while 1 %flag == 0
        %随机选择交叉位置
        while 1
            pick = rand;
            if pick
                break
            end
        end
        pos = ceil(pick*lenchrom);        %随机选择变量进行交叉
        pick = rand;                      %交叉开始
        v1 = chrom(index(1),pos);
        v2 = chrom(index(2),pos);
        chrom(index(1),pos) = pick*v2 + (1-pick)*v1;
        chrom(index(2),pos) = pick*v1 + (1-pick)*v2;    %交叉结束
        flag = [Test(lenchrom,bound,chrom(index(1),:),alps,gams) ...
        Test(lenchrom,bound,chrom(index(2),:),alps,gams)];
        if prod(flag)
            break
        end
    end
end
ret = chrom;
end

