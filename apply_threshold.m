function [ O ] = apply_threshold(I, val)
    
    [r,c] = size(I);
    
    O = zeros(r,c);
    
    for i = 1: r
        for j = 1:c
            if I(i,j) > val
                O(i,j) = 255;
            else
                O(i,j) = 0;
            end
        end
    end
            

end