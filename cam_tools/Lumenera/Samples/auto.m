echo on
%**************************************************************************
%       auto.m 1.00
%      =============================
% Created: October 5, 2010
% Modified:
%
% Descrition:  
%   Test Moto Lens on supported camera. 
%
% API functions used:
%  - LucamCameraOpen
%  - LucamShowPreview
%  - LucamInitAutoLens
%  - LucamGetFrameSize
%  - LucamAutoFocusStart
%  - LucamAutoFocusQueryProgress
%  - LucamAutoFocusStop
%  - LucamAutoFocusWait
%  - LucamOneShotAutoExposure
%  - LucamOneshotAutoIris
%  - LucamOnshotAutoWhiteBalance
%  - LucamOnshotAutoWhiteBalanceEx
%  - LucamCameraClose
%
% NOTES:
%  - For more information on a camera command "type commandname".  
%  - Parameter definition can also be found in Lumenera API Manual.
%
%
%**************************************************************************
echo off
cam=2;					% Camera to work with.
pbreak=1;				% Delay in tests.
try
    
LucamCameraOpen(cam);			% Open Camera to work with.
LucamShowPreview(cam);			% Display Camera Preview.
LucamInitAutoLens(true, cam);		% Initialise camera lens.
iris = LucamGetProperty(21, cam);
iris.Value = 100;
LucamSetProperty(iris, cam);
pause(pbreak);				% Give time to lens todo first initialisation.
[lw,lh]=LucamGetFrameSize(cam);		% Read current Frame size.

fprintf("\ntesting LucamAutoFocusQueryProgress\n");
LucamAutoFocusStart(lh,lw,0,0,cam);	% Start focus.
pDone =0;
i=0;
while pDone < 100
%for i=0:1:3				% Wait before asking again
    pDone=LucamAutoFocusQueryProgress(cam);	% return percent completed.
    fprintf("Pass #%d - AutoFocus progress is %f %s completed\n", i, pDone,'%');
    pause(1);
   	i = i + 1;		
end


%LucamAutoFocusStop(cam);		% Make sure Auto Focusing is stopped.
fprintf("\nTesting LucamAutoFocusWait\n");
LucamAutoFocusStart(480,640,0,0,cam);	% Start focus.
LucamAutoFocusWait(8000,cam);		% wait for for AutoFocus to complete of timeout.
pwait=LucamAutoFocusQueryProgress(cam)  % Read percent completed.
%LucamAutoFocusStop(cam);		% Make sure Auto Focusing is stopped.

fprintf("\nTesting LucamAutoFocusStop\n");
LucamAutoFocusStart(lh,lw,0,0,cam);	% Start focus.
%LucamAutoFocusWait(1000000,cam);		% wait for for AutoFocus to complete of timeout.
%pwait=LucamAutoFocusQueryProgress(cam)  % Read percent completed.
LucamAutoFocusStop(cam);		% Make sure Auto Focusing is stopped.
LucamHidePreview(cam);
LucamCameraReset(cam);
LucamShowPreview(cam);

fprintf("\nTest LucamOneShotAutoExposure\n");
LucamOneShotAutoExposure(lh,lw,0,0,100,cam); % Try to do an auto exposure with a target brigthness[0:255]=100.
pause(pbreak);
LucamHidePreview(cam);
LucamCameraReset(cam);
LucamShowPreview(cam);
fprintf("\nTest LucamOneShotAutoIris\n");
LucamOneShotAutoIris(lh,lw,0,0,100,cam); % Perform Auto Iris calculation with a target brigthness = 100.
pause(pbreak);
LucamHidePreview(cam);
LucamCameraReset(cam);

fprintf("\nTest LucamOneShotAutoWhiteBalance\n");
LucamShowPreview(cam);

LucamOneShotAutoWhiteBalance(lh,lw,0,0,cam); % Perform WB calculation.
pause(pbreak);
fprintf("\nTest LucamOneShotAutoWhiteBalanceEx\n");
LucamOneShotAutoWhiteBalanceEx(lh,lw,0,0,(219/229),(249/229),cam); % Perform a Target WB calculation.
fprintf("\nsuccess, closing camera connection.\n");
LucamCameraClose(cam);
catch Ex
    LucamHidePreview(cam);
    report = getReport(Ex, 'basic', 'hyperlinks', 'off');
    fprintf(report);  
end
