function [connectionFlag] = LucamIsConnected(cameraNum)
% LucamIsConnected - Queries if this camera is currently connected to your computer.
try
    connectionFlag = LuDispatcher(6, cameraNum);
catch ME
    rethrow(ME);
end    
