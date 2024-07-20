% 该函数用于求无人机距准确位置的绝对距离
function Dis = DisCal(correct, incorrect)

Dis = norm(correct - incorrect);

end
