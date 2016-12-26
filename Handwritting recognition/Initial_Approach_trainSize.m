clear;
clc;
load -ascii handwriting.data;
j=1:3;
for j = j
    
    if j==1
    Y = handwriting(1:14000,1);
    X = handwriting(1:14000,3:end);
    end
    
    if j==2
    Y = handwriting(1:28000,1);
    X = handwriting(1:28000,3:end);
    end
    
    if j==3
    Y = handwriting(1:42000,1);
    X = handwriting(1:42000,3:end);
    end
    
    CVError_train = 0;
    CVError_test = 0;
 for i =0:2
    index = mod(1:length(Y),3);
    Xtrain_k = X(index~=i,:);
    Ytrain_k = Y(index~=i);
    Xtest_k = X(index==i,:);
    Ytest_k = Y(index==i);
    TrueLabel_train_k = Ytrain_k;
    TrueLabel_test_k = Ytest_k;
classTrain = knnclassify(Xtrain_k,Xtrain_k,Ytrain_k,3);
classTest = knnclassify(Xtest_k,Xtrain_k,Ytrain_k,3);

misclassified_Train = TrueLabel_train_k(TrueLabel_train_k ~=classTrain);
misclassified_Test = TrueLabel_test_k(TrueLabel_test_k~=classTest);
   

 CVError_train = CVError_train + length(misclassified_Train)/length(TrueLabel_train_k);
 CVError_test =  CVError_test + length(misclassified_Test)/length(TrueLabel_test_k);
 end
CVError_train = CVError_train /3;
CVError_test = CVError_test /3;
Training_Error(j) = CVError_train;
Testing_Error(j) = CVError_test ;
sprintf('Training_Error %d  ', Training_Error)
sprintf('Testing_Error %d ' , Testing_Error)

end

train_size = [14000,28000,42000];
plot(train_size , Training_Error , '-','LineWidth',2);
hold on;
plot(train_size , Testing_Error , '-', 'LineWidth',2);
xlim([14000,42000]);
set(gca,'XTick',14000 : 14000 : 42000);
ylabel('Error rate')
xlabel('Training Set Size')
legend('Train Error','Test Error')
title('Bias-Variance Trade off')


