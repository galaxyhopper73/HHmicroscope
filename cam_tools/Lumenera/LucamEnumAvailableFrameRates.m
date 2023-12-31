function [frameRateList] = LucamEnumAvailableFrameRates(cameraNum)
% LucamEnumAvailableFrameRates - Lists the frame rates supported by the camera.
try
    frameRateList = LuDispatcher(4, cameraNum);
catch ME
    rethrow(ME);
end    
