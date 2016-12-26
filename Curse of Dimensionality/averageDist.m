function ave = averageDist(x)
[m,n]=size(x);
p1=repmat(permute(x,[1 3 2]),[1 m 1]);
p2=repmat(permute(x,[3 1 2]),[m 1 1]);
diff= p1 - p2;
s =sum(diff.*diff, 3);
D=sqrt(s);
% display(D)
D(D==0)=inf;
minimium= min(D);
s= sum(minimium);
ave= s/m;
% display(ave)