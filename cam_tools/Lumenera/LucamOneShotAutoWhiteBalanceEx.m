function LucamOneShotAutoWhiteBalanceEx(height, width, startY, startX, blueOverGreen, redOverGreen, cameraNum)
% LucamOneShotAutoWhiteBalanceEx - Performs one shot auto-white balance.
try
    LuDispatcher(66, cameraNum, redOverGreen, blueOverGreen, startX, startY, width, height);
catch ME
    rethrow(ME);
end    
