function Y= mydt(X,t)
m =length(t);
for i=1:m
y(:,i) = dt(X,t{i});
end
% Y = sum(y,2)/m;
%  Y=mode(mode(y)) * ones(size(X,1),1);
Y = sign(sum(y,2))
% Y = sign(sum(y,2)/m)
% Y (y==0)=1;