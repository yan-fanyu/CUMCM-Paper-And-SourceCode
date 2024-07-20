function [first_step_num, m, sec_step_num,n] = AHP(N)
% output: 
% first_step_num = a vector of the number of CNC that perform 1st step
% m = how many CNC of 1st step
% sec_step_num = a vector of the number of CNC that perform 2nd step
% n = how many CNC of 2nd step
% input: 
% n = 1, 2 or 3, specifies which set of parameters you would like to use
first_step_num = zeros(1,4);
sec_step_num = zeros(1,4);
m = 0; n = 0;
if N == 1
    a1 = 400;  % time for 1st step
    a2 = 378;  % time for 2nd step
    odd = 28;  
    even = 31;
elseif N == 2
    a1 = 280;
    a2 = 500;
    odd = 30;
    even = 35;
elseif N==3
    a1 = 455;
    a2 = 182;
    odd = 27;
    even = 32;
else disp('invalid input');
end

for ii = 1:8
    if  mod(ii,2) == 0
        a3 = even;
    else
        a3 = odd;
    end
    % A = [a1/a1, a1/a2, a1/a3; a2/a1, a2/a2, a2/a3; a3/a1, a3/a2, a3/a3];
    a1 = a1 * 1.1;
    A = [a1/a1, a2/a1, a3/a1; a1/a2, a2/a2, a3/a2; a1/a3, a2/a3, a3/a3];
    [V,lambda] = eig(A);
    CI  = (lambda(1,1) - 3)/(3 - 1);
    CR = CI / 0.58
    w = V(:,1)
    score = [a1,0,a3; 0,a2,a3]*w ./ normest(w);
    score1 = score(1)/sum(score);
    score2 = score(2)/sum(score);
    fprintf('score1 = %10.8f\n',score1);
    fprintf('score2 = %10.8f\n',score2);
    fprintf('score1-score2 = %30.29f\n',score(1)-score(2));
    if score(1) > score(2) 
        first_step_num(m+1) = ii;
        m = m + 1;
    else
        sec_step_num(n+1) = ii;
        n = n + 1;
    end
end



end
    
    