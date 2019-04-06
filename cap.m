function [ res ] = cap(I)
    %converting RGB to grayscale 
    I_gray = rgb2gray(I);
    
    %getting the original dimensions of input image
    original_ylen = size(I_gray,1);
    original_xlen = size(I_gray,2);
    
    %creating a focus window
    window_y = ceil(0.18 * original_ylen);
    window_x = ceil(0.33 * original_xlen);
    
    %populating the cap area of image
    cap_region = zeros(window_y, window_x);
    
    %assigning the coordinates of the area of focus
    x1 = ceil(original_xlen/3);
    x2 = x1+window_x;
    x3 = x1;
    x4 = x3+window_x;
    
    y1 = 1;
    y2 = 1;
    y3 = window_y;
    y4 = window_y;
    
    m = 1;
    n = 1;
    
    %populating the cap_region from the original image
    for i = y1:y3
        n = 1;
        for j = x1:x2
            cap_region(m,n) = I_gray(i,j);
            n = n+1;
        end
        m = m+1;
    end
    
    %converting the "double" cap_region to "uint8"
    cap_region = uint8(cap_region);
    
    %finding sum of the values within the cap_region
    s = sum(sum(cap_region));
    
    %if more white, sum is more, hence cap is missing
    %if more black, sum is less, hence cap is present
    if (s > 1170000)
        res = 1;
    else
        res = 0;
    end
end 