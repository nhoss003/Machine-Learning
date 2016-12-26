function q3
X = load('spamtrainX.data','-ascii');
Y = load('spamtrainY.data','-ascii');
X_test = load('spamtestX.data');
Y_test = load('spamtestY.data');
C = logspace (-2 , 2, 20);
m = length(C);
Error = zeros(1, m);

 tic
for i=1: m
[w , b ] =  qplearnsvm(X,Y,C(i));
Y_hat= X_test * w+ b;
Error(i) = sum ( (Y_test .* Y_hat)< 0)/length(Y_test);
end

crossValidationError = zeros(3, m);
for k = 1:3

    k_test_x = X((k-1)*1000+1:1000*k,:);
   
    m1= X(1:(1000*k - 1000),:);
    m2= X((1000*k+1):end,:);
    k_train_x = vertcat(m1,m2);

    k_test_y = Y((k-1)*1000+1:1000*k,:);
    m3= Y(1:(1000*k - 1000),:);
    m4= Y((1000*k+1):end,:);
    k_train_y =  vertcat(m3,m4);
     
     for i= 1: m
     [w , b ] =  qplearnsvm( k_train_x,k_train_y,C(i));

      Y_hat=  k_test_x* w+ b;

      numerator = sum ( (k_test_y  .* Y_hat)< 0);
     crossValidationError(k,i) = (numerator / length(k_test_y));

     end
     
end

CVE = sum(crossValidationError)/3;
    
toc
[resultAccuracy, index]= min(CVE);
bestC= C(index);
figure
hold on
str = sprintf('Best C = %f , and the resulting testing accuracy = %f',bestC,resultAccuracy);
title(str);
semilogx(C, Error, 'm');
semilogx(C, CVE, 'g');
xlabel('C');
ylabel('Error')
set(gca, 'xscale', 'log');
legend('General Error Rate', ' Cross Validation Error Rate');
hold off
end
