function LucamGpioConfigure(asGpo, cameraNum)
% LucamGpioConfigure - Configures a GPIO port to be either an input or output port.
try
    LuDispatcher(61, cameraNum, asGpo);
catch ME
    rethrow(ME);
end    
