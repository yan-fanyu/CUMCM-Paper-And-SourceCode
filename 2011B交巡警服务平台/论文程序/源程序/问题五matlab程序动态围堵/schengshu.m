%%%%Éú³ÉÊ÷³ÌÐò
clc;load juli;
chukou=[151 153 177 202 203 264 317 325 328 332 362 387 418 483 541 572 578];
[x,l]=size(chukou);
for i=1:l
[lu lc]=zuiduanlu(juli,32,chukou(i));
lu
lc
end