cam = 1; % index of camera to connect to.
ShutterGlobal = 0; % Global shutter represenation
RollingShutter = 1; % Rolling shutter representation.
camShutter = RollingShutter; 
nbCam = LucamNumCameras(); % Check number of camera connected.
if nbCam == 0 
    return;
end
if(LucamIsConnected(cam) == 0) 
    LucamCameraOpen(cam);
end
LucamCameraReset(cam); % Reset camera settings to default.
LucamSetSnapshotShutterType(camShutter, cam);

eAct1=LucamGetExposure(cam); % Get exposure.
viFormat = LucamGetVideoImageFormat(cam); % Get frame format.  not used in this code.
cf = LucamGetProperty(80,cam); % Get the color format.
isColor = true; % Assume that camera is color.
if cf.Value == 0 %check if camera is monochrome.
    isColor = false;
end
   
eAct =50 % 0.5 * eAct1; % Adjust desired exposure.
LucamSetSnapshotExposure(eAct, cam); %send exposure to camera.
if isColor
    gains = LucamGetSnapshotColorGain(cam);
    gains.Red = 1;
    gains.Green1 = 1;
    gains.Green2 = 1;
    gains.Blue = 2;
    LucamSetSnapshotColorGain(gains, cam); % adjust color balance.
end
LucamSetSnapshotGain(1, cam); % Adjust amplification on analog domain.
im1 = LucamTakeSnapshot(cam); % Plugin always return RGB Data;
im = rgb2gray(im1); % Convert to grey scale.
figure 
imshow(im)
LucamCameraClose(cam);
