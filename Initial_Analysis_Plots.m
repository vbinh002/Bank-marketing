% Initial Analysis Plots 
% Original data to produce Initial Analysis
data_original = readtable('Bank-additional-full.csv');

%Plots Boxplot - classification vs age
boxplot(data_original.age,data_original.y);
xlabel('Classification'); ylabel('Age');
title('Classification(y/n) vs Age');

%Histogram - eployment variation rate
figure()
histogram(data_original.emp_var_rate);
xlabel('Emp var rate'); ylabel('Frequency');
title('Histogram of employment variation rate');

%Histogram - last contact duration
figure() 
histogram(data_original.duration);
xlabel('Duration');ylabel('Frequency');
title('Histogram of last contact duration');