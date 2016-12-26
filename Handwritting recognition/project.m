prompt = 'Please enter file name: ';
filename = input(prompt,'s');

Xtest = load(filename);
load -ascii handwriting.data;

Y = handwriting(:,1);
X = handwriting(:,3:end);

Xtest = Xtest(:,3:end);

 m = mean(X);
 [coeff score] = princomp(X);

centeredSample = bsxfun(@minus,X,m);
centeredSampleInPCAcoords = centeredSample*coeff;
   

class = knnclassify(centeredSampleInPCAcoords,score,Y,3);
disp(class)
