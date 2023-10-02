function LucamSet16BitSnapshot(flag, cameraNum)
% LucamSet16BitSnapshot - Enables or disables 16-bit snapshot captures.
try
    LuDispatcher(18, cameraNum, flag);
catch ME
    rethrow(ME);
end    
