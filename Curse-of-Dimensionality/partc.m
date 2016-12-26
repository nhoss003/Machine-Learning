function y = partc()
tic
% Copied from part a
x=round(logspace(0,3,10));
DD2 = zeros(1 ,10);
DD5 = zeros(1,10);
DD10 = zeros(1,10);
 index=0;
for m = x
   index= index+1;
    sum2 =0;
    sum5 =0;
    sum10 =0;
   for i = 1:100
       
        A2=randomPartA(m,2);
        A5=randomPartA(m,5);
        A10=randomPartA(m,10);
       sum2 = sum2 + averageDist(A2);
       sum5 = sum5 + averageDist(A5);
       sum10 = sum10 + averageDist(A10);
   end
   DD2(index)= sum2 /100;
   DD5(index )= sum5 /100;
   DD10(index )= sum10 /100;
   
end
% part a finished

% part c started
x=round(logspace(0,3,10));
C_DD2 = zeros(1 ,10);
C_DD5 = zeros(1,10);
C_DD10 = zeros(1,10);
 index=0;
for m = x
   index= index+1;
    sum2 =0;
    sum5 =0;
    sum10 =0;
   for i = 1:100
       
        A2=randomPartC(m,2);
        A5=randomPartC(m,5);
        A10=randomPartC(m,10);
       sum2 = sum2 + averageDist(A2);
       sum5 = sum5 + averageDist(A5);
       sum10 = sum10 + averageDist(A10);
   end
   C_DD2(index)= sum2 /100;
   C_DD5(index )= sum5 /100;
   C_DD10(index )= sum10 /100;
   
end
%part c finished
% drawing plots
plot( x, DD2)
hold on;
plot( x, DD5)
plot( x, DD10, 'g')
plot(x , C_DD2,'b--')
plot(x, C_DD5,'r--')
plot(x, C_DD10, 'g--')
title('part C and part A')
xlabel('Number of points');
ylabel('Average Distance');
legend('2-dimension part a','5-dimension part a','10-dimension part a','2-dimension part c','5-dimension part c','10-dimension part c')
hold off;
toc
