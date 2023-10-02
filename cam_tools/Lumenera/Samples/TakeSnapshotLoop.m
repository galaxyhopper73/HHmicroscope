echo on
%**************************************************************************
%       TakeSnapshotLoop.m 
%      =============================
%
% Descrition:  
%	test different looping snapshot.
%
% NOTES:
%  - For more information on a camera command "type commandname".  
%  - Parameter definition can also be found in Lumenera API Manual.
%  - 1 cameras is required.
%
%**************************************************************************
echo off
currentCam=1;
LucamCameraOpen(currentCam);                                % Open camera for test.
handle = figure('Name','LucamTakeSnapshot test');			% Setup an Image window.

nbImage=20;                                                 % Number of image to capture sequentially.
LucamSetSnapshotGain(2,currentCam);                         % Increase gain to 2.
LucamSetSnapshotExposure(1000,currentCam);                  % Set exposure to 1000 ms.
e=LucamGetSnapExposure(currentCam)                          % Just to confirm that the exposure has been changed.
LucamSetTimeout(10000, true, currentCam)                    % Set a snapshot timeout value.
LucamSetSnapshotShutterType(currentCam,0);                  % set camera in Global shuttertype.
%LucamSetSnapshotShutterType(currentCam,1);                 % set camera in Rolling shuttertype mode.


for m=1:nbImage
 sf=LucamTakeSnapshot(currentCam);                          % Take snapshot in loop.
image(sf);                                                  % Refresh the figure with the latest image.
pause(1);                                                   % Give time to MATLAB to display the new image.
end
LucamCameraClose(currentCam);                               % Done, close the camera.
