function [h] = my_histogram(I)
    h = zeros(1,256);
    [r,c] = size(I);
    
    for i = 1:r
        for j = 1:c
            cur_val = I(i,j);
            h(cur_val + 1) = h(cur_val + 1) + 1;
        end
    end
end

