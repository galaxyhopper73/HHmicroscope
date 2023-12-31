function LucamPermanentBufferWrite(offset, buffer, cameraNum)
%LucamPermanentBufferWrite - Writes the given buffer to the camera's
%internal buffer.
try
    LuDispatcher(97, cameraNum, offset, buffer);
catch ME
    rethrow(ME);
end    
