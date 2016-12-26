clear;
clc;
load -ascii handwriting.data;

Ytrain = handwriting(1:30000,1);
Xtrain = handwriting(1:30000 , 3:end);

Xtest = handwriting(30001:end , 3:end);

TrueLabel_train = Ytrain;
TrueLabel_test = handwriting(30001:end,1);

% CLASS = knnclassify(SAMPLE,TRAINING,GROUP,K)
k = 1:2:25;
j=1;
for i=k
 
classTrain(:,j) = knnclassify(Xtrain,Xtrain,Ytrain,i);
classTest(:,j) = knnclassify(Xtest,Xtrain,Ytrain,i);


% sprintf('TrueLabel_train %d \n',TrueLabel_train)
% sprintf('classTrain %d \n',classTrain)
% sprintf('TrueLabel_test %d \n',TrueLabel_test)
% sprintf('classTest %d \n',classTest)
misclassified_Train = TrueLabel_train(TrueLabel_train~=classTrain(:,j));
misclassified_Test = TrueLabel_test(TrueLabel_test~=classTest(:,j));

Training_Error(j) = length(misclassified_Train)/length(TrueLabel_train);
Testing_Error(j) = length(misclassified_Test)/length(TrueLabel_test);
sprintf('Training_Error %d  ', Training_Error)
sprintf('Testing_Error %d ' , Testing_Error)
j=j+1;
end

plot(k, Training_Error , '-','LineWidth',2);
hold on;
plot(k, Testing_Error , '-', 'LineWidth',2);
xlim([1,25]);
set(gca,'XTick',1 : 2 : 25);
ylabel('Error')
xlabel('Number of K')
legend('Train Error','Test Error')
title('Bias-Variance Trade off')