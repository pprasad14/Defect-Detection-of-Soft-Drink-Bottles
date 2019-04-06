function [cum_hist] = cumuhist(h)
    len = length(h);
    cum_hist = zeros(1,len);
    
    for i = 1:len
        if i == 1
            cum_hist(i) = h(i);
        else
            cum_hist(i) = h(i) + cum_hist(i-1);
        end
    end
end