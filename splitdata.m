
% Load full dataset with features removed 
data = csvread('Bank_optimised.csv',1,0);

% split data to training set and testing set.
[m,n] = size(data) ;
P = 0.80 ;
idx = randperm(m)  ;
Training = data(idx(1:round(P*m)),:) ; 
Testing = data(idx(round(P*m)+1:end),:);

% Creating Matrix for Training and Testing Data
xtrain = Training(:,[2:16]); 
ytrain = Training(:,17);

xtest = Testing(:,[2:16]);
ytest = Testing(:,17);

