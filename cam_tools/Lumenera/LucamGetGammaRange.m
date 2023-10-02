% Call as such: [min,max] = LucamGetGammaRange(<cameraNum>);
function [min, max] = LucamGetGammaRange(cameraNum)
% - LucamGetGammaRange - Returns the valid range for gamma values.
try
    range = LucamGetPropertyRange(5, cameraNum);
    min = range.Min;
    max = range.Max;
catch ME
    rethrow(ME);
end    
