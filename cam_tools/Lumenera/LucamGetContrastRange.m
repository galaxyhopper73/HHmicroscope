% Call as such: [min,max] = LucamGetContrastRange(<cameraNum>);
function [min, max] = LucamGetContrastRange(cameraNum)
% - LucamGetContrastRange - Returns the valid range of contrast values.
try
    range = LucamGetPropertyRange(1, cameraNum);
    min = range.Min;
    max = range.Max;
catch ME
    rethrow(ME);
end    
