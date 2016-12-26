function q1

Data = load('class2d.ascii');
X = Data(:,1:2);
Y = Data(:,3);
Num = 1;
for layer = [2,3]
    for units = [1,5,20]
       for lambda = [0.001, 0.01, 0.1] 
           [weight, loss] = nn(X,Y,layer, units,lambda);
           for i = 2:5
               [weightNew, lossNew] = nn(X,Y,layer, units,lambda);
               if lossNew<loss
                   loss = lossNew;
                   weight = weightNew;
               end
           end
           f = figure(Num);
           plotclassifier(X,Y,@(X) forwardPropogation(weight,X),0.5,1);
           title(sprintf('#layer = %g, #hidden = %g, lambda = %g', layer, units, lambda));
           print(f,'-depsc');
           Num = Num + 1;
       end
    end
end
end
