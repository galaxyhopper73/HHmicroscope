function LucamSetGamma(gamma, cameraNum)
% LucamSetGamma - Sets the gamma value.
try
    propId = 5;
    propInfo = LucamGetProperty(propId, cameraNum);
    propInfo.Value = gamma;
    LucamSetProperty(propInfo, cameraNum);
catch ME
    rethrow(ME);
end    
