I1 = imread('normal-image1.jpg');
I2 = imread('labelnotstraight-image2.jpg');
I3 = imread('labelnotstraight-image3.jpg');


 I1_green = I1(:,:,2);
    
cropped1 = image_crop(I1_green, 110,170, 125, 116);

%will show black if region is above threshold value
cropped_thresh1 = apply_threshold(cropped1,200);

%cropping the normal label line
label_line_cropped1 = image_crop(cropped_thresh1,1,1,125, 25);

%%
I2_green = I2(:,:,2);
cropped2 = image_crop(I2_green, 110,170, 125, 116);

%will show black if region is above threshold value
cropped_thresh2 = apply_threshold(cropped2,200);

%cropping the normal label line
label_line_cropped2 = image_crop(cropped_thresh2,1,1,125, 25);

%%
I3_green = I3(:,:,2);
cropped3 = image_crop(I3_green, 110,170, 125, 116);

%will show black if region is above threshold value
cropped_thresh3 = apply_threshold(cropped3,200);

%cropping the normal label line
label_line_cropped3 = image_crop(cropped_thresh3,1,1,125, 25);

%%

figure
subplot(3,3,1), imshow(cropped1), title('Cropped Label Straight');
subplot(3,3,2), imshow(cropped_thresh1), title('Applying Threshold 200');
subplot(3,3,3), imshow(label_line_cropped1), title('Cropped Upper Label Region');
subplot(3,3,4), imshow(cropped2), title('Cropped Label Not Straight');
subplot(3,3,5), imshow(cropped_thresh2), title('Applying Threshold 200');
subplot(3,3,6), imshow(label_line_cropped2), title('Cropped Upper Label Region');
subplot(3,3,7), imshow(cropped3), title('Cropped Label Not Straight');
subplot(3,3,8), imshow(cropped_thresh3), title('Applying Threshold 200');
subplot(3,3,9), imshow(label_line_cropped3), title('Cropped Upper Label Region');
