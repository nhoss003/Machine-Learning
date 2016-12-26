function [W, b] = learnsvm(X,Y,C)
% Niloufar Hosseini Pour
% 861242801
% 10/23/2016
% CS229
% PS3
W = zeros(1 , size(X,2));
b = 0;
m = size(X,1);
stepSize = 1/(C*m);
loss_sum = 1-Y.*(X*W'+b);
L0 = C*sum(loss_sum(loss_sum>0))+ W*W'/2;
while stepSize>1e-6/(C*m)
    
    for i=1:100
        loss_sum = 1-Y.*(X*W'+b);
        mult = -repmat(Y,1,size(X,2)).*X;
        W = W - stepSize* C *( sum(mult(loss_sum>0,:)) + W);
        b = b - stepSize* C * (sum(-1 *Y( loss_sum>0)));
    end
    loss_sum = 1-Y.*(X*W'+b);
   L1 =C*sum(loss_sum(loss_sum>0))+ W*W'/2;
    drawline( W', b);
    
    if L1<L0
        stepSize = stepSize*1.05;
    else
        stepSize = stepSize * 0.5;
    end
   L0 = L1;
end