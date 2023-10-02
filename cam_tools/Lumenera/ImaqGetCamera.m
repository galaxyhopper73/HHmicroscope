function camera = ImaqGetCamera(index)
% Get camera imaq information
% index valid index for camera
try
    hw = ImaqGetAdaptor();
    camera = imaqhwinfo(hw.AdaptorName, index);
catch Ex
    rethrow(Ex)
end
    
end