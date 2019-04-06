%% Fault: Cap Missing
str = 'TrainingData/';
fault_6 = '6-CapMissing/capmissing-image';

ext = '.jpg';

image_names = string(zeros(1,9));
fault_result = zeros(1,9);

for i = 1:9
    image_names(i)= strcat(fault_6,string(i),ext);
    file_path = strcat(str,image_names(i));
    image = imread(char(file_path));
    fault_result(i) = cap(image);
end

%% Fault: Filled Level
str = 'TrainingData/';
fault_1 = '1-Underfilled/underfilled-image';
ext = '.jpg';

image_names = string(zeros(1,9));
fault_result = zeros(1,9);

for i = 1:9
    image_names(i)= strcat(fault_1,string(i),ext);
    file_path = strcat(str,image_names(i));
    image = imread(char(file_path));
    fault_result(i) = filled(image);
end


