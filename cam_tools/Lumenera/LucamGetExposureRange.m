% Call as such: [min,max] = LucamGetExposureRange(<cameraNum>);
function [min, max] = LucamGetExposureRange(cameraNum)
% - LucamGetExposureRange - Returns the valid range of exposure values.
try
    range = LucamGetPropertyRange(20, cameraNum);
    min = range.Min;
    max = range.Max;
catch ME
    rethrow(ME);
end    
