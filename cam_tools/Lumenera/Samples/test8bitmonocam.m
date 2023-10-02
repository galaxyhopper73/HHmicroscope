echo on
%**************************************************************************
%       testmanocapture.m 
%      =============================
%
% Descrition:  Test the LucamCaptureMonochromeFrame. and also remove color
% channel when using takevideo, takesnapshot and takefastframes
%
% NOTES:
%  - For more information on a camera command "type commandname".  
%  - Parameter definition can also be found in Lumenera API Manual.
%  - monochrome camera is required.
%
%**************************************************************************
echo off

LucamConnect(1);                            % Connect to first Camera.
LucamShowPreview(1);                        % Show video preview of first Camera.
pause(2);
imagefr1 = LucamCaptureMonochromeFrame(1);  % Capture monochrome frame from first camera.
imcapture = LucamTakeVideo(1,1);
LucamHidePreview(1);                        % Hide video previe of first Camera.
imsnap = LucamTakeSnapshot(1);
imtakefast = LucamTakeFastFrames(1,1);
LucamDisconnect(1);                         % Disconnect first camera.
imcaptureMono=imcapture(:,:,1);             % Take only one channel for mono.
imsnapMono=imsnap(:,:,1);                   % Take only one channel for mono.
imtakefastMono=imtakefast(:,:,1);           % Take only one channel for mono.


figure('Name','First camera monochrome frame');
imagesc(imagefr1,[0,255]); colormap(gray);  % display first image in monochrome.
figure('Name','Histogram on monochrome frame'), imhist(imagefr1);

figure('Name','Take video mono frame'), imshow(imcaptureMono);
figure('Name','Histograme take video mono frame'), imhist(imcaptureMono);

figure('Name','Take snapshot mono frame'), imshow(imsnapMono);
figure('Name','Histograme take snapshot mono frame'), imhist(imsnapMono);

figure('Name','Take fast frame mono frame'), imshow(imtakefastMono);
figure('Name','Histograme take fast frame mono frame'), imhist(imtakefastMono);
