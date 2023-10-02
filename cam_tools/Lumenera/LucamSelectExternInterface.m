function LucamSelectExternInterface(interface)
% LucamSelectExternInterface - Selects the camera interface to use.
try
    LuDispatcher(100, interface);
catch ME
    rethrow(ME);
end    
