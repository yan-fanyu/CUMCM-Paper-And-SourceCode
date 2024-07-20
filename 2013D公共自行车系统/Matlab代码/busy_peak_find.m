% busy_peak_find
clear all;
load bike_record_busy_day.mat

s_peak_time = {};
s_peak_index ={};
s_peak_amount = zeros(1,181);

e_peak_time = {};
e_peak_index = {};
e_peak_amount = zeros(1,181);

time_x = 0:0.2:24;
start_time_hist_mat = zeros(181,length(time_x));
end_time_hist_mat = zeros(181,length(time_x));

for i = 1:181
    start_time0 = start_time(find(start_station == i));

    end_time0 = end_time(find(end_station == i));

    start_time0 = mod(start_time0,1) * 24;
    time_x = 0:0.2:24;
    start_time_hist = hist(start_time0,time_x);
    mean_filter_radiu = 2;
    st_hist_mean_f = mean_filter(start_time_hist,mean_filter_radiu);
    st_hist_mean_f = mean_filter(st_hist_mean_f,mean_filter_radiu);
    plot(time_x,start_time_hist,'b',time_x,st_hist_mean_f,'r--');
    xlabel('时间（小时）');
    ylabel('借车频次');
    legend('未经滤波的时刻分布概率密度函数','均值滤波之后的时刻分布概率密度函数');
    
    start_time_hist_mat(i,:) = st_hist_mean_f;
%     start_time_hist_diff = diff(st_hist_mean_f);
    peak_index = find_peak(st_hist_mean_f);
%     plot(time_x,st_hist_mean_f,'r',time_x(peak_index),st_hist_mean_f(peak_index),'b*');
%     xlabel('时间（小时）');
%     ylabel('借车频次');
    
    s_peak_amount(i) = length(peak_index);
    s_peak_time{i} = time_x(peak_index);
    s_peak_index{i} = peak_index;

    end_time0 = mod(end_time0,1) * 24;
    time_x = 0:0.2:24;
    end_time_hist = hist(end_time0,time_x);
    et_hist_mean_f = mean_filter(end_time_hist,mean_filter_radiu);
    et_hist_mean_f = mean_filter(et_hist_mean_f,mean_filter_radiu);
    
    end_time_hist_mat(i,:) = et_hist_mean_f;
    peak_index = find_peak(et_hist_mean_f);
%     plot(time_x,st_hist_mean_f,'r',time_x(peak_index),st_hist_mean_f(peak_index),'b*');
    e_peak_amount(i) = length(peak_index);
    e_peak_time{i} = time_x(peak_index);
    e_peak_index{i} = peak_index;
    
%     pause(0.2);
%     plot(time_x,st_hist_mean_f,'r',time_x,et_hist_mean_f,'b');
end
% plot(time_x,st_hist_mean_f,'r')%,time_x,et_hist_mean_f,'b');

save busy_peak.mat s_peak_amount s_peak_time s_peak_index start_time_hist_mat...
    e_peak_amount e_peak_time e_peak_index end_time_hist_mat