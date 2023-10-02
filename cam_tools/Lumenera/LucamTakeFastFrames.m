function [frames] = LucamTakeFastFrames (numFrames, cameraNum)
%LucamTakeFastFrames - Take multiple fast frames.
try
    frames = LuDispatcher(87, cameraNum, numFrames);

catch ME
    rethrow(ME);
end    
