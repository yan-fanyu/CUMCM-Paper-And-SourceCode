%һ���������ģ����Ӧ�Ⱥ���
function [fit,load_time,unload_time,m]=fitness(RGV_position,N,j)

%RGV_position RGV�ƶ�����
%N RGV�ƶ����г��ȣ���RGVԤ���ƶ�����
%j ��j��RGV�ƶ����У����Ŵ��㷨�е�һ��Ⱦɫ��

curent_time=0;             %curent_time ��ǰʱ��
CNC_finish_time=zeros(8);  %����CNC��ɵ�ǰ������Ԥ��ʱ��
finished_num=0;            %����ϵͳ����8Сʱ�������ĳ�Ʒ��
load_time=zeros(1,N);
unload_time=zeros(1,N);
CNC_doing=zeros(1,8);     %��ǰ����CNC���ڼӹ����������
%��һ��
exchang_time_odd=28;
exchang_time_even=31;
clear_time=25;
time_for_one_step=560;
mov_1_step_t=20;
mov_2_step_t=33;
mov_3_step_t=46;
fitn=330;

%�ڶ���
% exchang_time_odd=30;
% exchang_time_even=35;
% clear_time=30;
% time_for_one_step=580;
% mov_1_step_t=23;
% mov_2_step_t=41;
% mov_3_step_t=59;
% fitn=310;

%������
% exchang_time_odd=27;
% exchang_time_even=32;
% clear_time=25;
% time_for_one_step=545;
% mov_1_step_t=18;
% mov_2_step_t=32;
% mov_3_step_t=46;
% fitn=340;
       for i=1:N
           load_time(i)=curent_time;
           
            if(mod(RGV_position(j,i),2)==0)
               curent_time=curent_time+exchang_time_even;
            else
               curent_time=curent_time+exchang_time_odd;
            end
            
            if(CNC_doing(RGV_position(j,i))>0)
                unload_time(CNC_doing(RGV_position(j,i)))=load_time(i);
                finished_num=finished_num+1;
                curent_time=curent_time+clear_time;
            end
                   
            CNC_finish_time(RGV_position(j,i))=curent_time+time_for_one_step;
            CNC_doing(RGV_position(j,i))=i;
            
            if(i<N)
                if(curent_time<CNC_finish_time(RGV_position(j,i+1)))
                    curent_time=CNC_finish_time(RGV_position(j,i+1));
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
end