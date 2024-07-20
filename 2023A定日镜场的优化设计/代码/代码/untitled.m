% 定义不等式方程组
syms x y;
eqns = [x + y <= 5, 2*x - y >= 1];

% 求解方程组
sol = solve(eqns, x, y);

% 判断是否存在解
if isempty(sol)
    disp('方程组无解。');
else
    disp('方程组有解。');
    disp(sol);
end