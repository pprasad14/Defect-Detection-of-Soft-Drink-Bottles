function [stats] = deformed_2(I)
%% taking green channel

    I = I(:,:,2);
%     imshow(I);
    
%% Cropping region of interest

    edge_cropped = image_crop(I, 120+5, 60, 140, 115);
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
    'MajorAxisLength','MinorAxisLength','Orientation');

% stats = regionprops(cropped_no_small,properties);
    
%% Edge detection filled images of the bottle
    
% %     BW1 = edge(Gmag,'prewitt');
%     edge_cropped = edge(cropped_no_small,'canny');
% %     figure, imshow(BW1)
%     figure, imshow(edge_cropped);
    
end

