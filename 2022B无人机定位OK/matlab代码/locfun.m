function Loc = locfun(AngRec, TxIdE, uav_loc, Loca)

angleAd = [0:0.5:360];
for ii = 1:length(angleAd)
    Angz = 180 + AngRec(1) - (angleAd(ii) + 60);
    Dis = abs(50 / sind(AngRec(1)) * sind(Angz));
    LocS = [-sind(angleAd(ii) + Loca) -cosd(angleAd(ii) + Loca)] * Dis + uav_loc(TxIdE(2),:);
    
    ResZ(ii,:) = LocS;
    AngD = AngleCalu(LocS, TxIdE, uav_loc);
    Err(ii) = sum(sum([abs(AngRec - AngD)]));
end
% Îó²î×îÐ¡Öµ
[~,Ind] = min(Err);
Loc = squeeze(ResZ(Ind,:));

end