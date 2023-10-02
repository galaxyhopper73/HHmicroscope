function LucamDisplayVideoProperties(cameraNum)
% LucamDisplayVideoProperties - Displays the camera's DirectX video properties dialog.
try
    LuDispatcher(5, cameraNum);
catch ME
    rethrow(ME);
end    
