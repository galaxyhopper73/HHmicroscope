function [frameformat] = LucamGetFormat(cameraNum)
%LucamGetFormat - Returns the current video frame format and frame rate set in the camera.
try
    frameformat = LuDispatcher(62, cameraNum);
catch ME
    rethrow(ME);
end    
