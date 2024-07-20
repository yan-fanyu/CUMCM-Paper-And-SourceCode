function st_hist_mean_f = mean_filter(start_time_hist,mean_filter_radiu)

st_hist_mean_f = start_time_hist;
% mean_filter_radiu = 1;
for j = 1:length(start_time_hist)
    if j-mean_filter_radiu <1
        mean_range = 1:j+mean_filter_radiu;
    elseif j+mean_filter_radiu > length(start_time_hist)
        mean_range = j-mean_filter_radiu:length(start_time_hist);
    else
        mean_range = j-mean_filter_radiu:j+mean_filter_radiu;
    end
    st_hist_mean_f(j) = mean(start_time_hist(mean_range));
end