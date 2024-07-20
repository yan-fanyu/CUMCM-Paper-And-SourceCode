%�����������ģ����Ӧ�Ⱥ���
function [fit,load_time1,load_time2,unload_time1,unload_time2,m]=fitness_2steps(RGV_position1,RGV_position2,N,j)
N=N/2;
%RGV_position RGV�ƶ�����
%N RGV�ƶ����г��ȣ���RGVԤ���ƶ�����
%j ��j��RGV�ƶ����У����Ŵ��㷨�е�һ��Ⱦɫ��
curent_time=0;             %curent_time ��ǰʱ��
CNC_finish_time=zeros(8);  %����CNC��ɵ�ǰ������Ԥ��ʱ��
finished_num=0;            %����ϵͳ����8Сʱ�������ĳ�Ʒ��
CNC_doing=zeros(1,8);     %��ǰ����CNC���ڼӹ����������

load_time1=zeros(1,N);
load_time2=zeros(1,N);
unload_time1=zeros(1,N);
unload_time2=zeros(1,N);
%��һ��
exchang_time_odd=28;
exchang_time_even=31;
clear_time=25;
time_for_first_step=400;   %�ӹ���ɵ�һ������ʱ��
time_for_sec_step=378;     %�ӹ���ɵڶ�������ʱ��
mov_1_step_t=20;           %�ƶ������ʱ��
mov_2_step_t=33;
mov_3_step_t=46;
fitn=230;

%�ڶ���
% exchang_time_odd=30;
% exchang_time_even=35;
% clear_time=30;
% time_for_first_step=280;   %�ӹ���ɵ�һ������ʱ��
% time_for_sec_step=500;     %�ӹ���ɵڶ�������ʱ��
% mov_1_step_t=23;
% mov_2_step_t=41;
% mov_3_step_t=59;
% fitn=180;


%������
% exchang_time_odd=27;
% exchang_time_even=32;
% clear_time=25;
% time_for_first_step=400;   %�ӹ���ɵ�һ������ʱ��
% time_for_sec_step=378;     %�ӹ���ɵڶ�������ʱ��
% mov_1_step_t=18;
% mov_2_step_t=32;
% mov_3_step_t=46;
% fitn=170;

       for i=1:N
           %�Ƚ��е�һ������Ĳ���
           first_step_done=0;%��ǵ�һ�������Ƿ���������Ʒ
           load_time1(i)=curent_time;
            if(mod(RGV_position1(j,i),2)==0)                 
               curent_time=curent_time+exchang_time_even;   %ż������������
            else
               curent_time=curent_time+exchang_time_odd;    %��������������
            end
            
            if(CNC_doing(RGV_position1(j,i))>0)            %��һ�������Ѿ���������Ʒ
                unload_time1(CNC_doing(RGV_position1(j,i)))=load_time1(i);
                first_step_done=CNC_doing(RGV_position1(j,i));
            end
            CNC_doing(RGV_position1(j,i))=i;
            
            CNC_finish_time(RGV_position1(j,i))=curent_time+time_for_first_step;
%             curent_time=curent_time+clear_time;
%             finished_num=finished_num+1;

            
            if(first_step_done>0)
                
                if(curent_time<CNC_finish_time(RGV_position2(j,i)))
                    curent_time=CNC_finish_time(RGV_position2(j,i));   %ԭ�صȴ��ڶ������������
                end    
                if(abs(floor((RGV_position2(j,i)+1)/2)-floor((RGV_position1(j,i)+1)/2))>2)
                    curent_time=curent_time+mov_3_step_t;
                elseif(abs(floor((RGV_position2(j,i)+1)/2)-floor((RGV_position1(j,i)+1)/2))>1)
                    curent_time=curent_time+mov_2_step_t;
                elseif(abs(floor((RGV_position2(j,i)+1)/2)-floor((RGV_position1(j,i)+1)/2))>0)
                     curent_time=curent_time+mov_1_step_t;
                end
                %�ٽ��еڶ�������Ĳ���
                load_time2(first_step_done)=curent_time;
                if(mod(RGV_position2(j,i),2)==0)                 
                   curent_time=curent_time+exchang_time_even;   %ż������������
                else
                   curent_time=curent_time+exchang_time_odd;    %��������������
                end
                if(CNC_doing(RGV_position2(j,i))>0)
                    unload_time2(CNC_doing(RGV_position2(j,i)))=load_time2(first_step_done);
                    curent_time=curent_time+clear_time;             %�ڶ���������ɣ������Ͻ�����ϴ����Ʒ����һ
                    finished_num=finished_num+1;
                end
                CNC_doing(RGV_position2(j,i))=first_step_done;
                CNC_finish_time(RGV_position2(j,i))=curent_time+time_for_sec_step;

                if(i<N)
                    if(curent_time<CNC_finish_time(RGV_position1(j,i+1)))
                        curent_time=CNC_finish_time(RGV_position1(j,i+1));   %ԭ�صȴ���һ��CNC������
                    end    
                    if(abs(floor((RGV_position1(j,i+1)+1)/2)-floor((RGV_position2(j,i)+1)/2))>2)
                        curent_time=curent_time+mov_3_step_t;
                    elseif(abs(floor((RGV_position1(j,i+1)+1)/2)-floor((RGV_position2(j,i)+1)/2))>1)
                        curent_time=curent_time+mov_2_step_t;
                    elseif(abs(floor((RGV_position1(j,i+1)+1)/2)-floor((RGV_position2(j,i)+1)/2))>0)
                         curent_time=curent_time+mov_1_step_t;
                    end
                end
            else    %ֱ���ƶ�����һ��CNCת�ص�һ����������
                if(curent_time<CNC_finish_time(RGV_position1(j,i+1)))
                        curent_time=CNC_finish_time(RGV_position1(j,i+1));   %ԭ�صȴ���һ��CNC������ 
                end 
                if(abs(floor((RGV_position1(j,i+1)+1)/2)-floor((RGV_position1(j,i)+1)/2))>2)
                        curent_time=curent_time+mov_3_step_t;
                    elseif(abs(floor((RGV_position1(j,i+1)+1)/2)-floor((RGV_position1(j,i)+1)/2))>1)
                        curent_time=curent_time+mov_2_step_t;
                    elseif(abs(floor((RGV_position1(j,i+1)+1)/2)-floor((RGV_position1(j,i)+1)/2))>0)
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