function [delay] = LucamGetStrobeDelay(cameraNum)
% LucamGetStrobeDelay - Returns the current strobe delay value.
try
    propInfo = LucamGetProperty(56,cameraNum);
    delay = propInfo.Value;
catch ME
    rethrow(ME);
end    
