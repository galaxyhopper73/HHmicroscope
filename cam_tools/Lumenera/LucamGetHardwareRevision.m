% Note - This will only succeed with the latest version of the driver.
function [revision] = LucamGetHardwareRevision(cameraNum)
try
    revision = LuDispatcher(94, cameraNum);
catch ME
    rethrow(ME);
end    
