clc
clear all
training_sample=xlsread('E:\数学建模\建模论文\2017CUMCM\B\定价（原始）.xlsx',1,'B2:C536');
class=xlsread('E:\数学建模\建模论文\2017CUMCM\B\定价（原始）.xlsx',1,'D2:D536');
ObjBayes=NaiveBayes.fit(training_sample,class);
% test=xlsread('E:\数学建模\建模论文\2017CUMCM\B\最新定价.xlsx',1,'F2:G836');
test=xlsread('E:\数学建模\建模论文\2017CUMCM\B\定价（原始）.xlsx',1,'B536:C836');
test_class=xlsread('E:\数学建模\建模论文\2017CUMCM\B\定价（原始）.xlsx',1,'D536:D836');

pred=ObjBayes.predict(test);
 strcmpi(pred,test_class);
A=sum(strcmpi(pred,test_class));
B=length(strcmpi(pred,test_class));
acc_tate=A/B
test1=xlsread('E:\数学建模\建模论文\2017CUMCM\B\最新定价.xlsx',1,'F2:G836');
pred1=ObjBayes.predict(test1);