function [] = rgb_channels(I)
    % Extract the individual red, green, and blue color channels.
    redChannel = I(:, :, 1);
    greenChannel = I(:, :, 2);
    blueChannel = I(:, :, 3);
    z = zeros(size(I), class(I));
    redImage = z; redImage(:,:,1) = redChannel;
    greenImage = z; greenImage(:,:,2) = greenChannel;
    blueImage = z; blueImage(:,:,3) = blueChannel;
%     subplot(2,2,1); image(I);
%     subplot(2,2,2); image(redImage);
%     subplot(2,2,3); image(greenImage);
%     subplot(2,2,4); image(blueImage);

    subplot(2,4,1); imshow(I);
    subplot(2,4,2); image(redImage);
    subplot(2,4,3); image(greenImage);
    subplot(2,4,4); image(blueImage);
    subplot(2,4,5); imshow(rgb2gray(I));
    subplot(2,4,6); imshow(redChannel);
    subplot(2,4,7); imshow(greenChannel);
    subplot(2,4,8); imshow(blueChannel);

end