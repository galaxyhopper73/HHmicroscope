echo on
%**************************************************************************
%      ROItest.m
%      =====================
%
% Descrition:  
%   Show how set Region Of Interest.
%
% API functions used:
% - LucamCameraOpen
% - LucamShowPreview
% - LucamGetOffset
% - LucamSetOffset
% - LucamGetFormat
% - LucamCameraClose
% - LucamHidePreview
%
% NOTES:
%  - For more information on a camera command "type commandname".  
%  - Parameter definition can also be found in Lumenera API Manual.
%
%**************************************************************************
echo off
currentCam=1;						% Camera NB to work with.
pbreak=1;						% Delay use in between test or give a chance to see result on preview.
LucamCameraOpen(currentCam);				% Select camera to work with.
LucamShowPreview(currentCam);				% Display Preview
frameFormat=LucamGetFormat(currentCam)                  % Get Frame Format
pause(pbreak);						% Give time to see preview.
pause(pbreak);
LucamHidePreview(currentCam);				% clear preview.
frameFormat.width=1024;					% Prepare for new ROI window
frameFormat.height=1024;
LucamSetFormat(frameFormat,currentCam);			% Set new ROI window
[ooffsetX,ooffsetY]=LucamGetOffset(currentCam)		% display Camera offset.
LucamSetOffset(296,96,currentCam);			% Change offset.
LucamShowPreview(currentCam);				% Display camera preview.
pause(pbreak);						% Give time to see offset change.
pause(pbreak);
LucamHidePreview(currentCam);

LucamCameraReset(currentCam);				% Bring camera to it's hardware default value.

LucamShowPreview(currentCam);				% Display Preview
pause(pbreak);						% Give time to see offset change.
pause(pbreak);
LucamHidePreview(currentCam);
LucamCameraClose(currentCam);				% End session with working camera.