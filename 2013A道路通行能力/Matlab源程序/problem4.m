% ����4
clear;
close all;
clc;
load('problem4.mat');
disp('����������Ҫ�ϳ�ʱ�䣬���Ժ�');
for ss = 1:50
%% Ԫ���Զ�������ģ�� 1.ֻ����С���ʹ� 2. ���ִ��൱��ͬʱ��������С�� 3.��������
length_car = 4.8;
global length;length = floor(140/length_car);%������λ����
global DU TONG; DU = 0; TONG = 255;
% ����·(255��ʾ��ͨ��0��ʾ����)
global road ;
road= zeros(5,length); road(2,1) = 255;road(2,:) = 255;road(3,:) = 255;road(4,:) = 255;
road(1,:) = 0;road(5,:) = 0;
road(3,1) = 0;road(4,1) = 0;
flag = zeros(size(road));

 imshow(road);
% axis off      

% ͳ�����γ�����ͬ���ͳ��ı���
shangyou = sum(shangyou1,1)+sum(shangyou2,1);
per_s = shangyou(1)/sum(shangyou);
per_l = shangyou(3)/sum(shangyou);

per_s = per_s/(per_s+per_l);
per_l = 1-per_s;

% ���ʷ���
weight = [1,2];%����/����
shangyou = 1500;%���γ�����
per_newcar = 1500/1800;%ÿһ����µĵ�����

per_sec = [0.21,0.44,0.35];% ѡ�񳵵�
v1 = 2;v2 = 1;%��·��Ϊ�����֣��ֱ�Ĳ������ȣ�30km/h 1m/s)��
l = 0;%���µ�ʱ��ѡ���˴�

% ��Ҫ��·�������ɳ���������Ϊ12

pcu = 12;
while pcu >0
    %ѡ����,���̶�   
      if rand<=per_s
            pcu = pcu-1;     
            num = 1;
      else
            pcu = pcu-2;
            num = 2;
      end
    %��������ͳ���
    while num >0
        while road(ceil(rand*3)+1,ceil(rand*length)) == DU end
        x = ceil(rand*length);
        y = ceil(rand*3);
        road(y+1,x) = DU;           
        num = num-1;
    end
end


% ÿһ���ӽ��г������¡�����ǰ������������
t = 0;
while size(find(road(2,:)== 255),2)>2&&size(find(road(2,:)== 255),2)>2&&size(find(road(2,:)== 255),2)>2%������û��һ������
    %ǰ�� 
    for i = 2:4   
       for j = 2:length
            prob = 0.18*j;
            if road(i,j) == DU&&flag(i,j) == 0&&rand<prob
                if road(i,j-1) == TONG                    
                   road(i,j) = TONG; 
                   road(i,j-1) = DU;
                   flag(i,j) = 1;
                   if road(2,1) == DU
                       road(2,1) = TONG;
                   end                               
                else 
                    %����
                    huandao(i,j);
                end
            end            
       end       
    end    
    
    
    %���³���  
    if mod(fix(t/30),2)
        if l==1
            l = 0;
            continue;
        end
        if rand<=per_newcar
           %����ʲô��           
           if rand <=per_s
               num = 1;           
           else 
               num = 2;           
               l = 1;
           end       

           %�������г���
            while num>0
               if rand<=0.44                
                    road(3,length) = DU;
               elseif rand<=0.44+0.35
                    road(4,length) = DU;
               else
                    road(2,length) = DU;
               end
               num = num-1;
            end
        end    
    end
    t = t+1;
    cal(t) = calline(road);
    %imshow(road);
% % %     set(gcf,'units','normalized','position',[0,0,1,0.9]);       
    %pause(0.1);       
    flag = zeros(size(flag));    
end
log(ss) = t;
plot(cal);
grid on;
legend('�ӳ���ʱ��ı仯����λ������');
end
t = mean(log)/60