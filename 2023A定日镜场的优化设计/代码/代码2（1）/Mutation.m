function [ ret ] = Mutation( pmutation,lenchrom,chrom,sizepop,pop,bound,alps,gams)
%��������ɱ������
%pmutation      input:�������
%lenchrom       input:Ⱦɫ�峤��
%chrom          input:Ⱦɫ��Ⱥ/��Ⱥ
%sizepop        input:��Ⱥ��ģ
%pop            input:��ǰ��Ⱥ�Ľ������������Ľ���������Ϣ
%ret           output:������Ⱦɫ��
for n = 1:sizepop
    %���ѡ��һ��Ⱦɫ����б���
    while 1
        pick = rand;
        if pick
            break
        end
    end
    index = ceil(pick*sizepop);
    %������ʾ�����ѭ���Ƿ���б���
    pick = rand;
    if pick > pmutation
        continue;
    end
    while 1
        %����λ��
        while 1
            pick = rand;
            if pick
                break
            end
        end
        pos = ceil(pick*lenchrom);     %���ѡ���˱����λ��
        v = chrom(n,pos);
        v1 = v - bound(pos,1);
        v2 = bound(pos,2) - v;
        pick = rand;                        %���쿪ʼ
        if pick > 0.5
            delta = v2*( 1 - pick^( ( 1-pop(1)/pop(2) )^2 ) );
            chrom(index,pos) = v + delta;
        else
            delta = v1*( 1 - pick^( (1 - pop(1)/pop(2) )^2 ) );
            chrom(index,pos) = v - delta;
        end                                 %�������
        if Test(lenchrom,bound,chrom(n,:),alps,gams)
            break
        end
    end
end
ret = chrom;
end

