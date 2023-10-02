function [camID] = LucamGetCameraId(cameraNum)
% LucamGetCameraId - Returns the camera model number.
try
    dID = LuDispatcher(59, cameraNum);
catch ME
    rethrow(ME);
end    
camID = dec2hex(dID, 3);
