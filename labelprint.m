function [res] = labelprint(I)
    
    %using green channel, since easier to differentiate
    
    I_red = I(:,:,1);
    
    cropped = image_crop(I_red, 100,170, 125, 116);
    
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
