function [min, max] = LucamGetHueRange(cameraNum)
% - LucamGetHueRange - Returns the valid range of hue values.
try
    range = LucamGetPropertyRange(2, cameraNum);
    min = range.Min;
    max = range.Max;
catch ME
    rethrow(ME);
end    
