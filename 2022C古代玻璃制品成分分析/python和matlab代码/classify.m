function C=classify(Percent)
if ~isnan(Percent(9))
    if Percent(9)>=5.46
        C=2;
        return
    end
    if Percent(9)<5.46
        C=1;
        return
    end
end
if ~isnan(Percent(10))
    if Percent(10)>=3.06
        C=2;
        return
    end
    if Percent(10)<3.06
        C=1;
        return
    end
end
if ~isnan(Percent(12))
    if Percent(12)>=0.155
        C=2;
        return
    end
    if Percent(12)<0.155
        C=1;
        return
    end
end
if Percent(1)<57.11
        C=1;
        return
end
if Percent(1)>=57.11
  if ~isnan(Percent(3))
    if Percent(3)>=0.445
        C=1;
        return
    end
    if Percent(3)<0.445
        C=2;
        return
    end
  end
  if ~isnan(Percent(8))
    if Percent(8)>=0.76
        C=1;
        return
    end
    if Percent(8)<0.76
        C=2;
        return
    end
  end
end
end