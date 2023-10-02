function cameraNumber = ImaqCameraNumbers()
% return number of camera number connected to Imaq adaptor.
    try
        hw = ImaqGetAdaptor();
       [a, cameraNumber] = size(hw.DeviceIDs);
    
    catch Ex
        rethrow(Ex);
    end
end