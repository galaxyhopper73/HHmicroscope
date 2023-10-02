function LucamSetUseHwTrigger(flag, cameraNum)
% LucamSetUseHwTrigger - Enables or disabled the use of a HW trigger input for snapshot captures.
try
    LuDispatcher(26, cameraNum, flag);
catch ME
    rethrow(ME);
end    
