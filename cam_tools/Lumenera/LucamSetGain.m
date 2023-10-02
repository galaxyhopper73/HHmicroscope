function LucamSetGain(gain, cameraNum)
% LucamSetGain - Sets the gain value for video mode.
try
    propId = 40;
    propInfo = LucamGetProperty(propId, cameraNum);
    propInfo.Value = gain;
    LucamSetProperty(propInfo, cameraNum);catch ME
    rethrow(ME);
end    
