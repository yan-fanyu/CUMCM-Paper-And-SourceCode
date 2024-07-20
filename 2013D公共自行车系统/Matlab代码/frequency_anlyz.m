clear all;
load bike_record_corrected;
start_time_vec = datevec(start_time);
start_day = start_time_vec(:,3);
end_time_vec = datevec(end_time);
end_day = end_time_vec(:,3);
start_station_day_freq = zeros(181,20);
end_station_day_freq = zeros(181,20);
for i_day = 1:20
    day_start_station = start_station(find(start_day == i_day));
    day_end_station = end_station(find(end_day == i_day));
    for i_station = 1:181
        start_station_day_freq(i_station,i_day) = sum(day_start_station == i_station);
        end_station_day_freq(i_station,i_day) = sum(day_end_station == i_station);
    end
end
start_station_total_freq = sum(start_station_day_freq,2);
end_station_total_freq = sum(end_station_day_freq,2);

[start_sort_freq start_sort_index] = sort(start_station_total_freq,'descend');
[end_sort_freq end_sort_index] = sort(end_station_total_freq,'descend');

save frequency_anlyz.mat start_station_day_freq end_station_day_freq start_station_total_freq ...
    end_station_total_freq start_sort_freq start_sort_index end_sort_freq end_sort_index

fid = fopen('freq_outcome.txt','w');
fprintf(fid,'站点 & ');
for j = 1:10
    fprintf(fid,'$a_{i%d}$ & ',j);
end
fprintf(fid,'累计 \\\\ \r\n');
for i = 1:20
    fprintf(fid,'%d & ',i);
    for j = 1:10
        fprintf(fid,'%d & ',start_station_day_freq(i,j));
    end
    fprintf(fid,'%d \\\\ \r\n',start_station_total_freq(i));
end

fprintf(fid,'\r\n\r\n\r\n');
fprintf(fid,'站点 & ');
for j = 1:10
    fprintf(fid,'$b_{i%d}$ & ',j);
end
fprintf(fid,'累计 \\\\ \r\n');
for i = 1:20
    fprintf(fid,'%d & ',i);
    for j = 1:10
        fprintf(fid,'%d & ',end_station_day_freq(i,j));
    end
    fprintf(fid,'%d \\\\ \r\n',end_station_total_freq(i));
end

fprintf(fid,'\r\n\r\n\r\n');

fprintf(fid,'排序 & 借车站点 & 借车频次 & 排序 & 还车站点 & 还车频次 \\\\\r\n');
for i = 1:20
    fprintf(fid,'%d & %d & %d & %d & %d & %d \\\\\r\n',...
        i, start_sort_index(i), start_sort_freq(i),...
        i, end_sort_index(i), end_sort_freq(i));
end

fclose(fid);
