function [exposure] = LucamGetSnapExposure(cameraNum)
% LucamGetSnapExposure - Returns the current snapshot exposure value.
try
    propInfo = LucamGetProperty(50,cameraNum);
    exposure = propInfo.Value;
catch ME
    rethrow(ME);
end    
