function [res, h_0_200, h_total] = labelprint_test(I)
    
    %using red channel, since easier to differentiate
    
    I_green = I(:,:,2);
    
%     cropped = image_crop(I_green, 100,170, 125, 116);
%     cropped_normal = image_crop(I_green, 100,170, 125, 116);
%     
%     figure
%     subplot(2,2,1), imshow(cropped), title('Cropped Label Print Missing');
%     subplot(2,2,2), imhist(cropped), title('Histogram of Cropped Label Print Missing');
%     subplot(2,2,3), imshow(cropped_normal), title('Cropped Label Print Success');
%     subplot(2,2,4), imhist(cropped_normal), title('Histogram of Cropped Label Print Successful');
%     
%     
    h = my_histogram(cropped);
    
    h_0_200 = histsum(h,0,200);
    h_total = histsum(h,0,255);
    
    %we are going to consider the cropped image as 'labelprint missing' if
    %percentage of black color pixels (from 0-200) is less than 30% and 'labelprint present' if
    %more than 30%
    
    if h_0_200/h_total < 0.30
        res = 1;
    else
        res = 0;
    end
end
