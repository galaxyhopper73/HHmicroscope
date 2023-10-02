function [exposure] = LucamGetExposure(cameraNum)
% LucamGetExposure - Returns the current exposure value.
try
    propInfo = LucamGetProperty(20,cameraNum);
    exposure = propInfo.Value;
catch ME
    rethrow(ME);
end