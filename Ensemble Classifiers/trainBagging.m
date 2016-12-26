
function t=trainBagging(X,Y,depth,trees)

t = cell(trees,1);
for i= 1:trees

p = randi(size(X,1),size(X,1),1);
t{i} = traindt(X(p,:),Y(p,:),depth);
end



end