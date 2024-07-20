% indv_freq_anlyz
clear all;
load bike_record_corrected.mat

start_time_vec = datevec(start_time);
start_day = start_time_vec(:,3);
end_time_vec = datevec(end_time);
end_day = end_time_vec(:,3);

day_user_amount = zeros(1,20);
for i = 1:20;
    user_sn_day = [user_sn(find(start_day == i))
        user_sn(find(end_day == i))];
    day_user_amount(i) = length(unique(user_sn_day));
end

user_sn_sort = sort(user_sn);
user_sn_sort_diff = diff(user_sn_sort);
change_i = find(user_sn_sort_diff~=0);
indv_freq = diff([0;change_i]);
coarse_x = 25:50:639;
coarse_hist = hist(indv_freq,coarse_x);
coarse_hist_freq = coarse_hist / length(indv_freq);
coarse_hist_freq_cum = cumsum(coarse_hist_freq);

indv_freq2 = indv_freq(find(indv_freq<100));
fine_x = 0.5:1:100;
fine_hist = hist(indv_freq2,fine_x);
fine_hist_freq = fine_hist / length(indv_freq2);

figure;
bar(fine_x, fine_hist);
xlabel('借车卡借车次数');
xlim([1 100]);
ylabel('频次');