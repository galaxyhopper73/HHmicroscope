% Call as such: [min,max] = LucamGetGainRange(<cameraNum>);
function [min, max] = LucamGetGainRange(cameraNum)
% - LucamGetGainRange - Returns the valid range for gain values.
try
    range = LucamGetPropertyRange(40, cameraNum);
    min = range.Min;
    max = range.Max;
catch ME
    rethrow(ME);
end    
