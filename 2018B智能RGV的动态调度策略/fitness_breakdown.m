%һ����������ϵ���ģ����Ӧ�Ⱥ���
function [fit break_num break_time break_fix_time break_CNC break_product load_time unload_time]=fitness_breakdown(RGV_position,N,j)
%RGV_position RGV�ƶ�����
%N RGV�ƶ����г��ȣ���RGVԤ���ƶ�����
%j ��j��RGV�ƶ����У����Ŵ��㷨�е�һ��Ⱦɫ��
break_time=zeros(1,20);   %���Ϸ���ʱ��
break_fix_time=zeros(1,20); %���Ͻ���ʱ��
break_CNC=zeros(1,20);     %����CNC���
break_product=zeros(1,20); %����ʱ�������
CNC_doing=zeros(1,8);     %��ǰ����CNC���ڼӹ����������
load_time=zeros(1,N);
unload_time=zeros(1,N);
CNC_finish_time=zeros(8);  %����CNC��ɵ�ǰ������Ԥ��ʱ��

break_num=0;               %�������ϵĴ���
curent_time=0;             %curent_time ��ǰʱ��
finished_num=0;            %����ϵͳ����8Сʱ�������ĳ�Ʒ��
break_rate=0.01/900;          %CNCһ���ӷ������ϵĸ���
fix_time=15*60;           %��������ʱ�䣬��λΪ��s

%��һ��
% exchang_time_odd=28;
% exchang_time_even=31;
% clear_time=25;
% time_for_one_step=560;
% mov_1_step_t=20;
% mov_2_step_t=33;
% mov_3_step_t=46;
% fitn=320;

%�ڶ���
% exchang_time_odd=30;
% exchang_time_even=35;
% clear_time=30;
% time_for_one_step=580;
% mov_1_step_t=23;
% mov_2_step_t=41;
% mov_3_step_t=59;
% fitn=300;

%������
exchang_time_odd=27;
exchang_time_even=32;
clear_time=25;
time_for_one_step=545;
mov_1_step_t=18;
mov_2_step_t=32;
mov_3_step_t=46;
fitn=330;

       for i=1:N
           load_time(i)=curent_time;
           
            if(mod(RGV_position(j,i),2)==0)
               %curent_time=curent_time+exchang_time_even;
               time_add(exchang_time_even);
            else
               %curent_time=curent_time+exchang_time_odd;
               time_add(exchang_time_odd);
            end
            
            if(CNC_doing(RGV_position(j,i))>0)
                unload_time(CNC_doing(RGV_position(j,i)))=load_time(i);
                finished_num=finished_num+1;
                %curent_time=curent_time+clear_time;
                time_add(clear_time);
            end
                   
            CNC_finish_time(RGV_position(j,i))=curent_time+time_for_one_step;
            CNC_doing(RGV_position(j,i))=i;
            
            if(i<N)
                if(curent_time<CNC_finish_time(RGV_position(j,i+1)))
                    %curent_time=CNC_finish_time(RGV_position(j,i+1));
                    time_add(CNC_finish_time(RGV_position(j,i+1))-curent_time);
                end    
                if(abs(floor((RGV_position(j,i+1)+1)/2)-floor((RGV_position(j,i)+1)/2))>2)
                    curent_time=curent_time+mov_3_step_t;
                elseif(abs(floor((RGV_position(j,i+1)+1)/2)-floor((RGV_position(j,i)+1)/2))>1)
                    curent_time=curent_time+mov_2_step_t;
                elseif(abs(floor((RGV_position(j,i+1)+1)/2)-floor((RGV_position(j,i)+1)/2))>0)
                     curent_time=curent_time+mov_1_step_t;
                end
            end
            if(curent_time>28800)               %��ʱ�䵽��8Сʱ��������Ӧ��
                %finished(j)=1;
                %fprintf('M:%d  num:%d\n',j,finished_num(j));
                fit=finished_num-fitn;
                m=i;
                break;
            end
       end 
    function time_add(num2add)
%         for t=1:num2add
%             curent_time=curent_time+1;
%         end
        curent_time=curent_time+num2add;
        for n=1:8
                break_n=rand();
                if(break_n<break_rate*num2add)
                    break_num=break_num+1;
                    break_product(break_num)=CNC_doing(n);
                    CNC_doing(n)=0;       %��n��CNC��������
                    break_time(break_num)=curent_time;
                    break_fix_time(break_num)=curent_time+fix_time;
                    break_CNC(break_num)=n;
                    CNC_finish_time(n)=curent_time+fix_time;
             
                end
        end
        
    end 
end