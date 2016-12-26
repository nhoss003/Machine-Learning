function [weight, loss] = nn( X, Y, layer, units, lambda)
weight = cell(layer,1);
weight= randWeights(weight,units , layer);
[f,Z,activation] = forwardPropogation(weight, X);
loss = lossFunction(f,Y,lambda,weight);

eta = 1;
condition = true;
while condition
    newWeight = BackPropogation_GD(weight,Z,activation,f,Y,eta, lambda);
    [newf,newZ,newActivation] = forwardPropogation(newWeight, X);
    newloss = lossFunction(newf,Y,lambda,newWeight);
    condition = abs((loss-newloss))>(loss * 1e-8);
    
    if newloss>loss
        eta = eta*0.05;
    else
        eta = eta*1.05;
        weight = newWeight;
        f = newf;
        Z = newZ;
        activation = newActivation;
        loss = newloss;
    end
end
end