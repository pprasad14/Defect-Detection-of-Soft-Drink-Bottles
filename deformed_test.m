%% Fault: Deformed Bottle
str = 'TrainingData/';
fault_7 = '7-DeformedBottle/deformedbottle-image00';
normal = 'Normal/normal-image';
ext = '.jpg';

normal_area = zeros(1,9);
normal_major_axis = zeros(1,9);
normal_minor_axis = zeros(1,9);
normal_result = zeros(1,3);

fault_area = zeros(1,9);
fault_major_axis = zeros(1,9);
fault_minor_axis = zeros(1,9);
fault_result = zeros(1,3);

%% for deformed
for i = 1:9
    image_name = strcat(fault_7,string(i),ext);
    file_path = strcat(str,image_name);
    image = imread(char(file_path));
    fault_result = deformed_2(image);
    
    fault_area(1,i) = fault_result(1,1).MajorAxisLength;
    fault_major_axis(1,i) = fault_result(1,2).MinorAxisLength;
    fault_minor_axis(1,i) = fault_result(1,3).Orientation;
end

%% for normal

for i = 1:9
    image_name = strcat(normal,string(i),ext);
    file_path = strcat(str,image_name);
    image = imread(char(file_path));
    normal_result = deformed_2(image);
    
    normal_area(1,i) = normal_result(1,1).MajorAxisLength;
    normal_major_axis(1,i) = normal_result(1,2).MinorAxisLength;
    normal_minor_axis(1,i) = normal_result(1,3).Orientation;
end


%% Combining Both Major and Minor Axis and Orientation

both_major = zeros(1,9);
both_major(1,:) = normal_major_axis;
both_major(2,:) = fault_major_axis;

both_minor = zeros(2,9);
both_minor(1,:) = normal_minor_axis;
both_minor(2,:) = fault_minor_axis;

both_orientation = zeros(3,9);
both_orientation(1,:) = normal_area;
both_orientation(2,:) = fault_area;

%% plotting results

%minor axis
figure
x = 1:9;
y_minor = both_minor;
plot(x,y_minor)
title('Minor Axis Comparison')

% hold on

%major
figure
x = 1:9;
y_major = both_major ;
plot(x,y_major)
title('Major Axis Comparison');


y3 = 2*sin(x);
scatter(x,y3) 

hold off










