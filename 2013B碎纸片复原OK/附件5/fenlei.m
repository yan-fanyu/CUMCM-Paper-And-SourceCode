gezhangtouying;
num=418;
%寻找第一个完整行的下边界作为分类依据
%计算第一个完整行的高度，分为三类:小字母[23,25] 一头或一尾或大写[34,39] [47,52]
biaozhun=zeros(num,1);
for i=1:num
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
temp=[4	8	11	29	79	102	107	136	142	146	157	159	161	163	168	174	175	199	204	222	240	259	270	272	278	289	295	306	307	312	313	322	330	336	342 347	363	377	378		386	399	400	405	410	413	417];
[t,n]=size(temp);
for i=1:n
    biaozhun(temp(i))=biaozhun(temp(i))-14;
end
biaozhun(22)=84;%逗号
biaozhun(11)=84;%?
biaozhun(275)=(96)
biaozhun(69)=107;%下面半个
biaozhun(127)=86;
biaozhun(235)=86;
biaozhun(271)=33;%18
biaozhun(279)=55;%24
biaozhun(305)=84;%23
biaozhun(55)=32;%45
biaozhun(108)=76;%23
biaozhun(225)=55;%27
biaozhun(255)=85;%25
biaozhun(132)=53;%26
biaozhun(139)=95;%38
biaozhun(213)=55;%41
biaozhun(242)=84;%34
biaozhun(282)=74;%40
biaozhun(304)=53;%19
biaozhun(379)=75;%28
biaozhun(126)=109;%15
biaozhun(135)=85;
biaozhun(285)=63;%32
biaozhun(405)=76;%19?
%biaozhun(74)=biaozhun(74)-12+14;
%biaozhun(93)=biaozhun(93)-11;
%biaozhun(105)=biaozhun(105)-11;
%biaozhun(173)=89;%逗号
%biaozhun(95)=86;%逗号
%[0 2 22 25 33 34 62 40 74 102 110 113 140 151 167 169 173 201 208]-14
%!!73-12 104-11 92-11
%73
%寻找每行开头5列像素的255
diyipian=zeros(1,22);
k=1;
for i=1:num
    if(sum(sum(img0(:,i*72-71:i*72-60)))==255*180*12)
        diyipian(k)=i;
        k=k+1;
    end
end
%减64
for i=1:num
    if biaozhun(i)>66
        biaozhun(i)=biaozhun(i)-64*floor(biaozhun(i)/64)
    end
end

%计算每块第一块黑色区域的下边界
%65为行间距
%for i=1:num
%    if(biaozhun(i)-65*floor(biaozhun(i)/65)>11)
%        biaozhun(i)=biaozhun(i)-65*floor(biaozhun(i)/65);
%    end
%end

biaozhunpaixu=sort(biaozhun);




%第一块黑色的下边缘
%{
for i=1:num
    for j=1:179
        if(touying(j,i)-touying(j+1,i)>=9 && touying(j+1,i)<14)
            biaozhun(i)=j;
            break;
        end
    end
end
ans=sort(biaozhun);
%}