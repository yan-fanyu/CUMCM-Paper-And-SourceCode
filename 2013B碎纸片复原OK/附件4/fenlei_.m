clear
gezhangtouying;
%Ѱ�ҵ�һ�������е��±߽���Ϊ��������
%�����һ�������еĸ߶ȣ���Ϊ����:С��ĸ[23,25] һͷ��һβ���д[34,39] [47,52]
biaozhun=zeros(209,1);
for i=1:209
    for j=1:179
        if(touying(j,i)==0 && touying(j+1,i)~=0)
            for k=1:52
                if(touying(j+k,i)~=0 && touying(j+1+k,i)==0)
                    break;
                end
            end
            %kΪ�������еĸ߶�
            if(k>=23 && k<=27)%����С��ĸk+jΪҪ��¼�ĵײ�
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
biaozhun(173)=89;%����
biaozhun(95)=86;%����
%[0 2 22 25 33 34 62 40 74 102 110 113 140 151 167 169 173 201 208]-14
%!!73-12 104-11 92-11
%73
%Ѱ��ÿ�п�ͷ5�����ص�255
diyipian=zeros(1,11);
k=1;
for i=1:209
    if(sum(sum(img0(:,i*72-71:i*72-60)))==255*180*12)
        diyipian(k)=i;
        k=k+1;
    end
end

%����ÿ���һ���ɫ������±߽�
%65Ϊ�м��
for i=1:209
    if(biaozhun(i)-65*floor(biaozhun(i)/65)>11)
        biaozhun(i)=biaozhun(i)-65*floor(biaozhun(i)/65);
    end
end

biaozhunpaixu=sort(biaozhun);




%��һ���ɫ���±�Ե
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