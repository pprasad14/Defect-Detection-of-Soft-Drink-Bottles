function [ O ] = image_crop(I, x, y, len_x, len_y)
    %is used to crop a given image
    %x,y is the coordinate to start the crop
    %len_x and len_y is the lengths of the cropped section of image
    
    O = zeros(len_y,len_x);
    
    m = 1;
    n = 1;
    
    for i = y:y+len_y
        n = 1;
        for j = x:x+len_x
            O(m,n) = I(i,j);
            n = n+1;
        end
        m = m+1;
    end
    
    O = uint8(O);

end