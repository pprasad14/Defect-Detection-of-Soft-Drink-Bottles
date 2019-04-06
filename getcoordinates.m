function [points] = getcoordinates(I,n)
    %to get n coordinate values of an image
    imshow(I);
    points = ginput(n);
end