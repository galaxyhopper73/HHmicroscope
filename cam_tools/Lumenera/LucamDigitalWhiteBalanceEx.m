function LucamDigitalWhiteBalanceEx(height, width, startY, startX, blueOverGreen, redOverGreen, cameraNum)
% LucamDigitalWhiteBalanceEx - Performs one shot auto-white balance.
try
    LuDispatcher(68, cameraNum, redOverGreen, blueOverGreen, startX, startY, width, height);
catch ME
    rethrow(ME);
end    
