% function partaaa
% depth =1;
% trees =10;
function partaaa(depth,trees)
load('class2d.ascii');
X = class2d(:,1:2);
Y = class2d(:,3);
t = cell(trees,1);
for i= 1:trees
% vector =round(79 .* rand (80,1)+ 1);
% newX = X(vector,:);
%newX = datasample(X,80);
p = randi(size(X,1),size(X,1),1);
t{i} = traindt(X(p,:),Y(p,:),depth);
end
% plotclassifier(X,Y,@(X) mydt(X,t),0.5,1);
% for i = 1: 10
plotclassifier(X,Y,@(X) mydt(X,t));
% pause;
% end
end