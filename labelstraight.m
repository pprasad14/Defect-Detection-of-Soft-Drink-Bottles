function [res] = labelstraight(I)

    %using green channel, since easier to differentiate
    
    I_green = I(:,:,2);
    
    cropped = image_crop(I_green, 120,170, 125, 116);
    
    %will show black if region is above threshold value
%     cropped_thresh = apply_threshold(cropped,200);
      cropped_thresh = apply_threshold(cropped,200);
    
    %cropping the normal label line
    label_line_cropped = image_crop(cropped_thresh,1,1,125, 25);
    
    %get count of white pixels
    white_count = sum(sum(label_line_cropped))/255;
    
    white_percentage = white_count / (size(label_line_cropped, 1)*size(label_line_cropped, 2))*100;
    
    if white_percentage > 12
        res = 0;
    else 
        res = 1;
    end   
end