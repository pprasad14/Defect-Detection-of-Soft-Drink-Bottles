function [res] = get_hough_result(I)

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

%% Get the edges of the image

    edge_cropped = edge(cropped_no_small,'canny');
%     figure, imshow(edge_cropped);

%% Finding the Hough Transform to find lines in image
    
    
    
    [H,theta,rho] = hough(edge_cropped);
    
%     displaying Hough 
%     figure
%     imshow(imadjust(rescale(H)),[],...
%            'XData',theta,...
%            'YData',rho,...
%            'InitialMagnification','fit');
%     xlabel('\theta (degrees)')
%     ylabel('\rho')
%     axis on
%     axis normal 
%     hold on
%     colormap(gca,hot)
    
    % finding peaks in the Hough Transform 
    P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
%     
%     x = theta(P(:,2));
%     y = rho(P(:,1));
%     plot(x,y,'s','color','green');

    lines = houghlines(edge_cropped,theta,rho,P,'FillGap',5,'MinLength',5);
    
%     figure, imshow(cropped_no_small), hold on
%     max_len = 0;
%     for k = 1:length(lines)
%        xy = [lines(k).point1; lines(k).point2];
%        plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
%        % Plot beginnings and ends of lines
%        plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
%        plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
%        % Determine the endpoints of the longest line segment
%        len = norm(lines(k).point1 - lines(k).point2);
%        if ( len > max_len)
%           max_len = len;
%           xy_long = xy;
%        end
%     end
%     % highlight the longest line segment
%     plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');

    angles = zeros(1,5)+90;
%     a1= 90; a2= 90; a3= 90; a4= 90; a5= 90; a6= 90; a7 = 90;
    



   [a1, a2, a3, a4, a5] = lines.theta;

    angles(1,1) = a1;
    angles(1,2) = a2;
    angles(1,3) = a3;
    angles(1,4) = a4;
    angles(1,5) = a5;
%     angles(1,6) = a6;
    
    % finding the absolute of the angles
    filtered_angles = abs(angles);
    
    % set values close to 90 to 90
    for i = 1: size(filtered_angles,2)
        if abs(filtered_angles(i) - 90) < 15
            filtered_angles(i) = 90;
        end
    end
    
    % getting non 90 values:
    filtered_unique_no_90 = filtered_angles(filtered_angles~=90);
    
       
    
    if isempty(filtered_unique_no_90)
        res = -1;
    elseif (~isempty(filtered_unique_no_90(filtered_unique_no_90 < 22 | filtered_unique_no_90 > 28)))
        res = 1;
    else
        res = 0;
    end
end








