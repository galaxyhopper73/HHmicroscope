function vid = ImaqGetVideoDevice(camera)
%Get Imaq video input information for hw camera.
    try
        vid = eval(camera.VideoDeviceConstructor);
        
    catch Ex
        rethrow(Ex);
    end
    
end