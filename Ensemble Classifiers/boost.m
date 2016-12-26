function t = boost(trees, weight, X)
t = zeros(size(X,1),length(weight));
for i = 1:length(weight)
    t(:,i) = dt(X,trees{i});
end
t = t*weight';
end