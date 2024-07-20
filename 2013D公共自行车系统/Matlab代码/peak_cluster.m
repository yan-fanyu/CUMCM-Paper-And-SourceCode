% peak_cluster
clear all
load busy_peak.mat


% 计算等效峰值向量
n_epeak = 20;
s_epeak_mat = zeros(181,n_epeak);
% e_epeak_mat = zeros(181,n_epeak);
for i = 1:181
    peak_time = s_peak_time{i};
    peak_index = s_peak_index{i};
    st_hist_mean_f = start_time_hist_mat(i,:);
    if length(peak_time) ~= 0
        peak_x = st_hist_mean_f(peak_index);
        peak_x = peak_x /sum(peak_x) * n_epeak;
        peak_x_cum = cumsum(peak_x);
        peak_x_cum = round(peak_x_cum);
        i_peak = 1;
        for j = 1:n_epeak
            if j <= peak_x_cum(i_peak)
                s_epeak_mat(i,j) = peak_time(i_peak);
            else
                i_peak = i_peak + 1;
                s_epeak_mat(i,j) = peak_time(i_peak);
            end
        end
    end
end

e_epeak_mat = zeros(181,n_epeak);
for i = 1:181
    peak_time = e_peak_time{i};
    peak_index = e_peak_index{i};
    et_hist_mean_f = end_time_hist_mat(i,:);
    if length(peak_time) ~= 0
        peak_x = et_hist_mean_f(peak_index);
        peak_x = peak_x /sum(peak_x) * n_epeak;
        peak_x_cum = cumsum(peak_x);
        peak_x_cum = round(peak_x_cum);
        i_peak = 1;
        for j = 1:n_epeak
            if j <= peak_x_cum(i_peak)
                e_epeak_mat(i,j) = peak_time(i_peak);
            else
                i_peak = i_peak + 1;
                e_epeak_mat(i,j) = peak_time(i_peak);
            end
        end
    end
end

idx = kmeans(s_epeak_mat,5);
load station_coor.mat
station_coor = station_coor_g;

map_google = imread('lucheng_map_light.bmp');
figure;
imshow(map_google);
MarkerSize = 40;

hold on
plot(station_coor(idx==1,1),station_coor(idx==1,2),'r.','MarkerSize',MarkerSize);
plot(station_coor(idx==2,1),station_coor(idx==2,2),'g.','MarkerSize',MarkerSize);
plot(station_coor(idx==3,1),station_coor(idx==3,2),'b.','MarkerSize',MarkerSize);
plot(station_coor(idx==4,1),station_coor(idx==4,2),'k.','MarkerSize',MarkerSize);
plot(station_coor(idx==5,1),station_coor(idx==5,2),'c.','MarkerSize',MarkerSize);
hold off

idx = kmeans(e_epeak_mat,5);
load station_coor.mat
station_coor = station_coor_g;

map_google = imread('lucheng_map_light.bmp');
figure;
imshow(map_google);
MarkerSize = 40;

hold on
plot(station_coor(idx==1,1),station_coor(idx==1,2),'r.','MarkerSize',MarkerSize);
plot(station_coor(idx==2,1),station_coor(idx==2,2),'g.','MarkerSize',MarkerSize);
plot(station_coor(idx==3,1),station_coor(idx==3,2),'b.','MarkerSize',MarkerSize);
plot(station_coor(idx==4,1),station_coor(idx==4,2),'k.','MarkerSize',MarkerSize);
plot(station_coor(idx==5,1),station_coor(idx==5,2),'c.','MarkerSize',MarkerSize);
hold off