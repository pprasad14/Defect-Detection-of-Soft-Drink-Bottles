function [res,s_black,s_white] = label_test(I)

    %using red channel, since easier to differentiate
    
    I_red = I(:,:,1);
    
    cropped = image_crop(I_red, 100,170, 125, 116);
    
    hist = my_histogram(cropped);
    
    s_black = histsum(hist, 0, 150);
    s_white = sum(imhist(cropped)) - s_black ;
    
    if s_black > s_white
        res = 1;
    else
        res = 0;
    end
    
    %% Displaying the histogram of the label present and missing
%     str = 'TrainingData/';
%     normal = 'Normal/normal-image';
%     ext = '.jpg';
% 
%     cropped_missing = cropped;
%     normal_image = imread(char(strcat(str,strcat(normal,string(1),ext))));
%     normal_image_cropped = image_crop(normal_image, 110,170, 125, 116);
% 
% 
%     figure
%     subplot(2,2,1), imshow(cropped_missing), title('Cropped Image of Missing Label');
%     subplot(2,2,2), imhist(cropped_missing), title('Histogram of Missing Label');
%     subplot(2,2,3), imshow(normal_image_cropped), title('Cropped Image of Label Present');
%     subplot(2,2,4), imhist(normal_image_cropped), title('Histogram of Label Present');
%     
end