function LucamSetExposure(exposure, cameraNum)
% LucamSetExposure - Sets the exposure value in video mode.
try
    propId = 20;
    propInfo = LucamGetProperty(propId, cameraNum);
    propInfo.Value = exposure;
    LucamSetProperty(propInfo, cameraNum);
catch ME
    rethrow(ME);
end    
