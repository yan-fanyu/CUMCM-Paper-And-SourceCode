function peak = find_peak(x)
peak0 = [];
peak_cnt = 0;
x_diff = diff(x);
n = length(x); 
x_mid = min(x) + 0.6 * (max(x)-min(x));
for i = 2:n-1
    if x_diff(i-1) >= 0 && x_diff(i) <= 0 && ...
            x_diff(i-1)^2 + x_diff(i)^2 ~=0 && x(i) > x_mid
        peak_cnt = peak_cnt + 1;
        peak0 = [peak0, i];
    end
end
if peak_cnt <= 1
    peak = peak0;
else
    peak_actual_cnt = 1;
    peak = peak0(1);
    peak_set_cnt = 1;
%     new_peak_flag = 0;
    i_peak = 2;
    while i_peak <= peak_cnt
        if abs(peak0(i_peak) - peak(peak_actual_cnt)) < 3
            peak(peak_actual_cnt) = (peak_set_cnt *  peak(peak_actual_cnt) + peak0(i_peak) ) / (peak_set_cnt + 1);
            peak_set_cnt = peak_set_cnt + 1;
        else
            peak_actual_cnt = peak_actual_cnt + 1;
            peak(peak_actual_cnt) = peak0(i_peak);
            peak_set_cnt = 1;
        end
        i_peak = i_peak + 1;
    end
    peak = round(peak);
end
    