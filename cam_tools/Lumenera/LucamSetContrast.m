function LucamSetContrast(contrast, cameraNum)
% LucamSetContrast - Sets the contrast value.
try
    propId = 1;
    propInfo = LucamGetProperty(propId, cameraNum);
    propInfo.Value = contrast;
    LucamSetProperty(propInfo, cameraNum);
catch ME
    rethrow(ME);
end    
