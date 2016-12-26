function Y=mydt2(weight, t, X)
m =length(t);
% Y = zeros(size(X,1),1);
for i=1:m
% Y = Y+weight(i)* dt(X,t{i});
y(:,i) = weight(i)* dt(X,t{i});
end
Y = sign(sum(y,2));
end