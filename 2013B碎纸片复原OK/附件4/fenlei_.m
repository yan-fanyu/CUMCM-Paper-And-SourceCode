clear
gezhangtouying;
%寻找第一个完整行的下边界作为分类依据
%计算第一个完整行的高度，分为三类:小字母[23,25] 一头或一尾或大写[34,39] [47,52]
biaozhun=zeros(209,1);
for i=1:209
    for j=1:179
        if(touying(j,i)==0 && touying(j+1,i)~=0)
            for k=1:52
                if(touying(j+k,i)~=0 && touying(j+1+k,i)==0)
                    break;
                end
            end
            %k为该完整行的高度
            if(k>=23 && k<=27)%对于小字母k+j为要记录的底部
                biaozhun(i)=k+j;
            elseif(k>=31 && k<=42)
                biaozhun(i)=k+j;
            elseif(k>=45 && k<=54)
                biaozhun(i)=k+j-14;
            end
            if(k<23)
                continue;
            end
            break;
        end
    end
end
temp=[2 18 25 33 34 62 40 74 102 110 113 140 167 169 173 201 208]+1;
for i=1:17
    biaozhun(temp(i))=biaozhun(temp(i))-14;
end
biaozhun(74)=biaozhun(74)-12+14;
biaozhun(93)=biaozhun(93)-11;
biaozhun(105)=biaozhun(105)-11;
biaozhun(173)=89;%逗号
biaozhun(95)=86;%逗号
%[0 2 22 25 33 34 62 40 74 102 110 113 140 151 167 169 173 201 208]-14
%!!73-12 104-11 92-11
%73
%寻找每行开头5列像素的255
diyipian=zeros(1,11);
k=1;
for i=1:209
    if(sum(sum(img0(:,i*72-71:i*72-60)))==255*180*12)
        diyipian(k)=i;
        k=k+1;
    end
end

%计算每块第一块黑色区域的下边界
%65为行间距
for i=1:209
    if(biaozhun(i)-65*floor(biaozhun(i)/65)>11)
        biaozhun(i)=biaozhun(i)-65*floor(biaozhun(i)/65);
    end
end

biaozhunpaixu=sort(biaozhun);




%第一块黑色的下边缘
%{
for i=1:209
    for j=1:179
        if(touying(j,i)-touying(j+1,i)>=9 && touying(j+1,i)<14)
            biaozhun(i)=j;
            break;
        end
    end
end
ans=sort(biaozhun);
%}