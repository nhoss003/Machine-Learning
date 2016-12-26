function weight = BackPropogation_GD(weight, Z, activation, f, Y, eta, lambda)
delta = f-Y;
m = length(Z);
for i = m:-1:1
    if i>1
 nextdelta = sigmoid(activation{i-1}).*sigmoid(1-activation{i-1}).*(delta*weight{i}(:,2:end));
    end
    weight{i} = weight{i} - eta*(delta'*Z{i}+lambda*weight{i});
    delta = nextdelta;
end
end