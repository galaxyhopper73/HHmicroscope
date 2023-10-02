function [frame] = LucamCaptureRawFrame(cameraNum)
% LucamCaptureFrame - Captures a single video frame.
try
    frame = LuDispatcher(76, cameraNum);
catch ME
    rethrow(ME);
end    
