function partc
% Niloufar Hosseini Pour
% 861242801
% 11/18/2016
% CS229
% PS6
load('spamtrain.ascii');
Xtrain = spamtrain(:,1:end-1);
Ytrain = spamtrain(:,end);
load('spamtest.ascii');
Xtest = spamtest(:,1:end-1);
Ytest = spamtest(:,end);
m = length(Ytrain);
mm=length(Ytest);
 trees = floor(logspace(0,3,10));
% trees = [1,2]
n =length(trees);
E1 = zeros(3,n);
E2 = zeros(3,n);
E3 = zeros(3,n);
E4 = zeros(3,n);
max = trees(end);
depth = [1,2,3];
bT = Bagg(Xtrain,Ytrain,depth, max);

[boostT, boostW]= Boostt(Xtrain,Ytrain,depth,max);

for j =  [1,2,3]
    count = 1;
    bag2 = zeros(m,1);
    boost2 = zeros(m,1);
    bag22 = zeros(mm,1);
    boost22 = zeros(mm,1);
    
    for i = 1:n
        
        bag2 = bag2+bag(bT{j}(count:trees(i)),Xtrain);
        bag22 = bag22+bag(bT{j}(count:trees(i)),Xtest);
        
        boost2 = boost2 + boost(boostT{j}(count:trees(i)),boostW(j,count:trees(i)),Xtrain);
        boost22 = boost22 + boost(boostT{j}(count:trees(i)),boostW(j,count:trees(i)),Xtest);
        
        count = trees(i)+1;
        
        E1(j, i) = sum(sign(Ytrain)~=sign(bag2))/m;
        E3(j, i) = sum(sign(Ytest)~=sign(bag22))/mm;
        E2(j, i) = sum(sign(Ytrain)~=sign(boost2))/m;
        E4(j, i) = sum(sign(Ytest)~=sign(boost22))/mm;
    end
end

figure(1)
for j = depth
    h=semilogx(trees, E1(j,:),'--');
     set(h(1),'linewidth',j);
    hold on;
    hh=semilogx(trees, E3(j,:),'-');
    set(hh(1),'linewidth',j);
end
title('Bagging');
legend('j=1 TrainingError','depth=1 TestingError','depth=2 TrainingError','depth=2 TestingError','depth=3 TraininsgError','depth=3 TestingError');
xlabel('trees');
ylabel('Error');
hold off;

figure(2)
for j = depth
    h=semilogx(trees, E2(j,:),'--');
   set(h(1),'linewidth',j); 
    hold on;
    hh=semilogx(trees, E4(j,:),'-');
    set(hh(1),'linewidth',j);
end
title('Boosting');
legend('depth=1 TrainingError','depth=1 TestingError','depth=2 TrainingError','depth=2 TestingError','depth=3 TraininsgError','depth=3 TestingError');
xlabel('trees');
ylabel('Error');
hold off;
end