function LucamShowPreview(cameraNum)
% LucamShowPreview - Opens a window for video preview.
try
    LuDispatcher(0, cameraNum);
catch ME
    rethrow(ME);
end    
