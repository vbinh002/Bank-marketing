% K-Fold Loss on Training Data built using Naive Bayes
Mdl_nb_2 = fitcnb(xtrain,ytrain,'KFold',2);
Mdl_nb_3 = fitcnb(xtrain,ytrain,'KFold',3);
Mdl_nb_4 = fitcnb(xtrain,ytrain,'KFold',4);
Mdl_nb_5 = fitcnb(xtrain,ytrain,'KFold',5);
Mdl_nb_6 = fitcnb(xtrain,ytrain,'KFold',6);
Mdl_nb_7 = fitcnb(xtrain,ytrain,'KFold',7);
Mdl_nb_8 = fitcnb(xtrain,ytrain,'KFold',8);
Mdl_nb_9 = fitcnb(xtrain,ytrain,'KFold',9);
Mdl_nb_10 = fitcnb(xtrain,ytrain,'KFold',10);

%Creating datapoints used for plotting KFold cross validation line graph
k = [2;3;4;5;6;7;8;9;10];
loss_training =1-[kfoldLoss(Mdl_nb_2);kfoldLoss(Mdl_nb_3);kfoldLoss(Mdl_nb_4);
                  kfoldLoss(Mdl_nb_5);kfoldLoss(Mdl_nb_6);kfoldLoss(Mdl_nb_7);
                  kfoldLoss(Mdl_nb_8);kfoldLoss(Mdl_nb_9);kfoldLoss(Mdl_nb_10)];
% Plotting Curve of Kfold validation - 10pints  
figure()
plot(k,loss_training, 'r--o')
title('Naive Bayes k-fold cross validation')
legend('training data')
xlabel('K-Fold Cross Validation');ylabel('Accuracy Rate');
axis([2 10 0.846 0.849])

