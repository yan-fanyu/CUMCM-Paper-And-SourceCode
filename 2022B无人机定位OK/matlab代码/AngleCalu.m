function AngD = AngleCalu(RxLoc, TxId, uav_loc)
Angle1 = zeros(size(TxId));
for ii = 1:length(TxId)
    Dir1 = uav_loc(TxId(ii), :) - RxLoc; 
    Dir1 = Dir1 / norm(Dir1);
    Angle1(ii) = (angle(Dir1 * [1;1i]) / pi * 180);
end
Seq2 = nchoosek(1:size(TxId, 2), 2);
AngD = Angle1(Seq2(:, 1)) - Angle1(Seq2(:, 2));
end