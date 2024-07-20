%计算投影
clear;
num=11;
gehang=[
20	195	94	142	89	122	127	106	156	115	177	183	152	23	58	203	72	166	83
21	42	109	117	137	74	37	208	136	16	77	44	200	46	174	80	162	180	144
71	85	61	15	69	175	138	196	9	48	173	157	97	24	100	123	91	186	110
82	78	129	201	132	53	126	141	194	88	90	49	73	13	178	125	1	103	116
87	52	108	30	41	159	187	99	25	118	151	6	60	59	93	31	38	47	128
133	182	96	70	168	164	167	189	112	145	207	4	131	35	14	111	26	28	179
160	140	2	130	64	139	154	54	39	124	121	176	86	51	161	188	98	204	32
172	43	67	206	11	158	75	146	84	135	56	19	57	36	17	10	184	153	45
192	76	12	155	191	185	3	105	181	65	107	5	150	33	205	66	40	68	148
202	149	171	197	199	95	114	165	79	104	92	81	102	27	101	7	18	29	147
209	22	8	50	62	120	34	143	169	63	170	55	193	134	119	190	163	198	113
];
for j=1:11  %读取所有碎纸片
    i=gehang(j,1);
    if i<11
        [img0(:,j*72-71:j*72),cmap0(:,j*3-2:j*3)]=imread(strcat('00',num2str(i-1)),'bmp');
    elseif i<101
        [img0(:,j*72-71:j*72),cmap0(:,j*3-2:j*3)]=imread(strcat('0',num2str(i-1)),'bmp');
    else
        [img0(:,j*72-71:j*72),cmap0(:,j*3-2:j*3)]=imread(num2str(i-1),'bmp');
    end
end
touying=zeros(180,num);%touying用每一列记录对应图片黑色像素点数
for i=1:num
    for j=1:180
        touying(j,i)=length(find(img0(j,i*72-71:i*72)~=255));
    end
end


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
for i=1:num
    if(sum(sum(img0(:,i*72-71:i*72-60)))==255*180*12)
        diyipian(k)=i;
        k=k+1;
    end
end

%计算每块第一块黑色区域的下边界
%65为行间距
for i=1:num
    if(biaozhun(i)~=65 & biaozhun(i)~=66)
        biaozhun(i)=biaozhun(i)-65*floor(biaozhun(i)/65);
    end
end

