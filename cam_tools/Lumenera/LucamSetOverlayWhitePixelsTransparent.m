function LucamSetOverlayWhitePixelsTransparent (transparent, cameraNum)
% LucamSetOverlayWhitePixelsTransparent - Sets whether or not to white
% pixels in the image are transparent.
try
    LuDispatcher(110, cameraNum, transparent);
catch ME
    rethrow(ME);
end    
