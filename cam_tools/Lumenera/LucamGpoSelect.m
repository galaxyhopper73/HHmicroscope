function LucamGpoSelect(cameraNum, gpoEnable)
% LucamGpoSelect - Enables or disables manual toggling of GPO ports.
try
    LuDispatcher(36, cameraNum, gpoEnable);
catch ME
    rethrow(ME);
end    
