function LucamSetStrobeDelay(delay, cameraNum)
% LucamSetStrobeDelay - Sets the length of time to delay the strobe output from the snapshot trigger input.
try
    propId = 56;
    propInfo = LucamGetProperty(propId, cameraNum);
    propInfo.Value = delay;
    LucamSetProperty(propInfo, cameraNum);
catch ME
    rethrow(ME);
end    
