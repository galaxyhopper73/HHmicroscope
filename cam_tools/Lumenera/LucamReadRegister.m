function [register] = LucamReadRegister(cameraNum, address, numReg)
% LucamReadRegister - Reads <numReg> values at <address> register.
try
    register = LuDispatcher(116, cameraNum, address, numReg);
catch ME
    rethrow(ME);
end    
