% -----------NAIVE BAYES --------------------------
%Model based on Naive Bayes 
Mdl_nb = fitcnb(xtrain,ytrain)

%error rate
isGenRate = resubLoss(Mdl_nb,'LossFun','ClassifErr')

%Output classification
naive_label = predict(Mdl_nb,xtest);

%Confusion Matrix 
nb_con_mat = confusionmat(ytest,naive_label);
disp('Confusion Matrix: Naive Bayes')
disp(nb_con_mat)

%Print Naive Bayes Accuracy
accuracy_nb = (nb_con_mat(1,1) + nb_con_mat(2,2)) /(nb_con_mat(1,1)+nb_con_mat(1,2)+nb_con_mat(2,1)+nb_con_mat(2,2)) *100;
disp('Accuracy of naive Bayes:')
disp(accuracy_nb)

%Confusion Matrix chart Naive Bayes 
nb_con_mat_chart = confusionchart(ytest,naive_label);
title('Confusion Matrix: Naive Bayes')



