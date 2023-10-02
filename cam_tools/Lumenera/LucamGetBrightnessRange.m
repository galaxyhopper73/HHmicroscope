% Call as such: [min,max] = LucamGetBrightnessRange(<cameraNum>);
function [min, max] = LucamGetBrightnessRange(cameraNum)
% - LucamGetBrightnessRange - Returns the valid range of brighness values.
try
    range = LucamGetPropertyRange(0, cameraNum);
    min = range.Min;
    max = range.Max;
catch ME
    rethrow(ME);
end    
