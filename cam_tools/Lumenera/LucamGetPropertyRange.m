% Call as such: [min,max] = LucamGetPropertyRange(<property>,<cameraNum>);
function [propInfoStruct] = LucamGetPropertyRange(property, cameraNum)
% - LucamGetPropertyRange - Returns the property's valid range of values.
try
    propInfoStruct= LuDispatcher(51, cameraNum, property);
catch ME
    rethrow(ME);
end    
