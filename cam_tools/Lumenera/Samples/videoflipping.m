echo on
%**************************************************************************
%       VideoFlipping
%      =============================
% Created: November 8, 2010
% Modified:
%
% Descrition:  
%   Demonstrate how to flip camera video.
%
% API functions used:
%  - LucamCameraOpen
%  - LucamShowPreview
%  - LucamGetBrightnessRange
%  - LucamGetBrightness
%  - LucamGetPropertyRange
%  - LucamGetProperty
%  - LucamSetProperty
%  - LucamSetBrightness
%  - LucamCameraClose
%
% NOTES:
%  - For more information on a camera command "type commandname".  
%  - Parameter definition can also be found in Lumenera API Manual.
%
%**************************************************************************
echo off
cam=1;                                                  % Camera NB to work with.
pbreak=5;                                               % Delay use in between test or give a chance to see result on preview.
nbdelay=0.05;                                           % Delay use in iteration changes.
LucamCameraOpen(cam);                                   % Open Camera to work with.
LucamShowPreview(cam);                                  % Display preview of camera.
flipCurrent=LucamGetProperty(66,cam)                    % Read current flip property.

echo on
% Flipping XY
echo off
flip = flipCurrent;
flip.Value = 3;

LucamSetProperty(flip,cam);                           % Set the flip property to flipping XY;
pause(pbreak);                                          % Give time to see flipping.

echo on
% Flipping NONE
echo off
flip.Value = 0;
LucamSetProperty(flip,cam);                           % Set the flip property to flipping None;
pause(pbreak);                                          % Give time to see flipping.

echo on
% Flipping X
echo off
flip.Value = 1;
LucamSetProperty(flip,cam);                           % Horizontal flip;
pause(pbreak);                                          % Give time to see flipping.

echo on
% Flipping Y
echo off
flip.Value =2;
LucamSetProperty(flip,cam);                           % Flip video vertically.
pause(pbreak);                                          % Give time to see flipping.


LucamSetProperty(flipCurrent,cam);                 % Return flip property to original state.
LucamCameraClose(cam);                                  % Close working camera.
