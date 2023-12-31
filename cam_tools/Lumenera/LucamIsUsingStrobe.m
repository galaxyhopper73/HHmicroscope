function [flag] = LucamIsUsingStrobe(cameraNum)
% LucamIsUsingStrobe - Queries if the snapshot strobe mode is enabled or disabled.
try
    flag = LuDispatcher(23, cameraNum);
catch ME
    rethrow(ME);
end    
