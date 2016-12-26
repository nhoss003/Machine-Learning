function q2_continue
% Niloufar Hosseini Pour
% 861242801
% 10/31/2016
% CS229
% PS4
example2 = load('example2.data','-ascii');
A = example2(:,1:2);
B = example2(:,3);
function Y = myclassifier(A,w,b)
	Y = A*w' + b;
end
figure
subplot
subplot(3,3,1)

[alpha,b] = learnsvm(A,B,0.1, @(A,B) A*B');
display(alpha)
display(b)
 alphaB = alpha.*B;
 w = sum ( repmat(alphaB,1,2).* A );
 
plotclassifier(A,B,@(A) myclassifier(A,w,b));
title('linear kernel C = 0.1')
subplot(3,3,2)

[alpha,b] = learnsvm(A,B,1, @(A,B) A*B');
display(alpha)
display(b)
 alphaB = alpha.*B;
 w = sum ( repmat(alphaB,1,2).* A );
plotclassifier(A,B,@(A) myclassifier(A,w,b));
title('linear kernel C = 1')
subplot(3,3,3)

[alpha,b] = learnsvm(A,B,10, @(A,B) A*B');
display(alpha)
display(b)
 alphaB = alpha.*B;
 w = sum ( repmat(alphaB,1,2).* A );
plotclassifier(A,B,@(A) myclassifier(A,w,b));
title('linear kernel C = 10')
subplot(3,3,4)

[alpha,b] = learnsvm(A,B,0.1, @(A,B) (A*B' + 1).^2);
display(alpha)
display(b)
 alphaB = alpha.*B;
 w = sum ( repmat(alphaB,1,2).* A );
plotclassifier(A,B,@(A) myclassifier(A,w,b));
title('polynomial C =0.1 ')

subplot(3,3,5)

[alpha,b] = learnsvm(A,B,1, @(A,B) (A*B' + 1).^2);
display(alpha)
display(b)
 alphaB = alpha.*B;
 w = sum ( repmat(alphaB,1,2).* A );
plotclassifier(A,B,@(A) myclassifier(A,w,b));
title('polynomial  C =1 ')
subplot(3,3,6)

[alpha,b] = learnsvm(A,B,10, @(A,B) (A*B' + 1).^2);
display(alpha)
display(b)
 alphaB = alpha.*B;
 w = sum ( repmat(alphaB,1,2).* A );
plotclassifier(A,B,@(A) myclassifier(A,w,b));
title('polynomial C =10')

subplot(3,3,7)

[alpha,b] = learnsvm(A,B,0.1, @(A,B) (A*B' + 1).^5);
display(alpha)
display(b)
 alphaB = alpha.*B;
 w = sum ( repmat(alphaB,1,2).* A );
plotclassifier(A,B,@(A) myclassifier(A,w,b));
title('polynomial C =0.1')
subplot(3,3,8)

[alpha,b] = learnsvm(A,B,1, @(A,B) (A*B' + 1).^5);
display(alpha)
display(b)
 alphaB = alpha.*B;
 w = sum ( repmat(alphaB,1,2).* A );
plotclassifier(A,B,@(A) myclassifier(A,w,b));
title('polynomial  C = 1')
subplot(3,3,9)

[alpha,b] = learnsvm(A,B,10, @(A,B) (A*B' + 1).^5);
display(alpha)
display(b)
 alphaB = alpha.*B;
 w = sum ( repmat(alphaB,1,2).* A );
plotclassifier(A,B,@(A) myclassifier(A,w,b));
title('polynomial  C = 10')
% % % % % % % % % % % % % % % % % % % % % % % % % 


x=A(:,1);
xx=A(:,2);
figure

subplot
title('Gaussian kernel')
subplot(3,3,1)
sigma = 1;
[alpha,b] = learnsvm(A,B,0.1, @(A,B) exp(-((x - xx)'*(x - xx))/ 2*(sigma^2)));
display(alpha)
display(b)
 alphaB = alpha.*B;
 w = sum ( repmat(alphaB,1,2).* A );
plotclassifier(A,B,@(A) myclassifier(A,w,b));
title('linear kernel C = 0.1')
subplot(3,3,2)
[alpha,b] = learnsvm(A,B,1, @(A,B) exp(-((x - xx)'*(x - xx))/ 2*(sigma^2)));
display(alpha)
display(b)
 alphaB = alpha.*B;
 w = sum ( repmat(alphaB,1,2).* A );
plotclassifier(A,B,@(A) myclassifier(A,w,b));
title('linear kernel C = 1')
subplot(3,3,3)
[alpha,b] = learnsvm(A,B,10, @(A,B) exp(-((x - xx)'*(x - xx))/ 2*(sigma^2)));
display(alpha)
display(b)
 alphaB = alpha.*B;
 w = sum ( repmat(alphaB,1,2).* A );
plotclassifier(A,B,@(A) myclassifier(A,w,b));
title('linear kernel C = 10')
subplot(3,3,4)
sigma = 5;
[alpha,b] = learnsvm(A,B,0.1, @(A,B) exp(-((x - xx)'*(x - xx))/ 2*(sigma^2)));
display(alpha)
display(b)
 alphaB = alpha.*B;
 w = sum ( repmat(alphaB,1,2).* A );
plotclassifier(A,B,@(A) myclassifier(A,w,b));
title('polynomial C = 0.1')

subplot(3,3,5)

[alpha,b] = learnsvm(A,B,1, @(A,B) exp(-((x - xx)'*(x - xx))/ 2*(sigma^2)));
display(alpha)
display(b)
 alphaB = alpha.*B;
 w = sum ( repmat(alphaB,1,2).* A );
plotclassifier(A,B,@(A) myclassifier(A,w,b));
title('polynomial C = 1')
subplot(3,3,6)

[alpha,b] = learnsvm(A,B,10, @(A,B) exp(-((x - xx)'*(x - xx))/ 2*(sigma^2)));
display(alpha)
display(b)
 alphaB = alpha.*B;
 w = sum ( repmat(alphaB,1,2).* A );
plotclassifier(A,B,@(A) myclassifier(A,w,b));
title('polynomial C = 10')

subplot(3,3,7)
sigma = 10;
[alpha,b] = learnsvm(A,B,0.1, @(A,B) exp(-((x - xx)'*(x - xx))/ 2*(sigma^2)));
display(alpha)
display(b)
 alphaB = alpha.*B;
 w = sum ( repmat(alphaB,1,2).* A );
plotclassifier(A,B,@(A) myclassifier(A,w,b));
title('polynomial C = 0.1')
subplot(3,3,8)

[alpha,b] = learnsvm(A,B,1, @(A,B) exp(-((x - xx)'*(x - xx))/ 2*(sigma^2)));
display(alpha)
display(b)
 alphaB = alpha.*B;
 w = sum ( repmat(alphaB,1,2).* A );
plotclassifier(A,B,@(A) myclassifier(A,w,b));
title('polynomial C = 1')
subplot(3,3,9)

[alpha,b] = learnsvm(A,B,10, @(A,B) exp(-((x - xx)'*(x - xx))/ 2*(sigma^2)));
display(alpha)
display(b)
 alphaB = alpha.*B;
 w = sum ( repmat(alphaB,1,2).* A );
plotclassifier(A,B,@(A) myclassifier(A,w,b));
title('polynomial C = 10')
end