%% Fault: Cap Missing
str = 'TrainingData/';
fault_4 = '4-NoLabelPrint/nolabelprint-image';
normal = 'Normal/normal-image';
ext = '.jpg';

image_names = string(zeros(1,9));
fault_result = zeros(3,9);
fault_result_ratio = zeros(1,9);
normal_result = zeros(3,9);
normal_result_ratio = zeros(1,9);

%% Label Printing Failed, finding the sum 0-200, 0-255:

for i = 1:9
    image_names(i)= strcat(fault_4,string(i),ext);
    file_path = strcat(str,image_names(i));
    image = imread(char(file_path));
    [fault_result(1,i),fault_result(2,i),fault_result(3,i)] = labelprint_test(image);
end

mean_print_fail = mean(fault_result(2,i));

%% Label Printing Success, finding the sum 0-200, 0-255:

for i = 1:9
    image_names(i)= strcat(normal,string(i),ext);
    file_path = strcat(str,image_names(i));
    image = imread(char(file_path));
    [normal_result(1,i),normal_result(2,i),normal_result(3,i)] = labelprint_test(image);
end

mean_print_success = mean(normal_result(2,i));


fault_result = fault_result';
normal_result = normal_result';
%% Finding ratios of 0-200 to 0-255 for both cases

for i = 1:9
    fault_result_ratio(i) = (fault_result(2,i)/fault_result(3,i));
    normal_result_ratio(i) = (normal_result(2,i)/normal_result(3,i));
end

mean_fault_ratio = mean(fault_result_ratio);
mean_normal_ratio = mean(normal_result_ratio);

dividing_ratio = mean_fault_ratio + (mean_normal_ratio - mean_fault_ratio)/2;

plot(1:9,fault_result_ratio);
hold on
plot(1:9,normal_result_ratio);
hold on
XL = xlim();
plot(XL, [mean_fault_ratio mean_fault_ratio], 'black--')
hold on
plot(XL, [mean_normal_ratio mean_normal_ratio], 'g--')
hold on
mu = round(dividing_ratio,1) ;
hline = refline([0 mu]);
hline.Color = 'r';
title('Ratio of 0-200 to 0-255 Hist sum of Faulty and Normal');
xlabel('Image Number') 
ylabel('Ratio') 
legend({'Missing Label','Label Present', 'Average Ratio of Faulty','Average of Normal', 'Split Difference'},'Location','northeast')

txt = {' \leftarrow Ratios of Label present'};
text(2.25,0.425,txt)

txt = {'Ratios of Label missing \rightarrow'};
text(1.95,0.25,txt)

hold off



