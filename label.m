function [res] = label(I)

    %using green channel, since easier to differentiate
    
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
end