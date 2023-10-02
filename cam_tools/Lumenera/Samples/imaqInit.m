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
myFormat = char(devInfo.DefaultFormat);
vid = videoinput(myname,devID,myFormat);
src = getselectedsource(vid);