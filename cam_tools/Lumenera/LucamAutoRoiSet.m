function LucamAutoRoiSet(startX, startY, width, height, cameraNum)
%LucamAutoRoiSet - Sets the parameters for the camera's region of interest.
try
    LuDispatcher(85, cameraNum, startX, startY, width, height);
catch ME
    rethrow(ME);
end    

