function  third

x1 = 2*rand(1,1000)-1;
c = 0.5 * ones(1,1000);
y = tan(pi * x1 /3) + (x1 - c).^ 2;
% 
figure;
 
plot(x1,y,'k.','LineWidth',200)
title('lambda = 10')
ylim([-0.5,4.5])
xlim([-1,1])
hold on
for m =1:1000
x = 2*rand(10,1)-1;
x_0= x.^ 0;
x_1= x.^ 1;
x_2= x.^ 2;
x_3= x.^ 3;
x_4= x.^ 4;
x_5= x.^ 5;

Train_x = horzcat(x_0,x_1,x_2,x_3,x_4,x_5);
% d = 0.5 * ones(1,6);
% for i=1:10
% train_y(i) = tan(pi * train_x(i,:) /3) + (train_x(i,:) - d).^ 2 + (0.5 * randn(1,6));
% end
x2=x';
vx(:,m)=x2;
c2 =  0.5 * ones(1,10);
y2 = tan(pi * x2 /3) + (x2 - c2).^ 2 + 0.5 * randn(1,10);
lambda= 10;
lambdaeye= eye(6,6)*lambda;

w=inv((Train_x)'* (Train_x) + lambdaeye)*(Train_x)'*(y2)';
v(:,m)=w;
end
x3 =2*rand(100,1)-1;
x3_0= x3.^ 0;
x3_1= x3.^ 1;
x3_2= x3.^ 2;
x3_3= x3.^ 3;
x3_4= x3.^ 4;
x3_5= x3.^ 5;
Train_x3 = horzcat(x3_0,x3_1,x3_2,x3_3,x3_4,x3_5);
yhat= v' * (Train_x3)';
red = yhat(1:100,:);

for n =1:100
    summ(n) = sum(yhat(:,n));
    ave(n) = summ(n)/1000;
end
plot(x3', red, 'r.', 'LineWidth',500)
plot(x3', ave, 'b.', 'LineWidth',500)
% ylim([-0.5,4.5])
% xlim([-1,1])
hold off
end
