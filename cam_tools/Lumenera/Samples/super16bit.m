
echo on
%**************************************************************************
%       16bit.m 
%      =============================
%
% Descrition:  Test Lumenera API functions specific to 16 bits pictures
%   operation.
%
% API functions used:
%  - LucamCameraOpen
%  - LucamIs16BitCapture
%  - LucamSet16BitCapture
%  - LucamShowPreview
%  - LucamCaptureFrame
%  - LucamHidepreview
%  - LucamTakeSnapshot
%  - LucamSet16BitSnapshot
%  - LucamIs16BitSnapshot
%  - LucamCameraClose
%
% NOTES:
%  - For more information on a camera command "type commandname".  
%  - Parameter definition can also be found in Lumenera API Manual.
%
%**************************************************************************
echo off
LucamCameraOpen(1);                         % Open Camera to work with.

LucamSetSnapshotExposure(140,1);
LucamSetSnapshotGain(2.5,1);

LucamSet16BitCapture(false,1);              % Return Camera in 8 bit video capture mode.
LucamIs16BitCapture(1)                      % Display current depth of video capture mode.
sn=LucamIs16BitSnapshot(1)                  % Display current snapshot mode.
LucamSet16BitSnapshot(false,1);             % make sure in 8 bit mode.
p=LucamTakeSnapshot(1);                     % Take 8 bit snapshot.
p=LucamTakeSnapshot(1);                     % Take 8 bit snapshot.

figure('Name','8 bits Snapshot frame');     % Setup image window.
image(p);                                   % Display image.
snap8=p;
red8=snap8(:,:,1);
green8=snap8(:,:,1);
blue8=snap8(:,:,1);
%x=0:1:255;
%figure('Name','Test hist'),hist(green8,x); figure('Name','Histograme green 8bit'),imhist(green8); figure('Name','Green 8 bit'),imshow(green8);

LucamSet16BitSnapshot(true,1);              % Set Camera in 16 bits snapshot mode.
sn=LucamIs16BitSnapshot(1)                  % Display current mode.
p=LucamTakeSnapshot(1);                     % Take 16 bit snapshot.
snap16=p;
red16=snap16(:,:,1);
green16=snap16(:,:,1);
blue16=snap16(:,:,1);
figure('Name','Histograme green 16bit'),imhist(green16); figure('Name','Green 16 bit'),imshow(green16);


LucamSet16BitSnapshot(false,1);             % Set Camera in 8 bits snapshot mode.
sn=LucamIs16BitSnapshot(1)                  % Display current mode.
LucamCameraClose(1);                        % Close camera that we work with.
