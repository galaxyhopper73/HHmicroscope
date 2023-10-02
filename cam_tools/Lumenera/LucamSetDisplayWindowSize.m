function LucamSetDisplayWindowSize(cameraNum, width, height)
%LucamSetDisplayWindowSize - Sets the size of the preview window.
try
    LuDispatcher(79, cameraNum, width, height);
catch ME
    rethrow(ME);
end    
