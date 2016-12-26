function t = bag(trees, X)
t = zeros(size(X,1),1);
for i = 1:size(trees)
    t = t+dt(X, trees{i});
end
end