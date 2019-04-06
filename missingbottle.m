function [res] = missingbottle(I)

    I_gray = rgb2gray(I);
    
    n = imread('normal-image011.jpg');
    m = imread('missingbottle-image011.jpg');
    
    [r,c] = size(I);
    
    
    n_cropped = image_crop(
    

end