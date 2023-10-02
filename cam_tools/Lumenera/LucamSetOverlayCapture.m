function LucamSetOverlayCapture (overlayCapture, cameraNum)
% LucamSetOverlayCapture - Sets whether or not to overlay the image onto
% any captured frames.
try
    LuDispatcher(113, cameraNum, overlayCapture);
catch ME
    rethrow(ME);
end    
