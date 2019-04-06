%% Fault: Label Missing or Present
str = 'TrainingData/';
fault_3 = '3-NoLabel/nolabel-image';
normal = 'Normal/normal-image';

ext = '.jpg';

image_names = string(zeros(1,9));
fault_result = zeros(3,9);
normal_result = zeros(3,9);

%% Label Missing: Finding the sum of black region and white region:

for i = 1:9
    image_names(i)= strcat(fault_3,string(i),ext);
    file_path = strcat(str,image_names(i));
    image = imread(char(file_path));
    [fault_result(1,i),fault_result(2,i),fault_result(3,i)] = label_test(image);
end

%black and white mean for Missing Label:
black_mean = mean(fault_result(2,:));
white_mean = mean(fault_result(3,:));

%% Label Present: Finding the sum of black region and white region:

for i = 1:9
    image_names(i)= strcat(normal,string(i),ext);
    file_path = strcat(str,image_names(i));
    image = imread(char(file_path));
    [normal_result(1,i),normal_result(2,i),normal_result(3,i)] = label_test(image);
end

%black and white mean for Missing Label:
black_mean_normal = mean(normal_result(2,:));
white_mean_normal = mean(normal_result(3,:));
