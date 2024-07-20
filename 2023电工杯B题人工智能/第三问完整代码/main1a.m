%% 数据处理
clc
clear
Data_test = readtable('附件2：调查数据.xlsx');
Data_cell = table2cell(Data_test);
LabelStr = Data_test.Properties.VariableDescriptions;
[m , n] = size(Data_test);
Data_out = zeros(m,n);
Data_out(:,1) = 1:1:m;
%将字符串变量转化为分类变量
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
for i = 2:23
    DataLabel = Data_cell(:,i);
    DataLabel_cat = categorical(DataLabel);
    DataLabel_int = double(DataLabel_cat);
    DataLabel_idx = double(categorical(labs{i-1}));
    DataLabel_int2 = zeros(m,1);
    for j = 1:length(DataLabel_idx)
        for k = 1:m
           if  DataLabel_int(k) == DataLabel_idx(j)
               DataLabel_int2(k) = j;
           end
        end
    end
    Data_out(:,i) = DataLabel_int2;
end
mutiStr = {["学习、查资料","浏览新闻","收发邮件","娱乐游戏","聊天交友","资源下载","上网购物","其他"],
    ["真题全面","可以重复学习","资料全面"],
    ["学习的相关经验缺乏","专业疑难问题得不到解决","学习时间安排不充裕","不会正确的学习方法"],
    ["学习效果","学习资源","操作方便","学习费用"],
    ["软件安全级别","网络安全能力","个人信息安全","数据安全","运行安全","服务器安全"],
    ["知识来源的资格审核","知识库的更新频率","是否有定期的审核"],
    ["性能优越","知识面广","运行速度快","稳定","不收费"],
    ["教师传授","课后消化","评价反馈","其他"]};
Data_out2 = Data_out;
Data_muti = cell(m,length(mutiStr));
for i = 1:m
    for j = 1:length(mutiStr)
        strlist = mutiStr{j};
        tempVal = 0;
        tempVal2 = 0;
        tempVal3 = "";
        for k = 1:length(strlist)
            str1 = Data_cell{i,j+23};
            flag = contains(str1,strlist(k));
            if(flag)
                tempVal = tempVal + 2^(length(strlist) - k);
                tempVal2 = tempVal2 + 10^(length(strlist) - k);
            end
            tempVal3 = strcat(tempVal3 ,num2str(flag));
        end
        Data_out(i,j+23) = tempVal;
        Data_out2(i,j+23) = tempVal2;
        Data_muti{i,j} = tempVal3;
    end      
end

%% 导出excel
% OutPutTable = array2table(Data_out,'VariableNames',LabelStr);
% varTypes = {'double','double','double','double','double','double','double','double',...
%     'double','double','double','double','double','double','double','double',...
%     'double','double','double','double','double','double','double','string',...
%     'string','string','string','string','string','string','string'};
% OutPutTable2 = table('Size',[m,n],'VariableNames',LabelStr,'VariableTypes',varTypes);
% % OutPutTable2 = array2table(Data_out2,'VariableNames',LabelStr,'VariableTypes',varTypes);
% OutPutTable2(:,1:23) = array2table(Data_out(:,1:23));
% OutPutTable2(:,24:31) = Data_muti;
% writetable(OutPutTable,'调查数据转换.xlsx','Sheet',1,'WriteVariableNames',true);
% writetable(OutPutTable2,'调查数据转换.xlsx','Sheet',2,'WriteVariableNames',true);

if length(LabelStr) <= 0
   LabelStr = importdata('labsave.mat'); 
end

ResultData1 = cell(m+1,n);
ResultData1(1,:) = LabelStr;
ResultData1(2:end,:) = num2cell(Data_out);
ResultData2 = string(ResultData1);
ResultData2(2:end,24:31) = Data_muti;
xlswrite('调查数据转换.xlsx',ResultData1,1);%写进excel文件
xlswrite('调查数据转换.xlsx',ResultData2,2);
fprintf('数据已经保存在 调查数据转换.xlsx 文件中。\n');



