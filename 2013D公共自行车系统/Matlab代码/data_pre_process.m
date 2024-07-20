% load data & pre-process
% load data
clear all;
load('bike_record.mat');
n_item = size(bike_record,1);
item_no = bike_record(:,1);
bike_sn = bike_record(:,2);
start_station = bike_record(:,3);
start_time = bike_record(:,4);
end_station = bike_record(:,5);
end_time = bike_record(:,6);
duration = bike_record(:,7);
user_sn = bike_record(:,8);
start_pos = bike_record(:,9);
end_pos = bike_record(:,10);

% error analyze
% time
min_start_time = datevec(min(start_time));
max_start_time = datevec(max(start_time));
min_end_time = datevec(min(end_time));
max_end_time = datevec(max(end_time));

% duration
duration_float = (end_time - start_time) * 24 * 60;
duration_float_max = max(duration_float);
time_error_index = find(duration_float < 0);
time_error_item_no = item_no(time_error_index);
duration_error = abs(duration_float - duration);
duration_error_max = max(duration_error);
duration_error_index = find(duration_error > 2);
duration_error_item_no = item_no(duration_error_index);
duration_unique = unique(duration);
duration_too_long_index = find(duration > 1000);
duration_too_long_item_no = item_no(duration_too_long_index);

% station
start_station_unique = unique(start_station);
end_station_unique = unique(end_station);
start_station_error_index = find(start_station > 181);
start_station_error_item_no = item_no(start_station_error_index);
end_station_error_index = find(end_station > 181);
end_station_error_item_no = item_no(end_station_error_index);

% position
start_pos_unique = unique(start_pos);
end_pos_unique = unique(end_pos);

% error data delete
correct_index = find(...
    duration_float > 0 & ...
    duration_error < 2 & ...
    start_station <= 181 & ...
    end_station <= 181);

% save data
item_no = item_no(correct_index);
bike_sn = bike_sn(correct_index);
start_station = start_station(correct_index);
start_time = start_time(correct_index);
end_station = end_station(correct_index);
end_time = end_time(correct_index);
duration = duration(correct_index);
user_sn = user_sn(correct_index);
start_pos = start_pos(correct_index);
end_pos = end_pos(correct_index);
duration_float = duration_float(correct_index);

save bike_record_corrected.mat item_no bike_sn start_station start_time end_station end_time duration user_sn start_pos end_pos duration_float