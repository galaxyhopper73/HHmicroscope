function LucamHidePreview(cameraNum)
% LucamHidePreview - Hides/closes the currently open video preview.
try
    LuDispatcher(1, cameraNum);
catch ME
    rethrow(ME);
end    
