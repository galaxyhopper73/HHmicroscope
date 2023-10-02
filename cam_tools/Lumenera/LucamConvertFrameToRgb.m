function [frame] = LucamConvertFrameToRgb(cameraNum, rawImage)
% LucamConvertFrameToRgb - Converts a raw frame of data to an RGB frame.
% rawImage should be the structure give the the capture raw functions.
try
    frame = LuDispatcher(102, cameraNum, rawImage);
catch ME
    rethrow(ME);
end    
