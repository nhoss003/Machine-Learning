function partb
% Niloufar Hosseini Pour
% 861242801
% 11/18/2016
% CS229
% PS6
load('class2d.ascii');
X = class2d(:,1:2);
Y = class2d(:,3);
for depth=[1,2,3]
    i =0;
    figure
    subplot
    for trees =[1,10,100,1000]
       i = i+1;
        subplot(2,2,i);
       [t,weight]=traindBoosting(X,Y,depth,trees);
       plotclassifier(X,Y,@(X) mydt2(weight, t, X));
         title(sprintf('depth = %g, trees = %g', depth, trees));
    end
end

end