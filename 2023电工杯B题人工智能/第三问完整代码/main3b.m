%% 导入数据
%导入spss计算出的得分数据
try
Data_ori1 = readtable('评价得分数据.xlsx','VariableNamingRule','preserve');
Data_ori2 = readtable('综合得分表.csv','VariableNamingRule','preserve');
catch
Data_ori1 = readtable('评价得分数据.xlsx');
Data_ori2 = readtable('综合得分表.csv');
end
Data_int1 = table2array(Data_ori1);
Data_int2 = table2array(Data_ori2);
[m,n] = size(Data_int1);

%% 计算各个权重并分类
ResultData5 = zeros(m,n+3);
ResultData5(:,1:n) = Data_int1;
ResultData5(:,n+1) = Data_int2(:,1);

weight = [0.04762,0.04762,0.04762,0.42857,0.21426,0.21426]';

ResultData5(:,n+2) = Data_int1(:,6:11)*weight;
ResultData5(:,n+3) = (ResultData5(:,n+1) + ResultData5(:,n+2))./2;

ShowData = zeros(16,3);
for i = 1:m
   if ResultData5(i,2) == 1
       ShowData(1,1) = ShowData(1,1) + ResultData5(i,14);
       ShowData(1,2) = ShowData(1,2) + 1;
   else
       ShowData(2,1) = ShowData(2,1) + ResultData5(i,14);
       ShowData(2,2) = ShowData(2,2) + 1;
   end
   
   if ResultData5(i,3) == 1
       ShowData(3,1) = ShowData(3,1) + ResultData5(i,14);
       ShowData(3,2) = ShowData(3,2) + 1;
   elseif ResultData5(i,3) == 2
       ShowData(4,1) = ShowData(4,1) + ResultData5(i,14);
       ShowData(4,2) = ShowData(4,2) + 1;
   elseif ResultData5(i,3) == 3
       ShowData(5,1) = ShowData(5,1) + ResultData5(i,14);
       ShowData(5,2) = ShowData(5,2) + 1;
   else
       ShowData(6,1) = ShowData(6,1) + ResultData5(i,14);
       ShowData(6,2) = ShowData(6,2) + 1;
   end
   
   if ResultData5(i,4) == 1
       ShowData(7,1) = ShowData(7,1) + ResultData5(i,14);
       ShowData(7,2) = ShowData(7,2) + 1;
   elseif ResultData5(i,4) == 2
       ShowData(8,1) = ShowData(8,1) + ResultData5(i,14);
       ShowData(8,2) = ShowData(8,2) + 1;
   elseif ResultData5(i,4) == 3
       ShowData(9,1) = ShowData(9,1) + ResultData5(i,14);
       ShowData(9,2) = ShowData(9,2) + 1;
   else
       ShowData(10,1) = ShowData(10,1) + ResultData5(i,14);
       ShowData(10,2) = ShowData(10,2) + 1;
   end
    
   if ResultData5(i,5) == 1
       ShowData(11,1) = ShowData(11,1) + ResultData5(i,14);
       ShowData(11,2) = ShowData(11,2) + 1;
   elseif ResultData5(i,5) == 2
       ShowData(12,1) = ShowData(12,1) + ResultData5(i,14);
       ShowData(12,2) = ShowData(12,2) + 1;
   elseif ResultData5(i,5) == 3
       ShowData(13,1) = ShowData(13,1) + ResultData5(i,14);
       ShowData(13,2) = ShowData(13,2) + 1;
   elseif ResultData5(i,5) == 4
       ShowData(14,1) = ShowData(14,1) + ResultData5(i,14);
       ShowData(14,2) = ShowData(14,2) + 1;
   elseif ResultData5(i,5) == 5
       ShowData(15,1) = ShowData(15,1) + ResultData5(i,14);
       ShowData(15,2) = ShowData(15,2) + 1;
   else
       ShowData(16,1) = ShowData(16,1) + ResultData5(i,14);
       ShowData(16,2) = ShowData(16,2) + 1;
   end
    
end
ShowData(:,3) = ShowData(:,1)./ShowData(:,2);

%% 绘图展示结果

