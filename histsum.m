function [sum] = histsum(h, start, ending)
    sum = 0;
    if start < 0 || ending > 255
        sum = -1;
    else
        for i = start:ending
            sum = sum + h(i+1);
        end
    end  
end