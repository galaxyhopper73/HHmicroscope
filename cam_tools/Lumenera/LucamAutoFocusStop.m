function LucamAutoFocusStop(cameraNum)
% LucamAutoFocusStop - Stops an auto-focus request.
try
    LuDispatcher(73, cameraNum);
catch ME
    rethrow(ME);
end    

