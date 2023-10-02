function [prop] = LucamGetProperty(property, cameraNum)
% LucamGetProperty - Returns the current property information structure.
try
    prop = LuDispatcher(39, cameraNum, property);
catch ME
    rethrow(ME);
end    
