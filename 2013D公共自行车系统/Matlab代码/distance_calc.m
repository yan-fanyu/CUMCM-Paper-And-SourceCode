% distance_calc
clear all;
load bike_record_busy_day.mat
load station_coor.mat

station_coor = station_coor_m;

distance_mat_norm2 = zeros(181,181);
distance_mat_norm1 = zeros(181,181);
for i = 1:181
    for j = 1:181
        distance_mat_norm2(i,j) = norm(station_coor(i,:)-station_coor(j,:));
        distance_mat_norm1(i,j) = norm(station_coor(i,:)-station_coor(j,:),1);
    end
end

distance_mat = distance_mat_norm1;
[farest_0 farest_index] = max(distance_mat);


start_station0 = start_station(find(duration_float >=1));
end_station0 = end_station(find(duration_float >=1));
item_length = length(start_station0);

station_connected = zeros(181,181);
for i = 1:item_length
    i_start = start_station0(i);
    i_end = end_station0(i);
    station_connected(i_start,i_end) = station_connected(i_start,i_end) + 1;
end

distance_mat_path = distance_mat .*(station_connected>0);
[farest_real farest_real_index] = max(distance_mat_path,[],2);
nearest_real = zeros(181,1);
nearest_real_index = zeros(181,1);
for i = 1:181
    distance_mat_path_row = distance_mat_path(i,:);
    i_nz = find(distance_mat_path_row~=0);
    nz = distance_mat_path_row(i_nz);
    [nearest_real0 nearest_real_index0] = min(nz);
    if ~isempty(nearest_real0)
        nearest_real(i) = nearest_real0;
        nearest_real_index(i) = i_nz(nearest_real_index0);   
    end
end
