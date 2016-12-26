clear;
clc;
load -ascii handwriting.data;

Y = handwriting(:,1);
X = handwriting(:,3:end);

k = 1:2:7;
j=1;
for k=k
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
classTrain(:,j) = knnclassify(Xtrain_k,Xtrain_k,Ytrain_k,k);
classTest(:,j) = knnclassify(Xtest_k,Xtrain_k,Ytrain_k,k);

misclassified_Train = TrueLabel_train_k(TrueLabel_train_k ~=classTrain(:,j));
misclassified_Test = TrueLabel_test_k(TrueLabel_test_k~=classTest(:,j));
   

 CVError_train = CVError_train + length(misclassified_Train)/length(TrueLabel_train_k);
 CVError_test =  CVError_test + length(misclassified_Test)/length(TrueLabel_test_k);
 end
CVError_train = CVError_train /3;
CVError_test = CVError_test /3;
Training_Error(j) = CVError_train;
Testing_Error(j) = CVError_test ;
sprintf('Training_Error %d  ', Training_Error)
sprintf('Testing_Error %d ' , Testing_Error)
j=j+1;
end


plot(k, Training_Error , '-','LineWidth',2);
hold on;
plot(k, Testing_Error , '-', 'LineWidth',2);
xlim([1,7]);
set(gca,'XTick',1 : 2 : 7);
ylabel('Error')
xlabel('K (# of neighbors considered)')
legend('Train Error','Test Error')
title('Bias-Variance Trade off')


