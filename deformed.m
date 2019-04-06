function [res] = deformed(I)
%% taking green channel

    I_green = I(:,:,2);
%     imshow(I);
    
%% Cropping region of interest

    edge_cropped = image_crop(I_green, 100, 60, 140, 115);
%     figure
%     imshow(edge_cropped);

%% Thresholding the cropped image to show the dark region

cropped_thresh = edge_cropped < 100;
% figure
% imshow(cropped_thresh);

cropped_filled = imfill(cropped_thresh, 'holes');
% figure
% imshow(cropped_filled);


%% remove small objects

cropped_no_small = bwareaopen(cropped_filled,1000);
% figure
% imshow(cropped_no_small);

%% get properties of object

stats = regionprops('table',cropped_no_small,...
    'MajorAxisLength','MinorAxisLength','Area');

% stats = regionprops(cropped_no_small,properties);
    
%% Result:

    if (stats.MajorAxisLength / stats.MinorAxisLength) > 3 && (stats.MajorAxisLength / stats.MinorAxisLength)< 3.9 && stats.Area < 4000
            res = 1;
    elseif (stats.MajorAxisLength / stats.MinorAxisLength) > 3.4 && (stats.MajorAxisLength / stats.MinorAxisLength)< 3.9 && stats.Area > 4000
        res = 0;
    else
        res = get_hough_result(I);
    end
  
end

