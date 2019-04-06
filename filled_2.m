%% Fault: Cap Missing
str = 'TrainingData/';
fault_1 = '1-UnderFilled/underfilled-image';
fault_2 = '2-OverFilled/overfilled-image';
normal = 'Normal/normal-image';

ext = '.jpg';


image_names_1 = string(zeros(1,9));
image_names_2 = string(zeros(1,9));
image_names_normal = string(zeros(1,9));

fault_result_1 = zeros(2,9);
fault_result_2 = zeros(2,9);
normal_result = zeros(2,9);


%% Underfilled: Finding the sum of histogram from 0 to 150  

for i = 1:9
    image_names_1(i)= strcat(fault_1,string(i),ext);
    file_path = strcat(str,image_names_1(i));
    image = imread(char(file_path));
    [fault_result_1(1,i),fault_result_1(2,i)] = filled_test(image);
end

%% Overfilled: Finding the sum of histogram from 0 to 150  

for i = 1:9
    image_names_2(i)= strcat(fault_2,string(i),ext);
    file_path = strcat(str,image_names_2(i));
    image = imread(char(file_path));
    [fault_result_2(1,i),fault_result_2(2,i)] = filled_test(image);
end

%% Normal: Finding the sum of histogram from 0 to 150  

for i = 1:9
    image_names_normal(i)= strcat(normal,string(i),ext);
    file_path = strcat(str,image_names_normal(i));
    image = imread(char(file_path));
    [normal_result(1,i),normal_result(2,i)] = filled_test(image);
end

fault_result_1 = fault_result_1';
fault_result_2 = fault_result_2';
normal_result = normal_result';

%% Plotting the results:
mean_fault_1 = mean(fault_result_1(:,2));
mean_fault_2 = mean(fault_result_2(:,2));
mean_normal = mean(normal_result(:,2));

plot(1:9,fault_result_1(:,2));
hold on
plot(1:9,fault_result_2(:,2));
hold on
plot(1:9,normal_result(:,2));
hold on
XL = xlim();
plot(XL, [mean_fault_1 mean_fault_1], 'c--')
hold on
plot(XL, [mean_fault_2 mean_fault_2], 'g--')
hold on
% mu = mean_fault_1 + (mean_fault_2 - mean_fault_1)/2 ;
% hline = refline([0 mu]);
% hline.Color = 'yellow';

normal_upper_limit = mu + (mean_fault_2 - mu)/3;
hline = refline([0 normal_upper_limit]);
hline.Color = 'r';
normal_lower_limit = mu - (mean_fault_2 - mu)/3;
hline = refline([0 normal_lower_limit]);
hline.Color = 'b';

title('Comparison of Underfilled, Overfilled and Normal Histogram Sum from 0 to 150');
xlabel('Image Number') 
ylabel('Summation of Histogram of Cropped Region from 0 to 150') 
legend({'Sum of Histogram 0 - 150 of Underfilled','Sum of Histogram 0 - 150 of Overfilled',...
    'Sum of Histogram 0 - 150 of Normal','Average of Underfilled', 'Average of Overfilled',...
    'Normal Upper Limit','Normal Lower Limit'},'Location','northeast')

txt = {' \uparrow', 'Plotted Data:','Overfilled'};
text(4,8000,txt)

txt2 = {'Plotted Data:','Underfilled', '\downarrow'};
text(4,2500,txt2)

txt3 = {'\uparrow','Normal Upper Limit'};
text(7.5,6000,txt3);

txt4 = {'\uparrow','Normal Lower Limit'};
text(7,3000,txt4);

hold off

