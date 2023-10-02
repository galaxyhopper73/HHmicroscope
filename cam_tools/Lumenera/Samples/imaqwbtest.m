hardware=imaqhwinfo();
videoAdaptors=hardware.InstalledAdaptors;
AdaptorIndex=0;
file='lumeneraimaq';
for i=1:length(videoAdaptors)
    if (strcmp(file, videoAdaptors(i)) == 1)
        AdaptorIndex = i;
    end
end
videostring=hardware.InstalledAdaptors(AdaptorIndex);  % could be winvideo5
myname=char(videostring);
clear videostring;
hw=imaqhwinfo(myname);
devInfo = hw.DeviceInfo;
devName = devInfo.DeviceName;
devID = devInfo.DeviceID;

supportedFormat= devInfo.SupportedFormats;
% myFormat = char(supportedFormat(8));
myFormat = char(devInfo.DefaultFormat);
vid = videoinput(myname,devID,myFormat);
src = getselectedsource(vid);
src.EXPOSURE=100;
src.GAIN=2;
src.FLIPPING='Mirror';
figure('Name', 'This is my Preview video');
uicontrol('String', 'Close', 'Callback', 'close(gcf)');
vidRes=get(vid, 'VideoResolution');
nBands=get(vid,'NumberOfBands');
b= zeros(vidRes(2), vidRes(1),nBands);
hImage = image(b);

preview(vid,hImage);
src.FLIPPING = 'Mirror';

src.GAIN_BLUE = 1;

src.GAIN_GREEN1 = 1;

src.GAIN_GREEN2 = 1;

src.GAIN_RED = 1;
pause(5);
src.WB_Iterations = 2;


%figure('Name', 'image');
%im=image(b);
%del=1;
%stoppreview(vid);
%pause('query');