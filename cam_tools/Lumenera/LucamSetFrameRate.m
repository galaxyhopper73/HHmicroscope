function LucamSetFrameRate(fps, cameraNum)
% LucamSetFrameRate - Sets the video frame rate.
try
    LuDispatcher(3, cameraNum, fps);
catch ME
    rethrow(ME);
end    
