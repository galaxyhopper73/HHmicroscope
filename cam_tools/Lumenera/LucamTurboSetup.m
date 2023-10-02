function LucamTurboSetup(cameraNum, numFrames)
% LucamTurboSetup - Allocates <numFrames> buffers for use in the LucamTurboAcquire function.
try
    LuDispatcher(103, cameraNum, numFrames);
catch ME
    rethrow(ME);
end    
