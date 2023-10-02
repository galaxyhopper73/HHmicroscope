function [contrast] = LucamGetContrast(cameraNum)
% LucamGetContrast - Returns the current contrast value.
try
    propInfo = LucamGetProperty(1,cameraNum);
    contrast = propInfo.Value;
catch ME
    rethrow(ME);
end    
