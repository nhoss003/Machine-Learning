function q1_m_852
D = load('comm.txt','-ascii');
lambda = logspace(-6, -1 , 10);
train_x= D(1:1000, 1:99);
train_y= D(1:1000, 100);

test_x=D(1001:1994,1:99);
test_y=D(1001:1994,100);
[W,stats] = lasso(train_x,train_y,'Lambda',lambda);

Predicted_y_train= train_x * W;
Predicted_y_test= test_x * W;
W0Vector_train = stats.Intercept;


for i=1:10
W0lambda_train(:,i)= ones(1000,1)*W0Vector_train(i);
W0lambda_test(:,i)=ones(994,1)*W0Vector_train(i);
end
for i=1:10
E_train(:,i)=(train_y - (Predicted_y_train(:,i)+ W0lambda_train(:,i))).^ 2;
E_ave_train(i)=sum(E_train(:,i))/1000;

E_test(:,i)=(test_y - (Predicted_y_test(:,i)+ W0lambda_test(:,i))).*(test_y - (Predicted_y_test(:,i)+ W0lambda_test(i)));
E_ave_test(i)=sum(E_test(:,i))/994;
end

semilogx(lambda, E_ave_train)
 hold on
 title ('part a')
 xlabel('lambda')
ylabel('MSE')
semilogx(lambda, E_ave_test)
legend('Training Error','Testing Error')
hold off

figure

for i=1:99
   
   semilogx(lambda, W(i,:));
   hold on
title('part b')
end
set(gca,'xscale','log');
hold off
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear E_train  E_test

Error = zeros(1,10);
Train = D(1:1000, :);
for i= 1:10

    k_test= D((i-1)*100+1:100*i,:);
    k_test_x = k_test(:,1:99);
    k_test_y = k_test(:,100);
    
    m1= Train(1:(100*i - 100),:);
    m2=Train((100*i+1):end,:);
    k_train = vertcat(m1,m2);
    k_train_x= k_train(:,1:99);
     k_train_y= k_train(:,100);
 
[k_w,k_stats]=lasso(k_train_x,k_train_y,'Lambda',lambda);

% % % 

k_Predicted_y_test =  k_test_x * k_w;
W0Vector_train_k = k_stats.Intercept;

for j=1:10
W0lambda_train_k(:,j)=ones(100,1)*W0Vector_train_k(j);
end
for m=1:10

E_test(:,m)=(k_test_y - (k_Predicted_y_test(:,m)+ W0lambda_train_k(:,m))).^ 2;

E_ave_test(m)=sum(E_test(:,m))/100;

 
end

v(i,:)=E_ave_test;

end
for n =1:10
 Error(n)=sum(v(:,n))/10;

end
figure


semilogx(lambda, Error)
 title ('part c')
 xlabel('lambda')
ylabel('MSE')
legend('Cross validation Error')
hold off

end
