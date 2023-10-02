
% Connects to a camera and adds an overlay to it.

% Connect

function overlay(camera)

try
% Tell Matlab to use camera #1's preview for the overlay imaging.
LucamSetOverlayCamera(camera);

% Load in the overlay bitmap.
%LucamSetOverlayBitmap('C:\Lumenera Matlab Driver\Samples\overlay.bmp');
LucamSetOverlayBitmap('F:\SVN\TAC\trunk\Matlab Interface\M-Files\Samples\overlay.bmp', camera);

% Switch the toggle that tells Matlab to use the overlay to on.
LucamSetOverlayUse(true, camera);

% Switch the toggle to set white pixels in the overlay to transparent to on.
LucamSetOverlayWhitePixelsTransparent(true, camera);

% Demo the offset command
lucamFrameFormat = LucamGetFormat(camera);
w = int32(lucamFrameFormat.width/2 - 1280/2) ;
h = int32(lucamFrameFormat.height/2- 1024/2);
LucamSetOverlayOffset(w, h, camera);

% Transparency only sets the transparency level of pixels that already have
% a transparency level > 0 on bitmap load. I.e. transparent pixels do not
% become transparent with this set to true, and 24-bit bitmaps will not be
% affected.
LucamSetOverlayTransparency(255,camera);

% Tell Matlab to save any captured frames with the overlay already on them.
LucamSetOverlayCapture(true, camera);

% Show the live feed.
LucamShowPreview(camera);

% Capture a frame.
frameWithOverlay = LucamCaptureFrame(camera);
image(frameWithOverlay);
pause(1);
% Shut down...
LucamHidePreview(camera);
LucamSetOverlayUse(false, camera);
LucamSetOverlayWhitePixelsTransparent(false, camera);
LucamSetOverlayOffset(0, 0, camera);
catch me
    msgText = getReport(me,'basic', 'hyperlinks', 'on');
    printf('%s\n', msgText);
end
