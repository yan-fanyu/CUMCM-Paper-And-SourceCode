%% 数据处理
clc
clear
try
Data_ori = readtable('调查数据转换.xlsx','VariableNamingRule','preserve');
catch
Data_ori = readtable('调查数据转换.xlsx');
end
Data_int = table2array(Data_ori);
[m,n] = size(Data_int);

ResultLabel = {'序号','对网络的熟悉程度','对学习软件的熟悉程度','对网络资料的熟悉程度',...
    '对人工智能学习工具的使用意愿','对人工智能学习工具的认可度','对人工智能学习工具与传统教学对比的认可'};
ResultData3 = zeros(m,7);
ResultData3(:,1) = Data_int(:,1);

for i = 1:m
    %计算对网络的熟悉程度
    ques6 = Data_int(i,7);
    if ques6 >=5
        val1 = 0;
    else 
        val1 = ques6;
    end
    ResultData3(i,2) = val1;
    
    %计算对学习软件的熟悉程度
    val2 = (2 - Data_int(i,8))*(4 - Data_int(i,9) + 2 - Data_int(i,12));
    ResultData3(i,3) = val2;
    
    %计算对网络资料的熟悉程度
    val3 = 0;
    if val1 > 0        
        val3 = val1 + (6 - Data_int(i,10)) + (2 - Data_int(i,11));
        ques23 = Data_int(i,24);
        for k = 1:8
            if mod(ques23,2^(8-k+1)) >= 2^(8-k)
                val3 = val3 + 1;
            end
        end
        
    end
    ResultData3(i,4) = val3;
    
    %计算对人工智能学习工具的使用意愿
    val4 = (2 - Data_int(i,13));
    if Data_int(i,14) == 1
        val4 = val4 + 1;
    end
    if Data_int(i,15) == 1
        val4 = val4 + 1;
    end
    if Data_int(i,16) == 1
        val4 = val4 + 1;
    end
    ResultData3(i,5) = val4;
    
    %计算对人工智能学习工具的认可度
    val5 = 0;
    if Data_int(i,18) == 1
        val5 = val5 + 2;
    elseif Data_int(i,18) == 3
        val5 = val5 + 1;
    end
    val5 = val5 + (4 - Data_int(i,20));
    ResultData3(i,6) = val5;
    
    %计算对人工智能学习工具与传统教学对比的认可
    if Data_int(i,22) == 1
        val6 = 3;
    elseif Data_int(i,22) == 2
        val6 = 2;
    elseif Data_int(i,22) == 3
        val6 = 0;
    else
        val6 = 1;
    end
    if Data_int(i,23) == 1
        val60 = 3;
    elseif Data_int(i,23) == 2
        val60 = 2;
    elseif Data_int(i,23) == 3
        val60 = 1;
    else
        val60 = 4;
    end
    ResultData3(i,7) = val6 * val60;
    
    
    
end
ResultData4 = cell(m+1,7);
ResultData4(1,:) = ResultLabel;
ResultData4(2:end,:) = num2cell(ResultData3); 
xlswrite('评价得分数据.xlsx',ResultData4);%写进excel文件
fprintf('数据已经保存在 评价得分数据.xlsx 文件中。\n');
