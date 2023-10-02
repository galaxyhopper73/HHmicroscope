function [snapshot] = LucamGetSnapshot(cameraNum)
%LucamGetSnapshot - Returns the current snapshot structure use by the camera.
try
    snapshot = LuDispatcher(118, cameraNum);
catch ME
    rethrow(ME);
end    
