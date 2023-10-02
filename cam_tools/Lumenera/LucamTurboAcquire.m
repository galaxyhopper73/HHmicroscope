function LucamTurboAcquire(cameraNum)
% LucamAcquire - Acquires one or many frames very fast.
try
    LuDispatcher(104, cameraNum);
catch ME
    rethrow(ME);
end    
