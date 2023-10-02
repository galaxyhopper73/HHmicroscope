function LucamSetHue(hue, cameraNum)
% LucamSetHue - Sets the hue value.
try
    propId = 2;
    propInfo = LucamGetProperty(propId, cameraNum);
    propInfo.Value = hue;
    LucamSetProperty(propInfo, cameraNum);
catch ME
    rethrow(ME);
end    
