function LucamOneShotAutoIris(height, width, startY, startX, target, cameraNum)
% LucamOneShotAutoIris - Performs one shot auto-iris calculation.
try
    LuDispatcher(70, cameraNum, target, startX, startY, width, height);
catch ME
    rethrow(ME);
end    
