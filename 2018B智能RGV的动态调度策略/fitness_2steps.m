%两道工序调度模型适应度函数
function [fit,load_time1,load_time2,unload_time1,unload_time2,m]=fitness_2steps(RGV_position1,RGV_position2,N,j)
N=N/2;
%RGV_position RGV移动序列
%N RGV移动序列长度，即RGV预设移动长度
%j 第j个RGV移动序列，即遗传算法中的一个染色体
curent_time=0;             %curent_time 当前时间
CNC_finish_time=zeros(8);  %各个CNC完成当前工作的预定时间
finished_num=0;            %整个系统工作8小时所生产的成品数
CNC_doing=zeros(1,8);     %当前各个CNC正在加工的物料序号

load_time1=zeros(1,N);
load_time2=zeros(1,N);
unload_time1=zeros(1,N);
unload_time2=zeros(1,N);
%第一组
exchang_time_odd=28;
exchang_time_even=31;
clear_time=25;
time_for_first_step=400;   %加工完成第一道工序时间
time_for_sec_step=378;     %加工完成第二道工序时间
mov_1_step_t=20;           %移动所需的时间
mov_2_step_t=33;
mov_3_step_t=46;
fitn=230;

%第二组
% exchang_time_odd=30;
% exchang_time_even=35;
% clear_time=30;
% time_for_first_step=280;   %加工完成第一道工序时间
% time_for_sec_step=500;     %加工完成第二道工序时间
% mov_1_step_t=23;
% mov_2_step_t=41;
% mov_3_step_t=59;
% fitn=180;


%第三组
% exchang_time_odd=27;
% exchang_time_even=32;
% clear_time=25;
% time_for_first_step=400;   %加工完成第一道工序时间
% time_for_sec_step=378;     %加工完成第二道工序时间
% mov_1_step_t=18;
% mov_2_step_t=32;
% mov_3_step_t=46;
% fitn=170;

       for i=1:N
           %先进行第一道工序的操作
           first_step_done=0;%标记第一道工序是否生产出产品
           load_time1(i)=curent_time;
            if(mod(RGV_position1(j,i),2)==0)                 
               curent_time=curent_time+exchang_time_even;   %偶数机器上下料
            else
               curent_time=curent_time+exchang_time_odd;    %奇数机器上下料
            end
            
            if(CNC_doing(RGV_position1(j,i))>0)            %第一道工序已经生产出产品
                unload_time1(CNC_doing(RGV_position1(j,i)))=load_time1(i);
                first_step_done=CNC_doing(RGV_position1(j,i));
            end
            CNC_doing(RGV_position1(j,i))=i;
            
            CNC_finish_time(RGV_position1(j,i))=curent_time+time_for_first_step;
%             curent_time=curent_time+clear_time;
%             finished_num=finished_num+1;

            
            if(first_step_done>0)
                
                if(curent_time<CNC_finish_time(RGV_position2(j,i)))
                    curent_time=CNC_finish_time(RGV_position2(j,i));   %原地等待第二道工序的请求
                end    
                if(abs(floor((RGV_position2(j,i)+1)/2)-floor((RGV_position1(j,i)+1)/2))>2)
                    curent_time=curent_time+mov_3_step_t;
                elseif(abs(floor((RGV_position2(j,i)+1)/2)-floor((RGV_position1(j,i)+1)/2))>1)
                    curent_time=curent_time+mov_2_step_t;
                elseif(abs(floor((RGV_position2(j,i)+1)/2)-floor((RGV_position1(j,i)+1)/2))>0)
                     curent_time=curent_time+mov_1_step_t;
                end
                %再进行第二道工序的操作
                load_time2(first_step_done)=curent_time;
                if(mod(RGV_position2(j,i),2)==0)                 
                   curent_time=curent_time+exchang_time_even;   %偶数机器上下料
                else
                   curent_time=curent_time+exchang_time_odd;    %奇数机器上下料
                end
                if(CNC_doing(RGV_position2(j,i))>0)
                    unload_time2(CNC_doing(RGV_position2(j,i)))=load_time2(first_step_done);
                    curent_time=curent_time+clear_time;             %第二道工序完成，对熟料进行清洗，成品数加一
                    finished_num=finished_num+1;
                end
                CNC_doing(RGV_position2(j,i))=first_step_done;
                CNC_finish_time(RGV_position2(j,i))=curent_time+time_for_sec_step;

                if(i<N)
                    if(curent_time<CNC_finish_time(RGV_position1(j,i+1)))
                        curent_time=CNC_finish_time(RGV_position1(j,i+1));   %原地等待下一个CNC的请求
                    end    
                    if(abs(floor((RGV_position1(j,i+1)+1)/2)-floor((RGV_position2(j,i)+1)/2))>2)
                        curent_time=curent_time+mov_3_step_t;
                    elseif(abs(floor((RGV_position1(j,i+1)+1)/2)-floor((RGV_position2(j,i)+1)/2))>1)
                        curent_time=curent_time+mov_2_step_t;
                    elseif(abs(floor((RGV_position1(j,i+1)+1)/2)-floor((RGV_position2(j,i)+1)/2))>0)
                         curent_time=curent_time+mov_1_step_t;
                    end
                end
            else    %直接移动到下一个CNC转载第一道工序物料
                if(curent_time<CNC_finish_time(RGV_position1(j,i+1)))
                        curent_time=CNC_finish_time(RGV_position1(j,i+1));   %原地等待下一个CNC的请求 
                end 
                if(abs(floor((RGV_position1(j,i+1)+1)/2)-floor((RGV_position1(j,i)+1)/2))>2)
                        curent_time=curent_time+mov_3_step_t;
                    elseif(abs(floor((RGV_position1(j,i+1)+1)/2)-floor((RGV_position1(j,i)+1)/2))>1)
                        curent_time=curent_time+mov_2_step_t;
                    elseif(abs(floor((RGV_position1(j,i+1)+1)/2)-floor((RGV_position1(j,i)+1)/2))>0)
                         curent_time=curent_time+mov_1_step_t;
                 end
            end
            
            if(curent_time>28800)               %当时间到达8小时，返回适应度
                %finished(j)=1;
                %fprintf('M:%d  num:%d\n',j,finished_num(j));
                fit=finished_num-fitn;
                m=i;
                break;
            end
       end
       
end