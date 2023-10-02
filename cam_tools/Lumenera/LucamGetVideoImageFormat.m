function [videoFormat] = LucamGetVideoImageFormat(cameraNum)
try
    videoFormat = LuDispatcher(99, cameraNum);
catch ME
    rethrow(ME);
end    
