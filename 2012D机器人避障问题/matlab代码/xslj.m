function xslj(yxzb,sykxd,ROA)
OA=['(' num2str(sykxd(1,ROA(1))) ',' num2str(sykxd(1,ROA(1))) ')'];
for i=2:length(ROA)
    OA=[OA ['-->(' num2str(sykxd(1,ROA(i))) ',' num2str(sykxd(2,ROA(i))) ')']];
    B(i)=sykxd(3,ROA(i));
end
BB=unique(B);
s=hist(B,BB);
t=yxzb(:,BB(find(s>=2)));
YX=[];
for i=1:size(t,2)
    YX=[YX 'Բ�ģ�(' num2str(t(1,i)) ',' num2str(t(2,i)) ')���뾶��' num2str(t(3,i)) '    '];
end
disp([OA]);
disp(['������Բ�ģ��뾶Ϊ' YX]);