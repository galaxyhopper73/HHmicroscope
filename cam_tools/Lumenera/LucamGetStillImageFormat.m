function [stillFormat] = LucamGetStillImageFormat(cameraNum)
try
    stillFormat = LuDispatcher(98, cameraNum);
catch ME
    rethrow(ME);
end    
