Handwritting recognition
===============================================================================


- Applied Machine Learning algorithms to recognize handwritten English alphabets.
- Built a new approach to improve accuracy and performance.


================================================

There are the following files for my project:	
								
1- project.m 
                                                            
2- Initial_Approach.m 
                                                        
3- Initial_Approach_CVE.m 
                                                      
4- Initial_Approach_trainSize.m

5- Final_Approach.m

6- nn.m


================================================================================


project.m : When you run project.m it asks you for test filename. 
            You have to enter test filename and it displays the classified label by using nearest neighbor classification method.
            So you can compare these labels with your true labels.
			
			
Example for project.m:

Please enter file name: test.data
Then it displays predicted class labels.


Initial_Approach.m : This file is based on handwriting.data file. It considers first 30000 rows as train set and the rest for test set.
                     It runs nearest neighbor classifier on the train and test set or different number of neighbors and calculates test and train error.

Initial_Approach_CVE.m :  This file is same as the previous one except it user K fold cross validation error for computing error 
                          instead of cosidering first 30000 as train set and the rest for test set. 

Initial_Approach_trainSize.m : This file keeps track of train and test error as train set size increases.

Final_Approach.m : This file calculates error by K fold cross validation method after applying PCA on original data.


nn.m : Using neaural network
