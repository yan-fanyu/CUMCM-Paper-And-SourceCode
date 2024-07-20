% function csv_data_load
%csv_data_load
day_no_vec = 1:20;
bike_record = zeros(1000000,10);
bike_item_cnt = 0;
for i_day = day_no_vec
    filename = sprintf('day%02d.csv',i_day);
    fid = fopen(filename,'r');
    tline = fgetl(fid);
    while(~feof(fid))
        tline = fgetl(fid);
        comma_index = find(tline == ',');
        line_item{1} = tline(1:comma_index(1)-1);
        line_item{15} = tline(comma_index(14)+1:end);
        for i_line_item = 2:14
            line_item{i_line_item} = tline(comma_index(i_line_item-1)+1:comma_index(i_line_item)-1);
        end
        item_no = str2num(line_item{1});
        item_no = i_day * 1e5 + item_no
        bike_sn = str2num(line_item{3});
        start_station = str2num(line_item{5});
        start_time = datenum(line_item{7});
        end_station = str2num(line_item{9});
        end_time = datenum(line_item{11});
        duration = str2num(line_item{12});
        user_sn = str2num(line_item{15});
        start_pos = str2num(line_item{6});
        end_pos = str2num(line_item{10});
        if ~isempty(start_time) && ...
            ~isempty(end_time) %&& ...
%             start_time - datenum([2012 11 i_day]) < 1 && ...
%             end_time - datenum([2012 11 i_day]) < 20
            bike_item_cnt = bike_item_cnt + 1;
            bike_record(bike_item_cnt,:) = [
                item_no,
                bike_sn,
                start_station,
                start_time,
                end_station,
                end_time,
                duration,
                user_sn,
                start_pos,
                end_pos,                
            ];
        end
    end
    fclose(fid);
end
bike_record = bike_record(1:bike_item_cnt,:);
save bike_record.mat bike_record