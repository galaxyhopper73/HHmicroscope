hw = imaqhwinfo();
videoAdaptors=hw.InstalledAdaptors;
AdaptorIndex=0;
file='lumeneraimaq';
for i=1:length(videoAdaptors)
    if (strcmp(file, videoAdaptors(i)) == 1)
        AdaptorIndex = i;
    end
end
videostring=hw.InstalledAdaptors(AdaptorIndex);  % could be winvideo5
myname=char(videostring);
clear videostring;
hw=imaqhwinfo(myname);
videoInput = eval(hw.DeviceInfo.VideoInputConstructor);
videoDevice = eval(hw.DeviceInfo.VideoDeviceConstructor);
props = videoDevice.DeviceProperties;