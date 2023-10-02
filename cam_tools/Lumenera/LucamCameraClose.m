function LucamCameraClose(cameraNum)
% LucamCameraClose - Disconnects from the currently connected Lumenera camera.
try
    LuDispatcher(-2, cameraNum);
catch ME
    rethrow(ME);
end    
