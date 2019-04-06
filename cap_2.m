%% Fault: Cap Missing
str = 'TrainingData/';
fault_6 = '6-CapMissing/capmissing-image';
normal = 'Normal/normal-image';

ext = '.jpg';

image_names = string(zeros(1,9));
fault_result = zeros(2,9);
normal_result = zeros(2,9);

%% Finding the sum of the missing cap bottles:

for i = 1:9
    image_names(i)= strcat(fault_6,string(i),ext);
    file_path = strcat(str,image_names(i));
    image = imread(char(file_path));
    [fault_result(1,i),fault_result(2,i)] = cap_test(image);
end

%% Finding the sum of the cap present bottles:
for i = 1:24
    image_names(i)= strcat(normal,string(i),ext);
    file_path = strcat(str,image_names(i));
    image = imread(char(file_path));
    [normal_result(1,i),normal_result(2,i)] = cap_test(image);
end

normal_result = normal_result';
fault_result = fault_result';

%% Plotting the results:
mean_fault = mean(fault_result(:,2));
mean_normal = mean(normal_result(:,2));

plot(1:9,fault_result(:,2));
hold on
plot(1:24,normal_result(:,2));
hold on
XL = xlim();
plot(XL, [mean_fault mean_fault], 'c--')
hold on
plot(XL, [mean_normal mean_normal], 'g--')
hold on
mu = 1175000;
hline = refline([0 mu]);
hline.Color = 'r';
title('Comparison of Faulty and Normal Cropped Intensity Summations');
xlabel('Image Number') 
ylabel('Summation of Intensity Levels of Cropped Region') 
legend({'Sum of Faulty','Sum of Normal', 'Average of Faulty','Average of Normal', 'Split Difference'},'Location','northeast')
hold off
