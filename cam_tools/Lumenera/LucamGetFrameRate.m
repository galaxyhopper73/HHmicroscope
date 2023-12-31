function [frame_rate] = LucamGetFrameRate(cameraNum)
%LucamGetFrameRate - Returns the current video frame rate value set in the camera.
try
    frame_rate = LuDispatcher(33, cameraNum);
catch ME
    rethrow(ME);
end    
