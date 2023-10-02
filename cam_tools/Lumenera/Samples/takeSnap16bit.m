echo on
%take long exposure 16 bit snapshots.
echo off
currentCam=1;
secondCam=2;
LucamCameraOpen(currentCam);                                    % Open camera for test.
%LucamCameraOpen(secondCam);                                     % Open second camera for the LucamTakeSynchronousSnapshots API Function tests.
% sf=LucamTakeSnapshot(currentCam);                            	% Take the first snap shot.

% sf=LucamTakeSnapshot(currentCam);  
handle = figure('Name','LucamTakeSnapshot test');			% Setup an Image window.
%
nbImage=20;
LucamSetSnapshotGain(2,currentCam);			% Increase gain to 2.
LucamSetSnapshotExposure(10,currentCam);		% Set exporure to 10 ms.
e=LucamGetSnapExposure(currentCam)
LucamSetSnapshotExposure(1000,currentCam);		% Set exporure to 1000 ms.
e=LucamGetSnapExposure(currentCam)
LucamSet16BitSnapshot(true,1);             % Set Camera in 16 bits snapshot mode.
sn=LucamIs16BitSnapshot(1);                  % Display current mode.
LucamSetTimeout(10000, true, currentCam)			% Set a snapshot timeout value.
LucamSetSnapshotShutterType(currentCam,0); 		% set camera in Global shuttertype.
%LucamSetSnapshotShutterType(currentCam,1); 		% set camera in Rolling shuttertype mode.
LucamSetSaturation(0,1);                            % Set saturation so output will be monochrome and all color channel the same.

for m=1:nbImage
    sf=LucamTakeSnapshot(currentCam);                            	% Take the first snap shot.
    image(sf);                                                      % Display image  
    pause(1);
end
LucamCameraClose(currentCam);


%Images ALWAYS displayed in 8 bit using imagesc or 
imMono=sf(:,:,1); % Take only one channel for mono.         % Keep the red channel.
figure('Name','Color in gray scale - 16 bits red');
imagesc(imMono,[0,65535]); colormap(gray);                  % Scale 16 bit as 8 bit..
figure('Name','Histograme 16 bits red'), imhist(imMono);    %display histogram.

imMono=sf(:,:,2);                                           % Take only one channel for mono. Keep green channel.
figure('Name','Color in gray scale - 16 bits green ');      
imagesc(imMono,[0,65535]); colormap(gray);                  % Scale 16 bit data to display as 8 bit data.
figure('Name','Histograme 16 bits green'), imhist(imMono);  

imMono=sf(:,:,3); % Take only one channel for mono.         % Take blue channel.
figure('Name','Color in gray scale - 16 bits blue ');
imagesc(imMono,[0,65535]); colormap(gray);  % Display as 16 bit data.
figure('Name','Histograme 16 bits blue'), imhist(imMono);

t14 = imMono/4;                                             % INF2-1RC output 14 bit of data.  To work with the 14 bit of data only need to devide by 4.
figure('Name','Color in gray scale- 14 bits true camera bit depth.');
imagesc(t14,[0,16384]); colormap(gray);                     % Display as 14 bit data.
figure('Name','Histograme 14 bits'), imhist(t14);


