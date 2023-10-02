function [frame] = LucamCaptureFrame(cameraNum)
% LucamCaptureFrame - Captures a single video frame.
try
    frame = LuDispatcher(7, cameraNum);
catch ME
    rethrow(ME);
end    
