function [res] = filled(I)
   
    %converting RGB to grayscale 
    I_gray = rgb2gray(I);
    
    %getting the original dimensions of input image
    original_ylen = size(I_gray,1);
    original_xlen = size(I_gray,2);
    
    %creating a focus window
    window_y = 115;
    window_x = 120;
    
    x_start = ceil(original_xlen/3);
    y_start = 60;
    
    %getting a cropped image of specified dimensions
    cropped = image_crop(I_gray,x_start,y_start,window_x,window_y);
    
    %finding the histogram
    hist = my_histogram(cropped);
    
    %calculating the sum of histogram in the black region (150 pixel value)
    hist_sum_150 = histsum(hist,0 ,150);
    
    %if sum is small, implies underfilled
    %if sum is large, implies overfilled
    %if sum is in normal range of 3500 - 5500, implies normal
    if hist_sum_150 < 3500
        res = -1;
    elseif hist_sum_150 > 5500
        res = 1;
    else
        res = 0;
    end
end