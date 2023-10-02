function LucamSetOverlayBitmap (fileName, cameraNum)
% LucamSetOverlayBitmap - Adds an overlay to the live feed.
try
    LuDispatcher(107, cameraNum, fileName);
catch ME
    rethrow(ME);
end    
