%% 绘图显示
%不同年级人员上网时常分布堆叠条形图
%请先运行main1a.m
saveData = importdata('savedata1.mat');
labs = saveData.labs;
mutiStr = saveData.mutiStr;
Data_out = saveData.Data_out;

global idx
idx = 1;

%DrawPic(第一个维度序号,第二个维度序号,图的标题,是否归一化);
DrawPic(3,6,"不同年级人员上网时长分布条形图",0,labs,Data_out);

DrawPic(3,6,"不同年级人员上网时长分布条形图(归一化)",1,labs,Data_out);

DrawPic(2,6,"不同专业人员上网时长分布条形图",0,labs,Data_out);

DrawPic(2,6,"不同专业人员上网时长分布条形图(归一化)",1,labs,Data_out);

DrawPic(2,7,"不同专业人员是否使用学习软件条形图",1,labs,Data_out);

DrawPic(2,11,"不同专业老师是否推荐使用学习软件条形图",1,labs,Data_out);

DrawPic(4,12,"不同性格人员是否会使用AI工具学习条形图",1,labs,Data_out);

figure(idx)

DrawPic2(2,13,"不同专业人员是否会使用AI工具帮助完成作业条形图",0,3,3,1,labs,Data_out);
DrawPic2(3,13,"不同年级人员是否会使用AI工具帮助完成作业条形图",0,3,3,2,labs,Data_out);
DrawPic2(4,13,"不同性格人员是否会使用AI工具帮助完成作业条形图",0,3,3,3,labs,Data_out);

DrawPic2(2,14,"不同专业人员是否会使用AI工具帮助完成测验条形图",0,3,3,4,labs,Data_out);
DrawPic2(3,14,"不同年级人员是否会使用AI工具帮助完成测验条形图",0,3,3,5,labs,Data_out);
DrawPic2(4,14,"不同性格人员是否会使用AI工具帮助完成测验条形图",0,3,3,6,labs,Data_out);

DrawPic2(2,15,"不同专业人员是否会使用AI工具帮助完成论文条形图",0,3,3,7,labs,Data_out);
DrawPic2(3,15,"不同年级人员是否会使用AI工具帮助完成论文条形图",0,3,3,8,labs,Data_out);
DrawPic2(4,15,"不同性格人员是否会使用AI工具帮助完成论文条形图",0,3,3,9,labs,Data_out);
idx = idx + 1;

DrawPic3(23,"所有人员使用网络目的条形图",mutiStr,Data_out);
DrawPic3(24,"所有人员认为学习软件优势条形图",mutiStr,Data_out);
DrawPic3(25,"所有人员认为学习困扰的问题条形图",mutiStr,Data_out);
DrawPic3(26,"所有人员对学习软件关注点条形图",mutiStr,Data_out);
DrawPic3(27,"所有人员认为AI工具的安全性方面条形图",mutiStr,Data_out);
DrawPic3(28,"所有人员认为AI学习的重要点条形图",mutiStr,Data_out);
DrawPic3(29,"所有人员心目中AI工具的功能条形图",mutiStr,Data_out);
DrawPic3(30,"所有人员认为AI工具融合到不同学习环节条形图",mutiStr,Data_out);

DrawPic4(1,23,"不同性别人员使用网络目的条形图",labs,mutiStr,Data_out);

%% 函数部分
function A = CalTotal(tag1,tag2,flag,labs,Data_out)
[m,n] = size(Data_out);
l1 = length(labs{tag1});
l2 = length(labs{tag2});
A = zeros(l1,l2);
B = zeros(1,l1);
for i = 1:m
    val1 = Data_out(i,tag1 + 1);
    val2 = Data_out(i,tag2 + 1);
    A(val1,val2) = A(val1,val2) + 1;
    B(val1) = B(val1) + 1;
end
if(flag)
    for i = 1:l1
        A(i,:) = A(i,:)/B(i);
    end
end
end

function A = CalTotal2(tag1,Data_out,mutiStr)
[m,n] = size(Data_out);
l2 = length(mutiStr{tag1 - 22,1});
A = zeros(1,l2);

for i = 1:m
    val1 = Data_out(i,tag1 + 1);
    for j = 1:l2
        tempval = mod(val1,2^(l2-j+1));
        if tempval >= 2^(l2-j)
            flag = 1;
        else
            flag = 0;
        end
        A(1,j) = A(1,j) + flag;
        
    end
end
end


function A = CalTotal3(tag1,tag2,labs,Data_out,mutiStr)
[m,n] = size(Data_out);
l1 = length(labs{tag1});
l2 = length(mutiStr{tag2 - 22,1});
A = zeros(l1,l2);

for i = 1:m
    val1 = Data_out(i,tag1 + 1);
    val2 = Data_out(i,tag2 + 1);
    for j = 1:l2
        tempval = mod(val2,2^(l2-j+1));
        if tempval >= 2^(l2-j)
            flag = 1;
        else
            flag = 0;
        end
        A(val1,j) = A(val1,j) + flag;
        
    end
end
end

function DrawPic(tag1,tag2,titleStr,flag,labs,Data_out)
global idx
figure(idx);
X = categorical(labs{tag1});
X = reordercats(X,labs{tag1});
Y = CalTotal(tag1,tag2,flag,labs,Data_out);
if flag
    GO = bar(X,Y,'stacked','EdgeColor','k');
else
    GO = bar(X,Y,'EdgeColor','k');
end
title(titleStr);
legend(labs{tag2});
idx = idx + 1;

end

function DrawPic2(tag1,tag2,titleStr,flag,m,n,p,labs,Data_out)
subplot(m,n,p);
X = categorical(labs{tag1},labs{tag1});
% X = reordercats(X,);
Y = CalTotal(tag1,tag2,flag,labs,Data_out);
if flag
    GO = bar(X,Y,'stacked','EdgeColor','k');
else
    GO = bar(X,Y,'EdgeColor','k');
end
title(titleStr);
legend(labs{tag2});


end
function DrawPic3(tag1,titleStr,mutiStr,Data_out)
global idx
figure(idx);
X = categorical(mutiStr{tag1 - 22,1});
X = reordercats(X,mutiStr{tag1 - 22,1});
Y = CalTotal2(tag1,Data_out,mutiStr);
GO = bar(X,Y,'EdgeColor','k');
xtip = GO.XEndPoints;
ytip = GO.YEndPoints;
labels = string(roundn(GO.YData./46.05,-1));
for i = 1:length(labels)
    labels(i) = [labels{i}  '%'];
end
text(xtip,ytip,labels,'HorizontalAlignment','center','VerticalAlignment','bottom');
title(titleStr);
idx = idx + 1;

end


function DrawPic4(tag1,tag2,titleStr,labs,mutiStr,Data_out)
global idx
figure(idx);
X = categorical(labs{tag1});
X = reordercats(X,labs{tag1});
Y = CalTotal3(tag1,tag2,labs,Data_out,mutiStr);
GO = bar(X,Y,'EdgeColor','k');
title(titleStr);
legend(mutiStr{tag2 - 22,1});
idx = idx + 1;

end

