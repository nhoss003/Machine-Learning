function ps7
% Niloufar Hosseini Pour
% 861242801
% 12/1/2016
% CS229
% PS7
load('spamtrain.ascii');
Xtrain = spamtrain(:,1:end-1);
Ytrain = spamtrain(:,end);
load('spamtest.ascii');
Xtest = spamtest(:,1:end-1);
Ytest = spamtest(:,end);
mm=length(Ytest);
trees = floor(logspace(0,2+log10(5),10));
n =length(trees);
E3 = zeros(3,n);
E4 = zeros(3,n);
lambdas=logspace(-4,-1,10);
depth=2;
newtree=trees(end);
tic
for i= 1:newtree
p = randi(size(Xtrain,1),size(Xtrain,1),1);
treeBag{i} = traindt(Xtrain(p,:),Ytrain(p,:),depth);
end
for i=1:newtree
 
    bagReweight(:,i) = dt(Xtest,treeBag{i});
 
end
 
[treeBoost,wBoost] = traindBoosting(Xtrain,Ytrain,2,newtree);
  
for i=1:newtree
 
    boostReweight(:,i) = wBoost(i)*dt(Xtest,treeBoost{i});
 
end
 for i = 1:length(lambdas)
 
    [w, stats] = lassoglm(bagReweight,Ytest==1,'binomial','Standardize',0 ,'Lambda', lambdas(i) ) ;
 
    wBag(:,i) = 2*w;
 
    w0Bag(:,i) = 2* stats.Intercept-1;
 
 end 

for i = 1:length(lambdas)
 
    [w, stats] = lassoglm(boostReweight,Ytest==1,'binomial','Standardize',0 ,'Lambda', lambdas(i) ) ;
 
    wBoost(:,i) = 2*w; 
 
    w0Boost(:,i) = 2* stats.Intercept-1; 
 
 end 
YBagReweight = bagReweight*wBag+repmat(w0Bag,size(bagReweight,1),1);
 
YBoostReweight = boostReweight*wBoost+repmat(w0Boost,size(boostReweight,1),1);

Y_test_rep = repmat(Ytest,1,10);

bag_reweight_error = sum(sign(YBagReweight)~=sign(Y_test_rep))/size(Ytest,1);
 
boost_reweight_error = sum(sign(YBoostReweight)~=sign(Y_test_rep))/size(Ytest,1);
 
nonzeroWBag = sum(wBag~=0,1);
 
nonzeroWBoost = sum(wBoost~=0,1);

max = trees(end);

depth = [1,2];

bT = Bagg(Xtrain,Ytrain,depth, max);

[boostT, boostW]= Boostt(Xtrain,Ytrain,depth,max);

for j =  [1,2]
    count = 1;
    bag22 = zeros(mm,1);
    boost22 = zeros(mm,1);
    for i = 1:n
        
        bag22 = bag22+bag(bT{j}(count:trees(i)),Xtest);
        
        boost22 = boost22 + boost(boostT{j}(count:trees(i)),boostW(j,count:trees(i)),Xtest);
        
        count = trees(i)+1;
        
        E3(j, i) = sum(sign(Ytest)~=sign(bag22))/mm;
       
        E4(j, i) = sum(sign(Ytest)~=sign(boost22))/mm;
    end
end

figure
semilogx(trees, E3(2,:),'-');
hold on;
semilogx(trees, E4(2,:),'-');
semilogx(nonzeroWBag,bag_reweight_error ,'-');
semilogx(nonzeroWBoost,boost_reweight_error ,'-');
legend('Bagging Testing Error', 'Boosting Testing Error','bagging reweighted Error','boosting reweighted Error');
xlabel('trees');
ylabel('Error');
hold off;
toc
end
