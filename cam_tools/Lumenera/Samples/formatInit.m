echo off
LucamCameraOpen(1);                         % Open camera to test with.
LucamCameraReset(1);
LucamShowPreview(1);                        % Display Video Preview.
ff=LucamGetFormat(1);
pause(2);


%Binning x4
ffn=ff;
ffn.width=4000;
ffn.height=2656;
ffn.xBinSub=4;
ffn.yBinSub=4;
ffn.xFlags=1;
ffn.yFlags=1;
LucamHidePreview(1);
LucamSetFormat(ffn,1);
LucamShowPreview(1);
pause(2);

LucamCameraClose(1);
