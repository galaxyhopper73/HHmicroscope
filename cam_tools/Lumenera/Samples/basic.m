function basic(cameraNum)
try
echo on
%**************************************************************************
%       Basic.m 1.00
%      =============================
% Created: October 5, 2010
% Modified:
%
% Descrition:  
%   Display basic information about camera. 
%
% API functions used:
%  - LucamNumCameras
%* - LucamConnect
%* - LucamIsConnected
%* - LucamQueryVersion
%* - LucamGetTruePixel
%* - LucamEnumAvailablreFrameRates
%* - LucamListFrameRates
%* - LucamGetCameraId
%* - LucamGetHardwareRevision
%* - LucamDisconnect
%* - LucamNumCameras
%
% NOTES:
%  - For more information on a camera command "type commandname".  
%  - Parameter definition can also be found in Lumenera API Manual.
%  - LucamGetHardwareRevision is not supported by all camera.
%
%**************************************************************************
echo off
fprintf("there is %d camera(s) connected\n", LucamNumCameras());
LucamConnect(cameraNum);              % Connecting to camera.
if( LucamIsConnected(cameraNum) == false)
    me = MException('could not connect to camera.');
    throw(me); 
end
lver=LucamQueryVersion(cameraNum);    % Return Camera revision.
fprintf("Camera Information: \n");
lver
fprintf("\nCamera true bit depth: %d \n", LucamGetTruePixelDepth(cameraNum));
avFRates=LucamEnumAvailableFrameRates(cameraNum) % Availablre Frame rates.
avFList=LucamListFrameRates(cameraNum)  % List Frame Rates
camid=LucamGetCameraId(cameraNum)	% Camera identification number.
hardwareRev=LucamGetHardwareRevision(cameraNum)
catch Ex
    
    report = getReport(Ex, 'basic', 'hyperlinks', 'off');
    fprintf("%s\n", report);
end
LucamHidePreview(cameraNum);
LucamCameraClose(cameraNum);
