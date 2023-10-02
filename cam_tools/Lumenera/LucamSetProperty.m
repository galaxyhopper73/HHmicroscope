function LucamSetProperty(propInfoStruct, cameraNum)
% LucamSetProperty - Sets the property to the value provided.
% use LucamGetProperty to see what the propINfoStruct look like.
try
    LuDispatcher(40, cameraNum, propInfoStruct);
catch ME
    rethrow(ME);
end    
