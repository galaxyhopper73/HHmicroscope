function LucamSetOverlayUse (useOverlay, cameraNum)
% LucamSetOverlayUse - Sets whether or not to use the overlay.
try
    LuDispatcher(109, cameraNum, useOverlay);
catch ME
    rethrow(ME);
end    
