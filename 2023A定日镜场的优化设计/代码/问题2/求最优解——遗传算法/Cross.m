function [ ret ] = Cross( pcross,lenchrom,chrom,sizepop,bound,alps,gams)
%��������ɽ������
%pcross     input:�������
%lenchrom   input:Ⱦɫ��ĳ���
%chrom      inout:Ⱦɫ��Ⱥ/��Ⱥ
%sizepop    input:��Ⱥ��ģ
%ret       output:������Ⱦɫ��
for n = 1:sizepop
    %���ѡ������Ⱦɫ����н���
    while 1
        pick = rand(1,2);
        if prod(pick)
            break
        end
    end
    index = ceil(pick*sizepop);
    %������ʾ����Ƿ񽻲�
    while 1
        pick = rand;
        if pick
            break
        end
    end
    if pick > pcross
        continue;
    end
    while 1 %flag == 0
        %���ѡ�񽻲�λ��
        while 1
            pick = rand;
            if pick
                break
            end
        end
        pos = ceil(pick*lenchrom);        %���ѡ��������н���
        pick = rand;                      %���濪ʼ
        v1 = chrom(index(1),pos);
        v2 = chrom(index(2),pos);
        chrom(index(1),pos) = pick*v2 + (1-pick)*v1;
        chrom(index(2),pos) = pick*v1 + (1-pick)*v2;    %�������
        flag = [Test(lenchrom,bound,chrom(index(1),:),alps,gams) ...
        Test(lenchrom,bound,chrom(index(2),:),alps,gams)];
        if prod(flag)
            break
        end
    end
end
ret = chrom;
end

