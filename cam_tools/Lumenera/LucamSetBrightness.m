function LucamSetBrightness(brightness, cameraNum)
% LucamSetBrightness - Sets the brightness value.
try
    propId = 0;
    propInfo = LucamGetProperty(propId, cameraNum);
    propInfo.Value = brightness;
    LucamSetProperty(propInfo, cameraNum);
catch ME
    rethrow(ME);
end    
