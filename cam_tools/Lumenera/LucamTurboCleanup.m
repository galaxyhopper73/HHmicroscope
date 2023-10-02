function LucamTurboCleanup(cameraNum)
% LucamTurboCleanup - Deallocates the frames taken with LucamTurboAcquire.
try
    LuDispatcher(106, cameraNum);
catch ME
    rethrow(ME);
end    
