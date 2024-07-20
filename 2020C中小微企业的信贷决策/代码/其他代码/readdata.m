cb=xlsread('data','进项发票信息', 'A2:I210948'); 
sr=xlsread('data','销项发票信息', 'A2:I162485'); 


cb1 = zeros(123, 5);
sr1 = zeros(123, 5);

for i=1:1:length(cb(:, 1))
    if cb(i, 5) > 0 && cb(i, 8) > 0
        cb1(cb(i, 1), cb(i, 9)-2015) = cb1(cb(i, 1), cb(i, 9)-2015) +1;
    end
end

for i=1:1:length(sr(:, 1))
    if sr(i, 5) > 0 && sr(i, 8) > 0
        sr1(sr(i, 1), sr(i, 9)-2015) = sr1(sr(i, 1), sr(i, 9)-2015) +1;
    end
end
