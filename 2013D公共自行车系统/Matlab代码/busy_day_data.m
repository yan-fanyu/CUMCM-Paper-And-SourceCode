% busy_day_data
clear all;
load bike_record_corrected.mat
load frequency_anlyz.mat
ss_station_sum = sum(start_station_day_freq,1);
es_station_sum = sum(end_station_day_freq,1);
day_data = ss_station_sum + es_station_sum;
[day_data_sort index] = sort(day_data,'descend');
busy_day = index(1);

start_time_vec = datevec(start_time);
start_day = start_time_vec(:,3);
end_time_vec = datevec(end_time);
end_day = end_time_vec(:,3);
start_station_day_freq = zeros(181,20);
end_station_day_freq = zeros(181,20);


item_no = item_no(find(start_day == busy_day & end_day == busy_day));
bike_sn = bike_sn(find(start_day == busy_day & end_day == busy_day));
start_station = start_station(find(start_day == busy_day & end_day == busy_day));
start_time = start_time(find(start_day == busy_day & end_day == busy_day));
end_station = end_station(find(start_day == busy_day & end_day == busy_day));
end_time = end_time(find(start_day == busy_day & end_day == busy_day));
duration = duration(find(start_day == busy_day & end_day == busy_day));
user_sn = user_sn(find(start_day == busy_day & end_day == busy_day));
start_pos = start_pos(find(start_day == busy_day & end_day == busy_day));
end_pos = end_pos(find(start_day == busy_day & end_day == busy_day)); 
duration_float = duration_float(find(start_day == busy_day & end_day == busy_day)); 

save bike_record_busy_day.mat item_no bike_sn start_station ...
    start_time end_station end_time duration user_sn ...
    start_pos end_pos duration_float