function LucamWriteRegister(cameraNum, address, numReg, values)
% LucamWriteRegister - Writes <numReg> values at <address> register.
try
    LuDispatcher(117, cameraNum, address, numReg, values);
catch ME
    rethrow(ME);
end    
