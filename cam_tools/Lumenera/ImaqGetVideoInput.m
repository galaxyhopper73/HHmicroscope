function vid = ImaqGetVideoInput(camera, format)
%Get Imaq video input information for hw camera.
    try
        switch nargin
            case 2
                hw = ImaqGetAdaptor();
                vid = videoinput(hw.AdaptorName, camera.DeviceID, format);
            otherwise
                vid = eval(camera.VideoInputConstructor);
        end
    catch Ex
        rethrow(Ex);
    end
    
end