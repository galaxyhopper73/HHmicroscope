function LucamSetOverlayCamera (cameraNum)
% LucamSetOverlayCamera - Sets the camera to use the overlay with.
try
    LuDispatcher(108, cameraNum);
catch ME
    rethrow(ME);
end    
