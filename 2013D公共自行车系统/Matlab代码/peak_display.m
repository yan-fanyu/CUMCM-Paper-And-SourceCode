% peak_display
clear all
load busy_peak.mat
fid = fopen('peak_display.txt','w');
for i=1:181
    peak_time = s_peak_time{i};
    if s_peak_amount(i) == 0
        fprintf(fid,'\r\n');
    end
    for j = 1:s_peak_amount(i)
        fprintf(fid,'%d:%02d',floor(peak_time(j)),floor(60 * mod(peak_time(j),1)));
        if j == s_peak_amount(i)
            fprintf(fid,'\r\n');
        else
            fprintf(fid,', ');
        end
    end
end
fprintf(fid,'\r\n');
fprintf(fid,'\r\n');

for i=1:181
    peak_time = e_peak_time{i};
    if e_peak_amount(i) == 0
        fprintf(fid,'\r\n');
    end
    for j = 1:e_peak_amount(i)
        fprintf(fid,'%d:%02d',floor(peak_time(j)),floor(60 * mod(peak_time(j),1)));
        if j == e_peak_amount(i)
            fprintf(fid,'\r\n');
            break;
        else
            fprintf(fid,', ');
        end
    end
end

fclose(fid);
