function flag = limit2(chrom)
%chrom      input:染色体群/种群
    if all(chrom(:,1:20) > 100) && all(chrom(:,1:20) < 350) && all(chrom(:,1:20) >= 5/(sin(2*pi/50)))
        flag = 1;
    else
        flag = 0;
    end
end

