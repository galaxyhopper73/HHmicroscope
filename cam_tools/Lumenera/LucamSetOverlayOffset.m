function LucamSetOverlayOffset (x, y, cameraNum)
% LucamSetOverlayOffset - offset from bottom left corner of preview image.
try
    LuDispatcher(112, cameraNum, x, y);
catch ME
    rethrow(ME);
end    
