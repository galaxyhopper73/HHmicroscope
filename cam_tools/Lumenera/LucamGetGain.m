function [gain] = LucamGetGain(cameraNum)
% LucamGetGain - Returns the current gain value.
try
    propInfo = LucamGetProperty(40,cameraNum);
    gain = propInfo.Value;
catch ME
    rethrow(ME);
end    
