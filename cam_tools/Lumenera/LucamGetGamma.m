function [gamma] = LucamGetGamma(cameraNum)
% LucamGetGamma - Returns the current gamma value.
try
    propInfo = LucamGetProperty(5,cameraNum);
    gamma = propInfo.Value;
catch ME
    rethrow(ME);
end    
