echo off
LucamCameraOpen(1);                         % Open camera to test with.
LucamCameraReset(1);
LucamShowPreview(1);                        % Display Video Preview.
ff=LucamGetFormat(1);
pause(2);

% Binning x2
ffn=ff;
ffn.width=1392;
ffn.height=1040;
ffn.xBinSub=2;
ffn.yBinSub=2;
ffn.xFlags=1;
ffn.yFlags=1;
LucamHidePreview(1);
LucamSetFormat(ffn,1);
LucamShowPreview(1);
pause(2);

% Binning x3
ffn=ff;
ffn.width=1392;
ffn.height=1032;
ffn.xBinSub=3;
ffn.yBinSub=3;
ffn.xFlags=1;
ffn.yFlags=1;
LucamHidePreview(1);
LucamSetFormat(ffn,1);
LucamShowPreview(1);
pause(2);

%Binning x4
ffn=ff;
ffn.width=1376;
ffn.height=1024;
ffn.xBinSub=4;
ffn.yBinSub=4;
ffn.xFlags=1;
ffn.yFlags=1;
LucamHidePreview(1);
LucamSetFormat(ffn,1);
LucamShowPreview(1);
pause(2);

LucamCameraClose(1);
