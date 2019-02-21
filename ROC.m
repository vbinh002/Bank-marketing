% ROC CURVE FOR NAIVE BAYES

%To get the ytrain object into an appropriate format for ROC curve 
y_train_class = cellstr(num2str(ytrain));

%To get get y_train_class into the logical class 
y_resp = strcmp(y_train_class ,'1');

%Computing the Posterior Probabilites for Naive Bayes 
[~,score_nb] = resubPredict(Mdl_nb);

%Compute the standard ROC curve using the scores from the naive Bayes classification
[X_nb,Y_nb,T_nb,AUCnb] = perfcurve(y_resp,score_nb(:,2),'true');

% ROC CURVE FOR RANDOM FOREST
%Computing the Posterior Probabilites
[~,score_rf] = oobPredict(RF);

%Compute the standard ROC curve using the scores for Random Forests
%(using the same y_resp calculated before)
[fpr,tpr,T_rf,AUCrf] = perfcurve(y_resp,score_rf(:,2),'true');

% Plotting the ROC curve 
figure()
plot(X_nb,Y_nb);
hold on
plot(fpr,tpr);
legend('Naive Bayes','Random Forest')
xlabel('False positive rate'); ylabel('True positive rate');
title('ROC Curve for Naive Bayes Classification and Random Forests');
hold off


