function y = parta()
tic
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

plot( x, DD2)
hold on;
plot( x, DD5)
plot( x, DD10, 'g')
title('part A')
xlabel('Number of points');
ylabel('Average Distance');
legend('2-dimension','5-dimension','10-dimension')
hold off;
toc
