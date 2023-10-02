clear;clc;
info = imaqhwinfo;
adaptors = imaqhwinfo(info.InstalledAdaptors{1,1});
vid = videoinput(adaptors.AdaptorName,1,adaptors.DeviceInfo.SupportedFormats{1,16});
src = getselectedsource(vid);
vid.FramesPerTrigger = Inf;
vid.ROIPosition = [148 48 512 512];


screenSize = get(0,'ScreenSize');
screenWidthToHeight = screenSize(3)/screenSize(4);
imageWidthToHeight = 1;
hFig = figure('Toolbar','none',...
    'Menubar', 'none',...
    'NumberTitle','Off',...
    'Name','live stream','Tag','live_stream');
set(hFig, 'Units', 'Normalized', 'OuterPosition', [0.45 0.15 0.75/screenWidthToHeight*0.972*imageWidthToHeight 0.75]);
ImgAx = gca;
ImgAx.InnerPosition = [0 0 1 1];
imgh = image(ImgAx, zeros(512, 512, 1));



preview(vid,imgh);


% camera_list = cell(2,1);
% info = imaqhwinfo;
% adaptors = imaqhwinfo(info.InstalledAdaptors{1,1});
% Cam_Infinity.vidobj = videoinput(adaptors.AdaptorName,1,adaptors.DeviceInfo.SupportedFormats{1,17}); % initialize camera mode
% Cam_Infinity.src = getselectedsource(Cam_Infinity.vidobj);
% Cam_Infinity.vidobj.FramesPerTrigger = Inf;
% camera_list{1,1} = Cam_Infinity;