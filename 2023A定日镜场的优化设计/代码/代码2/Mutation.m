function [ ret ] = Mutation( pmutation,lenchrom,chrom,sizepop,pop,bound,alps,gams)
%本函数完成变异操作
%pmutation      input:变异概率
%lenchrom       input:染色体长度
%chrom          input:染色体群/种群
%sizepop        input:种群规模
%pop            input:当前种群的进化代数和最大的进化代数信息
%ret           output:变异后的染色体
for n = 1:sizepop
    %随机选择一个染色体进行变异
    while 1
        pick = rand;
        if pick
            break
        end
    end
    index = ceil(pick*sizepop);
    %变异概率决定该循环是否进行变异
    pick = rand;
    if pick > pmutation
        continue;
    end
    while 1
        %变异位置
        while 1
            pick = rand;
            if pick
                break
            end
        end
        pos = ceil(pick*lenchrom);     %随机选择了变异的位置
        v = chrom(n,pos);
        v1 = v - bound(pos,1);
        v2 = bound(pos,2) - v;
        pick = rand;                        %变异开始
        if pick > 0.5
            delta = v2*( 1 - pick^( ( 1-pop(1)/pop(2) )^2 ) );
            chrom(index,pos) = v + delta;
        else
            delta = v1*( 1 - pick^( (1 - pop(1)/pop(2) )^2 ) );
            chrom(index,pos) = v - delta;
        end                                 %变异结束
        if Test(lenchrom,bound,chrom(n,:),alps,gams)
            break
        end
    end
end
ret = chrom;
end

