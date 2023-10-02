% Call as such: [min,max] = LucamGetSaturationRange(<cameraNum>);
function [min, max] = LucamGetSaturationRange(cameraNum)
% - LucamGetSaturationRange - Returns the valid range for the saturation value.
try
    range = LucamGetPropertyRange(3, cameraNum);
    min = range.Min;
    max = range.Max;
catch ME
    rethrow(ME);
end    
