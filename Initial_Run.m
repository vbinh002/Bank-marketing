% This script allows us to see what features are important using the Random
% Forest Model & Naive Bayes (benchmark) to get an idea of how much the accuracy is
% without removing any features

%load full data 
data_bench = csvread('Bank_marketing_full.csv',1,0);
[m,n] = size(data_bench);
P = 0.80;
idx = randperm(m);
Training_bench = data_bench(idx(1:round(P*m)),:) ; 
Testing_bench = data_bench(idx(round(P*m)+1:end),:);

% Creating Matrix for Training and Testing Data
xtrain_bench = Training_bench(:,[2:21]); 
ytrain_bench = Training_bench(:,22);

xtest_bench = Testing_bench(:,[2:21]);
ytest_bench = Testing_bench(:,22);

% Random Forest Implementation
RF_bench=fitensemble(xtrain_bench,ytrain_bench,'Bag',200,'Tree','Type','classification');
RF_pred_bench = predict(RF_bench,xtest_bench);
rf_con_mat_bench = confusionmat(ytest_bench,RF_pred_bench);

%Calculating and printing the accuracy  
accuracy_rf_bench = (rf_con_mat_bench(1,1) + rf_con_mat_bench(2,2)) /(rf_con_mat_bench(1,1)+rf_con_mat_bench(1,2)+rf_con_mat_bench(2,1)+rf_con_mat_bench(2,2)) *100;
disp('Accuracy of Random Forest (Benchmark):')
disp(accuracy_rf_bench);

% Calculating the Permutated Predictor Importance
imp = oobPermutedPredictorImportance(RF_bench);

% Plot to show the Importance of features
xtick = {'age';'job';'marital';'education';'default';'housing';'loan';'contact';'month';'day of week';'duration';'campaign';'pdays';'previous';'poutcome';'empvarrate';'conspriceidx';'consconfidx';'euribor3m';'nremployed'};
bar(imp);
set(gca,'xtick',[1:20],'XTickLabel',xtick);
xtickangle(90);

% Naive Bayes Implementation
NB_bench = fitcnb(xtrain_bench,ytrain_bench);
NB_Predict_bench = predict(NB_bench,xtest_bench);
NB_Con_bench = confusionmat(ytest_bench,NB_Predict_bench)
accuracy_NB_bench = (NB_Con_bench(1,1) + NB_Con_bench(2,2)) /(NB_Con_bench(1,1)+NB_Con_bench(1,2)+ NB_Con_bench(2,1)+ NB_Con_bench(2,2)) *100;
disp('Accuracy of Naive Bayes (Benchmark):')
disp(accuracy_NB_bench)