function [t,weight] = traindBoosting(X,Y,depth,trees)

alpha = ones(size(X,1),1);
weight = zeros(trees,1);
t = cell(trees,1);
for i= 1:trees
t{i} = traindtw(X,Y,alpha,depth);
yhat=dt(X,t{i});
a= (Y~=yhat)';
e = (a*alpha )/sum(alpha);
weight(i) = log((1-e)/e);
alpha = alpha .* exp(weight(i) * a');
end

end