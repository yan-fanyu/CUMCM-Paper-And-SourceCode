function [S,S1]=mubiao(c,ss);
ss1=ss';
ss1(find(c==0))=0;
S1=max(ss1);
S=sum(S1);