labs = {{'男','女'},...
{'文史类','理工类','管理类','艺术类'},...
{'大一','大二','大三','大四'},...
{'安静型','外向型','温顺型','坚定型','感性型','其他'},...
{'在寝室用笔记本上网','用手机上网','用平板电脑上网','在网吧上','其他'},...
{'7小时以下','7-14小时','14-20小时','20小时以上','不上网'},...
{'是','否'},...
{'平时有时间就使用','考试前使用','老师要求时才使用','说不清'},...
{'完全会','大多数时候会','有时会','很少会','不会'},...
{'是','否'},...
{'推荐过','没有'},...
{'是','否'},...
{'是','否','没考虑过'},...
{'是','否','没考虑过'},...
{'是','否','没考虑过'},...
{'信息杂乱','应用繁琐','资源收费','其他'},...
{'赞同','不赞同','说不清楚'},...
{'软件响应慢','所答问题不精炼','无效回答'},...
{'很高','一般','不相信'},...
{'全面提高自身的综合素质','仅帮助自己解决不会的题','应付考试','完成论文'},...
{'非常可能','有可能','不可能','不清楚'},...
{'积极利用新的学习方式和工具','被动接受新的学习模式','固定传统，不接受新的学习方式','完全依赖人工智能工具'}};


DrawPic5(1,1,ShowData(1:2,3),'不同性别获得的平均评分',labs);

DrawPic5(2,2,ShowData(3:6,3),'不同专业获得的平均评分',labs);

DrawPic5(3,3,ShowData(7:10,3),'不同年级获得的平均评分',labs);

DrawPic5(4,4,ShowData(11:16,3),'不同性格获得的平均评分',labs);

DrawPic6(5,2,1,'不同性别与专业获得的平均评分',labs,ResultData5);

DrawPic6(6,2,3,'不同专业与年级获得的平均评分',labs,ResultData5);

DrawPic6(7,4,1,'不同性格与性别获得的平均评分',labs,ResultData5);

%% 导出excel
ResultLabel = {'序号','性别','专业','年级','性格','对网络的熟悉程度','对学习软件的熟悉程度','对网络资料的熟悉程度',...
    '对人工智能学习工具的使用意愿','对人工智能学习工具的认可度','对人工智能学习工具与传统教学对比的认可',...
    '得分1','得分2','综合得分'};
%try
    ResultData6 = cell(m+1,14);
    ResultData6(1,:) = ResultLabel;
    ResultData6(2:end,:) = num2cell(ResultData5);
    xlswrite('完整得分数据.xlsx',ResultData6);%写进excel文件
    fprintf('数据已经保存在 完整得分数据.xlsx 文件中。\n');
% catch me
%     fprintf('导出数据失败！\n');
%     rethrow(me);
% end


%% 函数部分

function A = CalTotal6(tag1,tag2,labs,ResultData)
[m,n] = size(ResultData);
l1 = length(labs{tag1});
l2 = length(labs{tag2});
A = zeros(l1,l2);
B = zeros(l1,l2);
for i = 1:m
    val1 = ResultData(i,tag1 + 1);
    val2 = ResultData(i,tag2 + 1);
    A(val1,val2) = A(val1,val2) + ResultData(i,14);
    B(val1,val2) = B(val1,val2) + 1;
end
A = A./B;
end


function DrawPic5(idx,tag,Val,titleStr,labs)

figure(idx);
X = categorical(labs{tag});
X = reordercats(X,labs{tag});
Y = Val;
GO = bar(X,Y,'EdgeColor','k');
try
    xtip = GO.XEndPoints;
    ytip = GO.YEndPoints;
    labels = string(roundn(GO.YData,-3));
    text(xtip,ytip,labels,'HorizontalAlignment','center','VerticalAlignment','bottom');
catch
end
title(titleStr);
end

function DrawPic6(idx,tag1,tag2,titleStr,labs,ResultData)
figure(idx);
X = categorical(labs{tag1});
X = reordercats(X,labs{tag1});
Y = CalTotal6(tag1,tag2,labs,ResultData);
GO = bar(X,Y,'EdgeColor','k');
title(titleStr);
legend(labs{tag2});

end