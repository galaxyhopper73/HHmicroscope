function [brightness] = LucamGetBrightness(cameraNum)
% LucamGetBrightness - Returns the current brightness value.
try
    propInfo = LucamGetProperty(0,cameraNum);
    brightness = propInfo.Value;catch ME
    rethrow(ME);
end    
