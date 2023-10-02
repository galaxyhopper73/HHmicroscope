function LucamDisplayVideoFormatPage(cameraNum)
% LucamDisplayVideoFormatPage - Displays the video's format.
try
    LuDispatcher(95, cameraNum);
catch ME
    rethrow(ME);
end    
