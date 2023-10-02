function autoRoi(cameraNum)
try

echo on
%**************************************************************************
%       autoRoi.m 1.00
%      =============================
% Created: October 5, 2010
% Modified:
%
% Descrition:  
%   Perform auto Roi operation on LW23X camera. 
%
% API functions used:
%  - LucamCameraOpen
%  - LucamShowPreview
%  - LucamGetFrameSize
%  - LucamAutoRoiGet
%  - LucamAutoRoiSet
%  - LucamCameraClose
%
% NOTES:
%  - For more information on a camera command "type commandname".  
%  - Parameter definition can also be found in Lumenera API Manual.
%
%**************************************************************************
echo off
LucamCameraOpen(cameraNum);			% Open Camera to work with.
LucamShowPreview(cameraNum);			% Display Camera Preview.
[lw,lh]=LucamGetFrameSize(cameraNum);		% Read current Frame size.
[dx,dt,dw,dh]=LucamAutoRoiGet(cameraNum)	% Get current auto Roi on camera.	
LucamAutoRoiSet(100,200,320,240,cameraNum);	% Set auto ROI on camere.
[ax,at,aw,ah]=LucamAutoRoiGet(cameraNum)	% Get Current Auto Roi on Camera.
LucamAutoRoiSet(dx,dt,dw,dh,cameraNum);	% Return auto ROI on default value.
[ax,at,aw,ah]=LucamAutoRoiGet(cameraNum)	% Get Current Auto Roi on Camera.
catch Ex
    
    report = getReport(Ex, 'basic', 'hyperlinks', 'off');
    fprintf("%s\n", report);
end
LucamHidePreview(cameraNum);
LucamCameraClose(cameraNum);
 