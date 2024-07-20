% duration_distribution_anlyz
clear all;
load bike_record_corrected.mat
min_duration = min(duration_float);
max_duration = max(duration_float);
min_duration_sec = min_duration * 60;
max_duration_sec = max_duration * 60;
max_duration_day = floor(max_duration_sec / 24 / 3600); 
max_duration_sec = mod(max_duration_sec,24 * 3600);
max_duration_hour = floor(max_duration_sec / 3600); 
max_duration_sec = mod(max_duration_sec, 3600);
max_duration_min = floor(max_duration_sec / 60); 
max_duration_sec = mod(max_duration_sec, 60);
coarse_x = 50:100:max_duration;
coarse_hist = hist(duration_float,coarse_x);
coarse_hist_freq = coarse_hist / length(duration);
coarse_hist_freq_cum = cumsum(coarse_hist_freq);

duration2 = duration_float(find(duration_float < 100 & duration_float >= 1));
fine_x = 1.5:1:100;
fine_hist = hist(duration2,fine_x);
fine_hist_freq = fine_hist / length(duration2);

duration2_std = std(duration2);
mean_duration2 = mean(duration2);

figure;
bar(fine_x, fine_hist);
xlabel('用户用车时间（分钟）');
xlim([1 100]);
ylabel('频次');

lambda = 1/100;
d = fine_x;
pdf_d = lambda * exp( - lambda * d);
pdf_d = pdf_d / sum(pdf_d);
figure;
plot(d, pdf_d);
xlabel('用户需要出行的时间（分钟）');
ylabel('密度函数p(T=t)');

pdf_y = fine_hist_freq;
pdf_y_d = pdf_y ./ pdf_d;
% figure;
% plot(d, pdf_y_d);

n = 0.01:0.01:1000;
% n = 0:0.01:5;
cdf_n = normcdf(n);
figure;
plot(cdf_n,n);
xlabel('x');
ylabel('正态累计分布的反函数Q^{-1}(x)');

u_d = zeros(1,99);

for i = 1:99;
    [min_error index] = min(abs(cdf_n - pdf_y_d(i)));
    u_d(i) = index / 100;
end
figure;
plot(d,u_d);
xlabel('用户用车时间（分钟）');
ylabel('效用函数u_0(t)');