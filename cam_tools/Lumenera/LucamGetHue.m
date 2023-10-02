function [hue] = LucamGetHue(cameraNum)
% LucamGetHue - Returns the current hue value.
try
    propInfo = LucamGetProperty(2,cameraNum);
    hue = propInfo.Value;
catch ME
    rethrow(ME);
end    
