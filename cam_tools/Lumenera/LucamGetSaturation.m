function [saturation] = LucamGetSaturation(cameraNum)
% LucamGetSaturation - Returns the current saturation value.
try
    propInfo = LucamGetProperty(3,cameraNum);
    saturation = propInfo.Value;
catch ME
    rethrow(ME);
end    
