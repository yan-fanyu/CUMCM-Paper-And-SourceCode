%function jieguo(jieg4,jieg3,pingtai);
clear jieg;
n1=size(jieg4,1);n2=size(jieg3,1);
jieg4(n1+1:n1+n2,:)=jieg3;
[ac,bb]=sort(jieg4(:,1));
jieg(:,1)=ac;
for i=2:5
    jieg(:,i)=jieg4(bb,i);
end
load ju2;
mm1=size(pingtai,2);
mm2=size(jieg,1);
jieg
    for j=1:mm2
        ss(j,:)=[pingtai(jieg(j,1)),min(ju2(pingtai(jieg(j,1)),jieg(j,2)),ju2(pingtai(jieg(j,1)),jieg(j,3)))+ju2(jieg(j,2),jieg(j,3)),j];
    end   
    
for i=1:mm1
    abc=ss(find(ss(:,1)==pingtai(i)),3);
    [S(i,1),lh]=max(ss(find(ss(:,1)==pingtai(i)),2));
    lh1(i)=abc(lh);
    S(i,2:3)=jieg(lh1(i),2:3);
end
S