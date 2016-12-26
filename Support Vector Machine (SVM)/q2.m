function q2
X1 = load('simple1X.data','-ascii');
Y1 = load('simple1Y.data','-ascii');
C = 10;
figure;
title('Learning Phase Sample 1')
hold on;
plot(X1(Y1==1,1),X1(Y1==1,2),'m*');
plot(X1(Y1==-1,1),X1(Y1==-1,2),'gv');
legend('spam','Not spam')
[w, b] = learnsvm(X1,Y1,C);
hold off;
 figure;
title('Final result  Sample 1')
hold on;
plot(X1(Y1==1,1),X1(Y1==1,2),'m*');
plot(X1(Y1==-1,1),X1(Y1==-1,2),'gv');
legend('spam','Not spam')
drawline(w',b);
hold off;
X2 = load('simple2X.data','-ascii');
Y2 = load('simple2Y.data','-ascii');
figure;
title('Learning Phase  Sample 2')
hold on;
plot(X2(Y2==1,1),X2(Y2==1,2),'m*');
plot(X2(Y2==-1,1),X2(Y2==-1,2),'gv');
legend('spam','Not spam')
[w, b] = learnsvm(X2,Y2,C);
hold off;
figure;
title('Final result  Sample 2')
hold on;
plot(X2(Y2==1,1),X2(Y2==1,2),'m*');
plot(X2(Y2==-1,1),X2(Y2==-1,2),'gv');
legend('spam','Not spam')
drawline(w',b);
hold off;
end
