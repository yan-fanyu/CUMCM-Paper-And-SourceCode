% time_ditribution_anlyz
clear all;
load bike_record_busy_day.mat
load frequency_anlyz.mat

start_station_total_freq = start_station_day_freq(:,20);
end_station_total_freq = end_station_day_freq(:,20);

[start_sort_freq start_sort_index] = sort(start_station_total_freq,'descend');
[end_sort_freq end_sort_index] = sort(end_station_total_freq,'descend');

max_start = start_sort_index(1);
max_end = end_sort_index(1);

start_time0 = start_time(find(start_station == max_start));
duration_ms = duration_float(find(start_station == max_start));

end_time0 = end_time(find(end_station == max_end));
duration_me = duration_float(find(end_station == max_end));

start_time0 = mod(start_time0,1) * 24;
time_x = 0:0.2:24;
start_time_hist = hist(start_time0,time_x);
figure;
plot(time_x,start_time_hist);
xlim([0 24]);
xlabel('ʱ�䣨Сʱ��');
ylabel('�賵Ƶ��');
title('���賵վ�㣨42�ţ��Ľ賵Ƶ�ηֲ�')


end_time0 = mod(end_time0,1) * 24;
time_x = 0:0.2:24;
end_time_hist = hist(end_time0,time_x);
figure;
plot(time_x,end_time_hist);
xlim([0 24]);
xlabel('ʱ�䣨Сʱ��');
ylabel('����Ƶ��');
title('��󻹳�վ�㣨56�ţ��Ļ���Ƶ�ηֲ�')

duration_ms0 = duration_ms(find(duration_ms<100 & duration_ms>=1));
duration_x = 1.5:1:100;
duration_ms0_hist = hist(duration_ms0,duration_x);
duration_ms0_hist_freq = duration_ms0_hist / length(duration_ms0);
figure;
bar(duration_x,duration_ms0_hist);
xlabel('�û��ó�ʱ�䣨���ӣ�');
xlim([1 100]);
ylabel('Ƶ��');
title('���賵վ�㣨42�ţ����û��ó�ʱ��ֲ�');

duration_me0 = duration_me(find(duration_me<100  & duration_me>=1));
duration_x = 1.5:1:100;
duration_me0_hist = hist(duration_me0,duration_x);
duration_me0_hist_freq = duration_me0_hist / length(duration_me0);
figure;
bar(duration_x,duration_me0_hist);
xlabel('�û��ó�ʱ�䣨���ӣ�');
xlim([1 100]);
ylabel('Ƶ��');
title('��󻹳�վ�㣨56�ţ����û��ó�ʱ��ֲ�');

% start ud calc
lambda = 1/100;
d = duration_x;
pdf_d = lambda * exp( - lambda * d);
pdf_d = pdf_d / sum(pdf_d);
% figure;
% plot(d, pdf_d);

pdf_y = duration_ms0_hist_freq;
pdf_y_d = pdf_y ./ pdf_d;
% figure;
% plot(d, pdf_y_d);

n = 0.01:0.01:100;
cdf_n = normcdf(n);
% figure;
% plot(n,cdf_n);

u_d = zeros(1,99);


for i = 1:99;
    [min_error index] = min(abs(cdf_n - pdf_y_d(i)));
    u_d(i) = index / 100;
end
figure;
plot(d,u_d);
xlabel('�û��ó�ʱ�䣨���ӣ�');
ylabel('Ч�ú���u_0(t)');
title('���賵վ�㣨42�ţ����û��ó�ʱ��Ч�ú���');

% end ud calc
lambda = 1/100;
d = duration_x;
pdf_d = lambda * exp( - lambda * d);
pdf_d = pdf_d / sum(pdf_d);
% figure;
% plot(d, pdf_d);

pdf_y = duration_me0_hist_freq;
pdf_y_d = pdf_y ./ pdf_d;
% figure;
% plot(d, pdf_y_d);

n = 0.01:0.01:100;
cdf_n = normcdf(n);
% figure;
% plot(n,cdf_n);

u_d = zeros(1,99);

for i = 1:99;
    [min_error index] = min(abs(cdf_n - pdf_y_d(i)));
    u_d(i) = index / 100;
end
figure;
plot(d,u_d);
xlabel('�û��ó�ʱ�䣨���ӣ�');
ylabel('Ч�ú���u_0(t)');
title('��󻹳�վ�㣨56�ţ����û��ó�ʱ��Ч�ú���');