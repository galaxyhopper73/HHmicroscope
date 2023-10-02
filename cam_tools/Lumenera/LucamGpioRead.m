function [gpioRead] = LucamGpioRead(cameraNum)
% LucamGpioRead - Reads the current values on the GPI port.
try
    gpioRead = LuDispatcher(34, cameraNum);
catch ME
    rethrow(ME);
end    
