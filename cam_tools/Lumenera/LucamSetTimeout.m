function LucamSetTimeout(timeout, still, cameraNum)
% LucamSetTimeout - Sets the video or snapshot's timeout value.
% - still must be a boolean
try
    LuDispatcher(91, cameraNum, still, timeout);
catch ME
    rethrow(ME);
end    
