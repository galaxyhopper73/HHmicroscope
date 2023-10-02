function LucamGpioWrite(cameraNum, gpioWrite)
% LucamGpioWrite - Writes a value to the GPO port.
try
    LuDispatcher(35, cameraNum, gpioWrite);
catch ME
    rethrow(ME);
end    
