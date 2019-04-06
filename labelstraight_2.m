%% Fault: Lable Not Straight
str = 'TrainingData/';
fault_5 = '5-LabelNotStraight/labelnotstraight-image';
normal = 'Normal/normal-image';

ext = '.jpg';

image_names = string(zeros(1,9));
fault_result = zeros(2,9);
normal_result = zeros(2,9);

%% Label Not Straight: Finding the Percentage of white:

for i = 1:9
    image_names(i)= strcat(fault_5,string(i),ext);
    file_path = strcat(str,image_names(i));
    image = imread(char(file_path));
    [fault_result(1,i),fault_result(2,i)] = labelstraight_test(image);
end



%% Label Straight: Finding the Percentage of white:

for i = 1:9
    image_names(i)= strcat(normal,string(i),ext);
    file_path = strcat(str,image_names(i));
    image = imread(char(file_path));
    [normal_result(1,i),normal_result(2,i)] = labelstraight_test(image);
end

normal_result = normal_result';
fault_result = fault_result';

%% Plotting the results:
mean_fault = mean(fault_result(:,2));
mean_normal = mean(normal_result(:,2));
    
plot(1:9,fault_result(:,2));
hold on
plot(1:9,normal_result(:,2));
hold on

mu = 12;
hline = refline([0 mu]);
hline.Color = 'g';
title('Percentage of White Pixels in window');
xlabel('Image Number') 
ylabel('Percentage of White') 
legend({'% White for Label Not Straight','% White for Label Straight', 'Separating Line',},'Location','east')

hold off

