function [frame] = LucamTurboProcess(cameraNum, frameIndex)
% LucamTurboProcess - Processes the given 1-based frameIndex into an RGB frame.
try
    frame = LuDispatcher(105, cameraNum, frameIndex);
catch ME
    rethrow(ME);
end    
