function [trees, weight] = Boostt(X,Y,depth, ntrees)
trees = cell(1,length(depth));
weight = zeros(length(depth),ntrees);
alpha = ones(length(Y),length(depth));
for i = depth
    trees{i} = cell(ntrees,1);
end
for m = 1:ntrees
    for i = depth
        trees{i}{m} = traindtw(X,Y,alpha(:,i),i);
        difference = dt(X,trees{i}{m})~=Y;
        err = alpha(:,i)'*(difference)/sum(alpha(:,i));
        weight(i,m) = log((1-err)/err);
        alpha(:,i) = alpha(:,i).*exp(weight(i,m)*difference);
    end
end
end