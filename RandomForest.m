% ---------------------RANDOM FOREST------------------
%Random Forest Model (RF) 

RF = fitensemble(xtrain,ytrain,'Bag',200,'Tree','Type','classification');
RF_pred = predict(RF,xtest);


%Confusion Matrix 
rf_con_mat = confusionmat(ytest,RF_pred);
disp(rf_con_mat);

% Print Accuracy 
accuracy_rf = (rf_con_mat(1,1) + rf_con_mat(2,2)) /(rf_con_mat(1,1)+rf_con_mat(1,2)+rf_con_mat(2,1)+rf_con_mat(2,2))*100;
disp('Accuracy of Random Forest:')
disp(accuracy_rf);

%Confusion Matrix chart - RF 
figure()
rf_con_mat_chart = confusionchart(ytest,RF_pred);
title('Confusion Matrix: Random Forest')