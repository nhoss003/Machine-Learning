function [f,Z,activation] = forwardPropogation(weight, X)
layer = length(weight);
Z = cell(layer,1);
activation = cell(layer,1);
f = X;
for i = 1:layer
    Z{i} = [ones(size(f,1),1), f];
    activation{i} = Z{i}*weight{i}';
    f = sigmoid(activation{i});
end
end