function LucamSetSaturation(saturation, cameraNum)
% LucamSetSaturation - Sets the saturation value.
try
    propId = 3;
    propInfo = LucamGetProperty(propId, cameraNum);
    propInfo.Value = saturation;
    LucamSetProperty(propInfo, cameraNum);
catch ME
    rethrow(ME);
end    
