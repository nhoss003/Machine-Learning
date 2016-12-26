
function loss = lossFunction(f, y, lambda, weight)

regulation = 0;
for i = 1:length(weight)
    regulation = regulation + sum(sum(weight{i}.*weight{i}));
end

y1 = 1-y;
f1 = 1-f;
condition1= (f~=0 | y==1);
condition2= (f~=1 | y1==1);
%  l = -Y'*log(z2) + ((1-Y)'* log(1 -z2) ) +  lambda * (sum(sum(wold1.*wold1))+sum(wold2.*wold2)) ;
los = -(y(condition1)'*log(f(condition1))+y1(condition2)'*log(f1(condition2)));
%  los= -y'*log(f(f~=0)) + ((1-y)'* log((1 - f)((l-f)~=0)));

loss = los+lambda*regulation;
end