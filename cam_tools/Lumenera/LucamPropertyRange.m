function [min, max] = LucamPropertyRange(property, cameraNum)
% - LucamPropertyRange - Returns the property's valid range of values.
try
    range = LucamGetPropertyRange(property, cameraNum);
    %range = LuDispatcher(51, cameraNum, property);
    min = range.Min;
    max = range.Max;
catch ME
    rethrow(ME);
end    
