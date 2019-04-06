%% Fault: Cap Missing
str = 'TrainingData/';
fault_6 = '6-CapMissing/capmissing-image1';
normal = 'Normal/normal-image1';
ext = '.jpg';

image_names= strcat(fault_6,ext);
file_path = strcat(str,image_names);
image = imread(char(file_path));

image_name_normal = strcat(normal,ext);
file_path = strcat(str,image_name_normal);
image_normal = imread(char(file_path));

figure 
subplot(2,3,1), imshow(image), title('Position of Window for Faulty')
subplot(2,3,2), imshow(cap_region_missing), title('Cropped Window')
subplot(2,3,3), imhist(cap_region_missing), title('Histogram of Window')
subplot(2,3,4), imshow(image_normal), title('Position of Window for Normal')
subplot(2,3,5), imshow(cap_region_normal), title('Cropped Window')
subplot(2,3,6), imhist(cap_region_normal), title('Histogram of Window')


%% Filled Level

str = 'TrainingData/';
fault_6 = '6-CapMissing/capmissing-image1';
normal = 'Normal/normal-image1';
ext = '.jpg';

image_names= strcat(fault_6,ext);
file_path = strcat(str,image_names);
image = imread(char(file_path));
