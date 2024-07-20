function [ ret, fitness ] = Select( individuals, fitness, sizepop )
%��������ÿһ����Ⱥ�е�Ⱦɫ�����ѡ���Խ��к���Ľ���ͱ���
%individuals    input:��Ⱥ��Ϣ
%fitness        input:��Ӧ��
%sizepop        input:��Ⱥ��ģ
%ret           outout:����ѡ������Ⱥ

% ���̶ķ�

% fitness = 1./fitness;           %��ʼ��Ӧ����������Ӧ�ȳɶԱȹ�ϵ
sumfitness = sum(fitness);      %������Ӧ��
sumf = fitness./sumfitness;     %������Ӧ����������Ӧ��֮��
index = zeros(1,length(sizepop));
for n = 1:sizepop               %תsizepop������
    while 1
        pick = rand;
        if pick
            break
        end
    end
    for m = 1:sizepop
        pick = pick - sumf(m);
        %Ѱ����Ӧ�Ƚϴ�ĸ���
        if pick < 0
            index(n) = m;
            break;              %Ѱ�ҵ�һ���������ֹmѭ��
        end
    end
end
individuals = individuals(index,:);
fitness = fitness(index);
ret = individuals;
end

