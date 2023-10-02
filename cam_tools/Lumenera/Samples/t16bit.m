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
LucamSetExposure(25,1);
LucamSetGain(1,1);
LucamIs16BitCapture(1)                      % Read if in 16 bit video capture
LucamSet16BitCapture(false,1);              % Set Camera in 8 bit mode
LucamShowPreview(1);                        % Display Video Preview.
p=LucamCaptureFrame(1);  	            % Take video frame.
LucamHidePreview(1);                        % Hide video Preview.
fig = DisplayFigure('8 bit video frame', p); % Setup Display Window with image.
LucamSet16BitCapture(true,1);               % Set Camera in 16 bit video capture mode.
LucamIs16BitCapture(1)                      % Read, and confirm in 16 bit video capture mode.
LucamShowPreview(1);                        % Display Video Preview.
p=LucamCaptureFrame(1);                     % Take video frame.
LucamHidePreview(1);                        % Hide video Preview.
fig2 = DisplayFigure('16 bit video frame', p);% Setup an image windows.

LucamSet16BitCapture(false,1);              % Return Camera in 8 bit video capture mode.
LucamIs16BitCapture(1)                      % Display current depth of video capture mode.
sn=LucamIs16BitSnapshot(1)                  % Display current snapshot mode.
LucamSet16BitSnapshot(false,1);             % make sure in 8 bit mode.
p=LucamTakeSnapshot(1);                     % Take 8 bit snapshot.
DisplayFigure('8 bits Snapshot frame',p);   % Setup image window.
[m n x] = size(p);
if x >1 
    snap8=p;
    red8=snap8(:,:,1);
    green8=snap8(:,:,2);
    blue8=snap8(:,:,3);
    DisplayFigure('8 bit red channel', red8);
    DisplayFigure('8 bit green channel', green8);
    DisplayFigure('8 bit blue channel', blue8);
end

LucamSet16BitSnapshot(true,1);              % Set Camera in 16 bits snapshot mode.
sn=LucamIs16BitSnapshot(1);                  % Display current mode.
p=LucamTakeSnapshot(1);                     % Take 16 bit snapshot.
si16=figure('Name','16 bits Snapshot frame'); % Setup image window.
DisplayImage(p);                            % Display image.
if x >1
    snap16=p;
    red16=snap16(:,:,1);
    green16=snap16(:,:,2);
    blue16=snap16(:,:,3);
    DisplayFigure('16 bit red channel', red16);
    DisplayFigure('16 bit green channel', green16);
    DisplayFigure('16 bit blue channel', blue16);
end

LucamSet16BitSnapshot(false,1);             % Set Camera in 8 bits snapshot mode.
sn=LucamIs16BitSnapshot(1);                  % Display current mode.
LucamCameraClose(1);                        % Close camera that we work with.
