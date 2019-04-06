%% Fault: Cap Missing
str = 'TrainingData/';
fault_6 = '6-CapMissing/capmissing-image';
normal = 'Normal/normal-image';
ext = '.jpg';

image_names = string(zeros(1,9));
fault_result = zeros(1,9);
normal_result = zeros(1,9);

% for fault 
for i = 1:9
    image_names(i)= strcat(fault_6,string(i),ext);
    file_path = strcat(str,image_names(i));
    image = imread(char(file_path));
    fault_result(i) = cap(image);
end

% for normal 
for i = 1:9
    image_names(i)= strcat(normal,string(i),ext);
    file_path = strcat(str,image_names(i));
    image = imread(char(file_path));
    normal_result(i) = cap(image);
end

% to print the result on command window. 0: no fault, 1: fault present
fault_result
normal_result

%% Fault: Underfilled, Overfilled
str = 'TrainingData/';
fault_1 = '1-UnderFilled/underfilled-image';
fault_2 = '2-OverFilled/overfilled-image';
normal = 'Normal/normal-image';
ext = '.jpg';

image_names = string(zeros(1,9));
fault_result = zeros(2,9);
normal_result = zeros(1,9);

% for fault underfilled
for i = 1:9
    image_names(i)= strcat(fault_1,string(i),ext);
    file_path = strcat(str,image_names(i));
    image = imread(char(file_path));
    fault_result(1,i) = filled(image);
end

% for fault overfilled
for i = 1:9
    image_names(i)= strcat(fault_2,string(i),ext);
    file_path = strcat(str,image_names(i));
    image = imread(char(file_path));
    fault_result(2,i) = filled(image);
end


% for normal 
for i = 1:9
    image_names(i)= strcat(normal,string(i),ext);
    file_path = strcat(str,image_names(i));
    image = imread(char(file_path));
    normal_result(i) = filled(image);
end

% to print the result on command window. 0: no fault, 1: fault
% present(overfilled), -1:underfilled
fault_result
normal_result

%% Fault: No Label
str = 'TrainingData/';
fault_3 = '3-NoLabel/nolabel-image';
normal = 'Normal/normal-image';
ext = '.jpg';

image_names = string(zeros(1,9));
fault_result = zeros(1,9);
normal_result = zeros(1,9);

% for fault 
for i = 1:9
    image_names(i)= strcat(fault_3,string(i),ext);
    file_path = strcat(str,image_names(i));
    image = imread(char(file_path));
    fault_result(i) = label(image);
end

% for normal 
for i = 1:9
    image_names(i)= strcat(normal,string(i),ext);
    file_path = strcat(str,image_names(i));
    image = imread(char(file_path));
    normal_result(i) = label(image);
end

% to print the result on command window. 0: no fault, 1: fault present
fault_result
normal_result

%% Fault: No Label Print
str = 'TrainingData/';
fault_4 = '4-NoLabelPrint/nolabelprint-image';
normal = 'Normal/normal-image';
ext = '.jpg';

image_names = string(zeros(1,9));
fault_result = zeros(1,9);
normal_result = zeros(1,9);

% for fault 
for i = 1:9
    image_names(i)= strcat(fault_4,string(i),ext);
    file_path = strcat(str,image_names(i));
    image = imread(char(file_path));
    fault_result(i) = labelprint(image);
end

% for normal 
for i = 1:9
    image_names(i)= strcat(normal,string(i),ext);
    file_path = strcat(str,image_names(i));
    image = imread(char(file_path));
    normal_result(i) = labelprint(image);
end

% to print the result on command window. 0: no fault, 1: fault present
fault_result
normal_result

%% Fault: Label Straight
str = 'TrainingData/';
fault_5 = '5-LabelNotStraight/labelnotstraight-image';
normal = 'Normal/normal-image';
ext = '.jpg';

image_names = string(zeros(1,9));
fault_result = zeros(1,9);
normal_result = zeros(1,9);

% for fault 
for i = 1:9
    image_names(i)= strcat(fault_5,string(i),ext);
    file_path = strcat(str,image_names(i));
    image = imread(char(file_path));
    fault_result(i) = labelstraight(image);
end

% for normal 
for i = 1:9
    image_names(i)= strcat(normal,string(i),ext);
    file_path = strcat(str,image_names(i));
    image = imread(char(file_path));
    normal_result(i) = labelstraight(image);
end

% to print the result on command window. 0: no fault, 1: fault present
fault_result
normal_result

%% Fault: Deformed
str = 'TrainingData/';
fault_7 = '7-DeformedBottle/deformedbottle-image00';
normal = 'Normal/normal-image';
ext = '.jpg';

image_names = string(zeros(1,9));
fault_result = zeros(1,9);
normal_result = zeros(1,9);

% for fault 
for i = 1:9
    image_names(i)= strcat(fault_7,string(i),ext);
    file_path = strcat(str,image_names(i));
    image = imread(char(file_path));
    fault_result(i) = deformed(image);
end

% for normal 
for i = 1:24
    image_names(i)= strcat(normal,string(i),ext);
    file_path = strcat(str,image_names(i));
    image = imread(char(file_path));
    normal_result(i) = deformed(image);
end

% to print the result on command window. 0: no fault, 1: fault present
fault_result
normal_result


