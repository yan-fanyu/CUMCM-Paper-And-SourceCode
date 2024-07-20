%一道工序调度模型适应度函数
function [fit,load_time,unload_time,m]=fitness(RGV_position,N,j)

%RGV_position RGV移动序列
%N RGV移动序列长度，即RGV预设移动长度
%j 第j个RGV移动序列，即遗传算法中的一个染色体

curent_time=0;             %curent_time 当前时间
CNC_finish_time=zeros(8);  %各个CNC完成当前工作的预定时间
finished_num=0;            %整个系统工作8小时所生产的成品数
load_time=zeros(1,N);
unload_time=zeros(1,N);
CNC_doing=zeros(1,8);     %当前各个CNC正在加工的物料序号
%第一组
exchang_time_odd=28;
exchang_time_even=31;
clear_time=25;
time_for_one_step=560;
mov_1_step_t=20;
mov_2_step_t=33;
mov_3_step_t=46;
fitn=330;

%第二组
% exchang_time_odd=30;
% exchang_time_even=35;
% clear_time=30;
% time_for_one_step=580;
% mov_1_step_t=23;
% mov_2_step_t=41;
% mov_3_step_t=59;
% fitn=310;

%第三组
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
            if(curent_time>28800)               %当时间到达8小时，返回适应度
                %finished(j)=1;
                %fprintf('M:%d  num:%d\n',j,finished_num(j));
                fit=finished_num-fitn;
                m=i;
                break;
            end
       end
end