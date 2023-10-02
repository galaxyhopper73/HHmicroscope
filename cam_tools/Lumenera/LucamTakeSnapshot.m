function [snapshot] = LucamTakeSnapshot(cameraNum)
% LucamTakeSnapshot - Takes a snapshot using the predefined settings.
try
    snapshot = LuDispatcher(13, cameraNum);
catch ME
    rethrow(ME);
end    
