function [timeout] = LucamGetSnapTimeout(cameraNum)
% LucamGetSnapTimeout - Returns the current snapshot timeout value.
try
    timeout = LuDispatcher(115, cameraNum);
catch ME
    rethrow(ME);
end    
