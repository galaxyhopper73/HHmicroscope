function LucamSetUseStrobe(flag, cameraNum)
% LucamSetUseStrobe - Enables or disables the strobe pulse output when taking snapshots.
try
    LuDispatcher(22, cameraNum, flag);
catch ME
    rethrow(ME);
end    
