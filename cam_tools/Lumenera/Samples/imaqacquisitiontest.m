function imaqacquisitiontest(deviceID, gain, exposure)
try
    msgId = 'ImaqAcquisitionTest:error';
    ImaqOpen();
    if ~ImaqIsAdaptorRegistered()
        msg = MException(msgId, 'Lumenera Imaq adaptor is not registered into MATLAB');
        throw(msg);
    end
    nbCamera = ImaqCameraNumbers();
    if nbCamera < 1
        msg = MException(msgId, 'There is no Lumenera camera connected.');
        throw(msg);
    end
    if deviceID < 1
    end
    if deviceID > nbCamera
    end
    
    camera = ImaqGetCamera(deviceID);
    myRes = camera.SupportedFormats{2};
    vid = ImaqGetVideoInput(camera, myRes);
    src = ImaqVideoInputProperties(vid);

    figure('Name', 'This is my Preview video');
    uicontrol('String', 'Close', 'Callback', 'close(gcf)');
    vidRes=get(vid, 'VideoResolution');
    nBands=get(vid,'NumberOfBands');
    nb=100;
    b= zeros(vidRes(2), vidRes(1),nBands);
    intensity=zeros(nb,1);
    hImage = image(b);
    src.EXPOSURE=exposure;
    src.GAIN=gain;
    preview(vid,hImage);
    pause(1);
    src.WB_Iterations=3;
    pause(5);
    
    
    
    for i=1:nb
        frame = getsnapshot(vid);
        intensity(i)=mean2(frame);
        %i,intensity(i);  
    end
    stoppreview(vid);
    closepreview(vid);
    delete(hImage);
    figure('Name','Intensity profile');
    subplot(2,1,1);
    plot(intensity);
    subplot(2,1,2);
    plot(round(intensity));
    %figure; bar(intensity);


    delete(vid);
    

catch Ex
    report = getReport(Ex, 'basic', 'hyperlinks', 'off');
    fprintf("%s\n", report);
end
end