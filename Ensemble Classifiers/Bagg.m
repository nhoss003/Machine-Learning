function trees = Bagg(X,Y,depth,max)
trees = cell(1,length(depth));

for i = depth
    trees{i} = cell(max,1);
end
for cont = 1:max
    p = randi(length(Y),length(Y),1);
    Xnew = X(p,:);
    Ynew = Y(p);
    for i = depth
        trees{i}{cont} = traindt(Xnew,Ynew,i);
    end
end
end