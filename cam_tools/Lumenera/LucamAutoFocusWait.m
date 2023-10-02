function LucamAutoFocusWait(timeout, cameraNum)
% LucamAutoFocusWait - Waits for the auto-focus to complete. Returns when auto-focus is complete or when timeout is reached. Timeout is in ms.
try
    LuDispatcher(72, cameraNum, timeout);
catch ME
    rethrow(ME);
end    
